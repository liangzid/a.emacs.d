(require 'cl)
(require 'use-package)
(my/install-package-if-not-found 'orderless)
(my/install-package-if-not-found 'company-box)
(my/install-package-if-not-found 'company-prescient)
(my/install-package-if-not-found 'gt)
(my/install-package-if-not-found 'magit)

;; (my/install-package-if-not-found 'exec-path-from-shell)

;; (require 'exec-path-from-shell)

;; (exec-path-from-shell-initialize)

(command-log-mode 1)

;; Configure the translation.
(use-package gt
  :ensure t
  :defer t                    ; 不立即加载
  :custom
  (gt-langs '(en zh))
  (gt-default-translator
   (gt-translator :engines (gt-bing-engine)
		  :taker (gt-taker :langs '(en zh) :text 'word :prompt nil)
                  :render (gt-posframe-pop-render)
		  ))
  :bind ("C-c y" . gt-translate))


(require 'projectile)
(projectile-mode 1)
;; ;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; ;; 自动补全
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'company)
(setq company-idle-delay 0.04)
(setq company-minimum-prefix-length 1)
(add-hook 'latex-mode-hook
	  (lambda ()
	    (setq-local company-minimum-prefix-length 5)
	    ))
(setq company-show-numbers t)
(setq company-tooltip-limit 8)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)
(setq company-require-match nil)
(setq company-global-modes '(not sh-mode))
(global-company-mode)
;; 暂时关闭 COMPANY MODE

;; (setq company-auto-complete-chars '((kbd "TAB")))
;; (define-key company-active-map (kbd "RET") nil)
;; (define-key company-active-map (kbd "[return]") nil)

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
(use-package smart-tab
  :config
  (progn
      (global-smart-tab-mode)
    ))


;; (require 'company-english-helper)
;; (setq company-english-helper-active-p nil)
;; (global-set-key (kbd "C-c e") 'toggle-company-english-helper)

(provide 'init-packages)
