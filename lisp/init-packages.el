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
		      company  ;; 用于进行自动补全
		      ;; lsp-mode ;;emacs下的lsp协议库(language server protocol)
		      ;; company-lsp ;;一种company后端
		      ;; lsp-ui   ;; 提供一些诸如flycheck的功能
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
				 ace-flyspell
				 ;; tramp ;;远程连接,无法使用，且有巨大缺陷！！！！！！
				 ;;quelpa 一个包管理工具，不再进行使用。
				 ;;提供各种类型文字模板的自动补全以供使用.

                                 ;;;;;;;;;;;;;python;;;;;;;;;;;;;;;;;
				 python
				 pyvenv ;;需要和pipenv 联合使用
				 python-black
				 pyenv-mode
				 anaconda-mode
				 company-anaconda ;;为company提供的anaconda后台
				 
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

				 ;;;;;;;;;version control;;;;;;;;;;
				 magit
				 
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;安装一种新的包管理工具straight,需要电脑上内置git;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 5))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))


;; ;; 增加语音小姐姐功能 需要使用straight-use-package
;; (straight-use-package
;;  '(rainbow-fart :host  github
;;                 :repo  "DogLooksGood/rainbow-fart.el"
;;                 :files ("*.el" "voice")))
;; (require 'rainbow-fart)

;; (rainbow-fart-mode 1)
;; (rainbow-fart-mode t)


;; 设置自动断行功能
(global-visual-line-mode 1)


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


;; ;; 激活高亮当前行的功能
;; (use-package hl-line
;;   :ensure nil
;;   :hook (after-init . global-hl-line-mode))

;; ;; 代码折叠 hideshow
;; (use-package hideshow
;;   :ensure nil
;;   :diminish hs-minor-mode
;;   :hook (prog-mode . hs-minor-mode))

;; ;;==================显示被隐藏的代码行数
;; ;; 这里额外启用了 :box t 属性使得提示更加明显
;; (defconst hideshow-folded-face '((t (:inherit 'font-lock-comment-face :box t))))

;; (defun hideshow-folded-overlay-fn (ov)
;;     (when (eq 'code (overlay-get ov 'hs))
;;       (let* ((nlines (count-lines (overlay-start ov) (overlay-end ov)))
;;              (info (format " ... #%d " nlines)))
;;         (overlay-put ov 'display (propertize info 'face hideshow-folded-face)))))

;; (setq hs-set-up-overlay 'hideshow-folded-overlay-fn)
;; ;; ===============================




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

;; 自动补全
(setq company-idle-delay nil)
(setq company-show-numbers t)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 0)
(setq company-tooltip-align-annotations t)
;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)

(setq company-global-modes '(not shell-mode))
(global-company-mode 1)




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

;; for python
(use-package python
  :mode ("\\.py" . python-mode)
  :ensure t)

;;(use-package pyvenv)

(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(use-package python-black
  :demand t
  :after python
  :config
  (python-black-on-save-mode))

;;(use-package pyenv-mode
;;  :init
;;  (add-to-list 'exec-path "~/.pyenv/shims")
;;  (setenv "WORKON_HOME" "~/.pyenv/versions/")
;;  :config
;;  (pyenv-mode))



;; theme
(load-theme 'monokai t)
(add-hook 'prog-mode-hook (rainbow-mode t))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode-enable)



(provide 'init-packages)
