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






(provide 'init-keybindings)
