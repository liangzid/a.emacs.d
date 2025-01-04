(require 'cl)
(require 'use-package)
(my/install-package-if-not-found 'orderless)
(my/install-package-if-not-found 'company-box)
(my/install-package-if-not-found 'company-prescient)
(my/install-package-if-not-found 'go-translate)

;; (my/install-package-if-not-found 'exec-path-from-shell)

;; (require 'exec-path-from-shell)

;; (exec-path-from-shell-initialize)


(command-log-mode 1)

;; Configure the translation.
(require 'go-translate)
(setq gt-langs '(en zh))
(setq gt-default-translator
      (gt-translator :engines (gt-bing-engine)
		     :render (gt-posframe-pop-render)))
(global-set-key (kbd "C-c y") 'gt-do-translate)


(require 'projectile)
(projectile-mode 1)
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

;; (require 'orderless)
;; (setq completion-styles '(orderless))
;; (setq orderless-component-separator "[ &]")

;; (defun just-one-face (fn &rest args)
;;   (let ((orderless-match-faces [completions-common-part]))
;;     (apply fn args)))

;; (advice-add 'company-capf--candidates :around #'just-one-face)
;; ;; 自动补全
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(add-hook 'latex-mode-hook
	  (lambda ()
	    (setq-local company-minimum-prefix-length 5)
	    ))
(setq company-show-numbers t)
(setq company-tooltip-limit 15)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)
(setq company-require-match nil)
(setq company-global-modes '(not sh-mode))
;; 暂时关闭 COMPANY MODE

;; (setq company-auto-complete-chars '((kbd "TAB")))
(define-key company-active-map (kbd "RET") nil)
(define-key company-active-map (kbd "[return]") nil)
;; (define-key company-active-map (kbd "TAB") #'company-complete-selection)
;; (define-key company-active-map (kbd "<tab>")
	    ;; #'company-complete-selection)
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") #'company-select-next)
(define-key company-active-map (kbd "C-p") #'company-select-previous)

(require 'company-box)
(company-box-mode 1)
(setq company-box-show-single-candidate t)
(setq company-box-frame-behavior 'point)
(setq company-box-icons-alist 'company-box-icons-all-the-icons)
(setq company-box-max-candidates 10)
(setq company-box-icon-right-margin 0.5)
(add-hook 'company-mode-hook 'company-box-mode)

(use-package company-prescient
  :after company
  :config
  (company-prescient-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; the windows you have used will be clear after used. 
(require 'popwin)
(popwin-mode t)



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
    (global-set-key [f3] 'neotree-toggle)
    (setq neo-theme (if *is-gui* 'icons 'arrow))))

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
