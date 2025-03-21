(tool-bar-mode -1)
(when (display-graphic-p)
(scroll-bar-mode -1)
  )
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 不蜂鸣
(setq ring-bell-function 'ignore)

;; 自动还原模式
(global-auto-revert-mode t)

;; 显示行号
;; unsupport for emacs 29
(if (version< emacs-version "29")
    (global-linum-mode t)
  (global-display-line-numbers-mode 1)
    )

;; ;; 使用缩写，缩写表如下图所示。
;; (abbrev-mode t)
;;  (define-abbrev-table 'global-abbrev-table '(
;;                                               ("lz" "liangzi")
;;                                               ("lzd" "liangzid")
;;                                               ("zi" "Zi Liang")
;;                                               ("qq" "2273067585")
;;                                               ("qqmail" "2273067585@qq.com")
;;                                               ))

(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

;; 设置拼写检查
;; (setq ispell-program-name "aspell")
;; (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together" "--run-together-limit=16"))

;; (add-hook 'prog-mode-hook #'wucuo-start)
;; (add-hook 'text-mode-hook #'wucuo-start)

;; (setq wucuo-spell-check-buffer-predicate
      ;; (lambda ()
	;; (not (memq major-mode
		   ;; '(dired-mode
		     ;; log-edit-mode
		     ;; compilation-mode
		     ;; help-mode
		     ;; profiler-report-mode
		     ;; speedbar-mode
		     ;; gud-tooltip-mode
		     ;; calc-mode
		     ;; Info-mode)))))

;; 不进行文件备份
(setq make-backup-files nil)

;; 不进行自动保存
(setq auto-save-default nil)

;; (global-hl-line-mode 1)

;; 设置打开10个最近文件列表
(recentf-mode 1)			
(setq recentf-max-menu-items 30)

;; 自动括号补全？
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 可以通过键入字符代替被选中的对象，或者键入删除删除被选中的对象。
(delete-selection-mode t)

;; setting tabs.
;;(setq tab-always-indent nil)

(if (version< "29" emacs-version)
    (progn

      ; set pixel scroll
      (pixel-scroll-precision-mode 1)
      (setq pixel-scroll-precision-interpolate-page t)
      (defalias 'scroll-up-command 'pixel-scroll-interpolate-down)
      (defalias 'scroll-down-command 'pixel-scroll-interpolate-up)

	; solve the problem of xref
      ;;?
      (setq xref-history-storage 'xref-window-local-history)

      ;; (display-line-numbers-mode)

      ))


(provide 'init-better-defaults)
