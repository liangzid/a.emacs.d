(require 'cl)
(require 'use-package)

(command-log-mode 1)

(use-package youdao-dictionary
  :config
  (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+))


(require 'projectile)
(projectile-mode +1)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;;;
  ;; 评价：适合自己写库的人使用，目前感觉还不是很好用，就不多做评论了
;;;;;

;; (require 'citre-config)
;; (use-package citre
;;   :defer t
;;   :init
;;   ;; This is needed in `:init' block for lazy load to work.
;;   ;; Bind your frequently used commands.
;;   (global-set-key (kbd "C-x c j") 'citre-jump)
;;   (global-set-key (kbd "C-x c J") 'citre-jump-back)
;;   (global-set-key (kbd "C-x c p") 'citre-ace-peek)
;;   :config
;;   (setq
;;    ;; Set this if readtags is not in your path.
;;    ;; citre-readtags-program "/home/liangzi/.emacs.d/.tags"
;;    ;; Set this if you use project management plugin like projectile.  It's
;;    ;; only used to display paths relatively, and doesn't affect actual use.
;;    ;; citre-project-root-function #'projectile-project-root
;;    ))

;; 自动补全
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq company-idle-delay 0.01)
(setq company-show-numbers t)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)
(setq company-global-modes '(not shell-mode))
;; (setq company-auto-complete-chars '((kbd "TAB")))
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") #'company-select-next)
(define-key company-active-map (kbd "C-p") #'company-select-previous)
;; (define-key company-active-map (kbd "TAB") #'yas-expand)
(global-company-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; the windows you have used will be clear after used. 
(require 'popwin)
(popwin-mode t)


;; undo tree
(use-package undo-tree
  :ensure t
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))

;; display keybindings with which key
(use-package which-key
  :config
  (progn
    (which-key-mode)
    ;; (which-key-setup-side-window-bottom)
    ))

;; 项目文件的树状图
(use-package neotree
  :config
  (progn
    (setq neo-smart-open t)
    ;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq neo-window-fixed-size nil)
    ;; (setq-default neo-show-hidden-files nil)
    (global-set-key [f3] 'neotree-toggle)))

;; ;; smart TAB
;; (use-package smart-tab
;;   :config
;;   (progn
;;     (defun @-enable-smart-tab ()
;;       (smart-tab-mode))
;;     (add-hook 'prog-mode-hook '@-enable-smart-tab)
;;     ))

(require 'company-english-helper)
(setq company-english-helper-active-p nil)
(global-set-key (kbd "C-c e") 'toggle-company-english-helper)

(provide 'init-packages)
