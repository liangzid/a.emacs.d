(my/install-package-if-not-found 'winum)

(setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
      (define-key map (kbd "M-1") 'winum-select-window-1)
      (define-key map (kbd "M-2") 'winum-select-window-2)
      (define-key map (kbd "M-3") 'winum-select-window-3)
      (define-key map (kbd "M-4") 'winum-select-window-4)
      (define-key map (kbd "M-5") 'winum-select-window-5)
      (define-key map (kbd "M-6") 'winum-select-window-6)
      (define-key map (kbd "M-7") 'winum-select-window-7)
      (define-key map (kbd "M-8") 'winum-select-window-8)
      map))

(require 'winum)
(setq winum-format "%s")
(setq winum-mode-line-position 0)
(set-face-attribute 'winum-face nil
		    :foreground "DeepPink"
		    :underline "DeepPink"
		    :weight 'bold)
(winum-mode 1)

(provide 'init-window)
