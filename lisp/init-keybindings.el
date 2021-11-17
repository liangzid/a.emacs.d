;; 关于快捷键绑定的一些东西。

;; some key-bindings past.
(global-set-key (kbd "C-\\") 'comment-line) ;;用来注释的

(global-set-key (kbd "M-0") 'next-multiframe-window)
(global-set-key (kbd "M-9") 'previous-multiframe-window)

;; (require 'use-package)
;; ;; (use-package meow
;; ;;   :demand t
;; ;;   :init
;; ;;   (meow-global-mode 1)
;; ;;   :config
;; ;;   ;; self-design key-bindings
;; ;;   (meow-setup)
;; ;;   ;; 如果你需要在 NORMAL 下使用相对行号（基于 display-line-numbers-mode）
;; ;;   (meow-setup-line-number)
;; ;;   ;; 如果你需要自动的 mode-line 设置（如果需要自定义见下文对 `meow-indicator' 说明）
;; ;;   (meow-setup-indicator))

;; (use-package meow
;;   :demand t
;;   :init
;;   (meow-global-mode 1)
;;   :config
;;   ;; meow-setup is your custom function, see below
;;   (meow-setup)
;;   ;; If you want relative line number in NORMAL state(for display-line-numbers-mode)
;;   (meow-setup-line-number)
;;   )


;;; search and replace with ivy-counsel-swiper
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ivy)
;; (require counsel)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper) ;; 在进行C-s时提供一个candidate
(global-set-key (kbd "C-c C-r") 'ivy-resume)  ;; 不知道是干什么的。
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-h C-k") 'find-function-on-key)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;; add keybindings for better debug emacs lisp files.
(defun lz/load-current-file ()
  (interactive)
  (load-file (buffer-name)))

(add-hook 'elisp-byte-code-mode-hook '(lambda () (local-set-key (kbd "<f10>") 'lz/load-current-file)))

;; (add-hook 'web-mode-hook '(lambda() (local-set-key (kbd "M-e") 'emmet-expand-yas)))

;;(load-file "init-keybindings.el")

;;(equal "init-keybindings.el" (buffer-name))


;;(buffer-name)

(provide 'init-keybindings)
