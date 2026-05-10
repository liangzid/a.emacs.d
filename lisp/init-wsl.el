
(defun wsl-copy-region-to-clipboard (start end)
  "Copy region to Windows clipboard."
  (interactive "r")
  (call-process-region start end "clip.exe" nil 0))

(defun wsl-cut-region-to-clipboard (start end)
  (interactive "r")
  (call-process-region start end "clip.exe" nil 0)
  (kill-region start end))

(defun wsl-my-yank-image-from-win-clipboard-through-powershell()
  "to simplify the logic, use c:/Users/Public as temporary directoy, and move it into current directoy"
  (interactive)
  (let* ((powershell "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe")
         (file-name (format-time-string "screenshot_%Y%m%d_%H%M%S.png"))
         ;; (file-path-powershell (concat "c:/Users/\$env:USERNAME/" file-name))
         (file-path-wsl (concat "./images/" file-name))
         )
    ;; (shell-command (concat powershell " -command \"(Get-Clipboard -Format Image).Save(\\\"C:/Users/\\$env:USERNAME/" file-name "\\\")\""))
    (shell-command (concat powershell " -command \"(Get-Clipboard -Format Image).Save(\\\"C:/Users/Public/" file-name "\\\")\""))
    (rename-file (concat "/mnt/c/Users/Public/" file-name) file-path-wsl)
    (insert (concat "[[file:" file-path-wsl "]]"))
    (message "insert DONE.")
    ))

(defun linux-my-yank-image-through-bash()
  "自动检测 Wayland/X11 环境并从剪贴板粘贴图片到 Org-mode。"
  (interactive)
  (let* ((file-name (format-time-string "screenshot_%Y%m%d_%H%M%S.png"))
         (dir "./images/")
         (file-path (concat dir file-name))
         ;; 检测环境：如果有 WAYLAND_DISPLAY 则使用 wl-paste，否则使用 xclip
         (command (if (getenv "WAYLAND_DISPLAY")
                      (format "wl-paste -t image/png > %s" file-path)
                    (format "xclip -selection clipboard -t image/png -o > %s" file-path))))

    ;; 确保目录存在
    (unless (file-directory-p dir)
      (make-directory dir t))

    ;; 执行命令并检查退出状态 (0 表示成功)
    (if (= 0 (shell-command command))
        (progn
          (insert (concat "[[file:" file-path "]]"))
          (message "图片已插入: %s" file-path))
      ;; 如果失败（通常是剪贴板没图片），删除可能产生的空文件并提示
      (progn
        (when (file-exists-p file-path)
          (delete-file file-path))
        (error "剪贴板中没有可用的 PNG 图片！")))))




;; (defun linux-my-yank-image-through-bash ()
;;   "把剪贴板里的 PNG 或 JPEG 落到 ./images/ 并插入 org 链接。"
;;   (interactive)
;;   (let* ((img-dir  (expand-file-name "./images/"))
;;          (targets  (downcase           ; 统一小写
;;                     (shell-command-to-string
;;                      "xclip -selection clipboard -t TARGETS 2>/dev/null")))
;;          (png-p    (string-match-p "image/png"  targets))
;;          (jpg-p    (string-match-p "image/jpeg" targets))
;;          (ext      (cond (png-p "png") (jpg-p "jpg") (t nil)))
;;          (basename (format-time-string (concat "clip_%Y%m%d_%H%M%S." ext)))
;;          (img-path (concat (file-name-as-directory img-dir) basename)))
;;     (message targets)
;;     (unless ext
;;       (user-error "剪贴板里没找到 PNG/JPEG 图片"))
;;     (unless (file-directory-p img-dir)
;;       (make-directory img-dir t))
;;     ;; 写出文件
;;     (shell-command
;;      (format "xclip -selection clipboard -t image/%s -o > %s"
;;              ext (shell-quote-argument img-path)))
;;     (insert (format "[[file:%s]]" img-path))
;;     (message "已插入 %s 图片：%s" (upcase ext) img-path)))

(defun win10-my-yank-image-from-win-clipboard-through-powershell()
  "to simplify the logic, use c:/Users/Public as temporary directoy, and move it into current directoy"
  (interactive)
  (let* ((powershell "c:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe")
         (file-name (format-time-string "screenshot_%Y%m%d_%H%M%S.png"))
         ;; (file-path-powershell (concat "c:/Users/\$env:USERNAME/" file-name))
         (file-path-wsl (concat "./images/" file-name))
         )
    ;; (shell-command (concat powershell " -command \"(Get-Clipboard -Format Image).Save(\\\"C:/Users/\\$env:USERNAME/" file-name "\\\")\""))
    (shell-command (concat powershell " -command \"(Get-Clipboard -Format Image).Save(\\\"C:/Users/Public/" file-name "\\\")\""))
    (rename-file (concat "c:Users/Public/" file-name) file-path-wsl)
    (insert (concat "[[file:" file-path-wsl "]]"))
    (message "insert DONE.")
    ))

(defun my-yank-image-from-win-clipboard-through-powershell()
  (interactive)
  (if *is-windows*
      (win10-my-yank-image-from-win-clipboard-through-powershell)
    (if *is-wsl*
    (wsl-my-yank-image-from-win-clipboard-through-powershell)
    (if *is-gui*
	(linux-my-yank-image-through-bash)
      )
	)
    )
  )


(defun my-open-windows-downloads()
  "open directory ``Downloads'' in Windows Systems."
  (interactive)
  (counsel-find-file "/mnt/d/Downloads/"))

(provide 'init-wsl)
