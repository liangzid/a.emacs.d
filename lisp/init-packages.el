(require 'cl)

;; (when (>= emacs-major-version 24)
;;  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;  )
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line



;;add whatever packages you want here
(defvar my/packages '(
				;;;;;;;;;;;;tool;;;;;;;;;;;;;;
				 company
				 hungry-delete
				 swiper
				 counsel
				 smartparens ;; 补全括号等成对出现的东西
				 use-package
				 undo-tree
				 which-key
				 neotree
				 smart-tab
				 yasnippet
				 all-the-icons
				 ;;提供各种类型文字模板的自动补全以供使用.

                                 ;;;;;;;;;;;;;python;;;;;;;;;;;;;;;;;
				 python
				 pyvenv
				 python-black
				 pyenv-mode
				 ;;;;;;;;;;;;;;;org;;;;;;;;;;;;;
				 org-bullets
				 org-alert
				 org-download
				 ;; org-install
				 ;; org-latex
				 


				 ;;ox-md
				 ;;ox-publish
				 htmlize
				 
				 exec-path-from-shell
				 popwin
				;;;;;;;;;;;;;theme;;;;;;;;;;;;;
				 monokai-theme
				 rainbow-mode
				 rainbow-delimiters
                                ;;;;;;;;;;;;;;;latex;;;;;;;;;;;;;;;
				 auctex
				 cdlatex
				 
				 )  "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; let emacs could find the execuable
;;(when (memq window-system '(mac ns))
;;  (exec-path-from-shell-initialize))

(require 'smartparens)
(require 'smartparens-config)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; config for yasnippet.
(setq yas-snippet-dirs              ;;设置模板存放的地址.
      '("~/.emacs.d/snippets"))

(yas-global-mode 1)





(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)




(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)


;; undo tree
(require 'use-package)
(use-package undo-tree
  :ensure t
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))

;; display keybindings
(use-package which-key
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-bottom)))

;; tree
(use-package neotree
  :config
  (progn
    (setq neo-smart-open t)
    ;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq neo-window-fixed-size nil)
    ;; (setq-default neo-show-hidden-files nil)
    (global-set-key [f3] 'neotree-toggle)
    (global-set-key [f4] 'neotree-dir)))

;; smart TAB
(use-package smart-tab
  :config
  (progn
    (defun @-enable-smart-tab ()
      (smart-tab-mode))
    (add-hook 'prog-mode-hook '@-enable-smart-tab)
    ))

;; for python.
(use-package python
  :mode ("\\.py" . python-mode)
  :ensure t)

(use-package pyvenv)

(use-package python-black
  :demand t
  :after python
  :config
  (python-black-on-save-mode))

(use-package pyenv-mode
  :init
  (add-to-list 'exec-path "~/.pyenv/shims")
  (setenv "WORKON_HOME" "~/.pyenv/versions/")
  :config
  (pyenv-mode))



;; theme
(load-theme 'monokai t)
(add-hook 'prog-mode-hook (rainbow-mode t))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode-enable)



(provide 'init-packages)
