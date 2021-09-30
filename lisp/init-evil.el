(my/install-package-if-not-found 'evil)
(my/install-package-if-not-found 'evil-escape)

;; 开启evil 模式
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; (setq evil-default-state 'emacs)

;; 设置C-d为ESC
(define-key evil-insert-state-map (kbd "C-d") 'evil-change-to-previous-state)
(define-key evil-normal-state-map (kbd "C-d") 'evil-force-normal-state)
(define-key evil-replace-state-map (kbd "C-d") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-d") 'evil-exit-visual-state)

;;; set evil key mode.
(require 'evil-leader)

(evil-leader/set-key
 "xf" 'find-file
 "xr" 'recentf-open-files
 "xb" 'switch-to-buffer
 "kb" 'kill-buffer
 "xc" 'save-buffers-kill-terminal
 "cy" 'youdao-dictionary
 "tce" 'toggle-company-english-helper
 "ac" 'ispell-buffer
 "fs" 'flyspell-mode
 "0" 'select-window-0
 "1" 'select-window-1
 "2" 'select-window-2
 "3" 'select-window-3
 "4" 'select-window-4
 "w/" 'split-window-right
 "w-" 'split-window-below
 ":" 'counsel-M-x
 "wM" 'delete-other-windows)

(evil-leader/set-leader "<SPC>")

(evil-leader-mode 1)



(provide 'init-evil)























