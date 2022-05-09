
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
  "Using scrot to make yank in linux, if you like."
  (interactive)
  (let* ((file-name (format-time-string "screenshot_%Y%m%d_%H%M%S.png"))
	 (file-path (concat "./images/" file-name))
	 )
    ;; xclip -selection clipboard -t TARGETS -o
    (shell-command (concat "xclip -selection clipboard -t image/png -o >" file-path))
    (insert (concat "[[file:" file-path "]]"))
    (message "insert DONE.")
    )
  )

(defun win10-my-yank-image-from-win-clipboard-through-powershell()
  "to simplify the logic, use c:/Users/Public as temporary directoy, and move it into current directoy"
  (interactive)
  (let* ((powershell "c:Windows/System32/WindowsPowerShell/v1.0/powershell.exe")
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
    (if *is-gui*
	(linux-my-yank-image-through-bash)
(wsl-my-yank-image-from-win-clipboard-through-powershell)
      )
    )
  )


(defun my-open-windows-downloads()
  "open directory ``Downloads'' in Windows Systems."
  (interactive)
  (counsel-find-file "/mnt/d/Downloads/"))

(provide 'init-wsl)
