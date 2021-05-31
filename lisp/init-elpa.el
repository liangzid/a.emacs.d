;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this file is for the elpa related configs.
;; zi liang. 2021.03.25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")))


;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;; 			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;; 			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))


;(if (< emacs-major-version 27)
;  (package-initialize))
(package-initialize)
;; 防止出现签名校验失败的问题
(setq package-check-signature nil)

;;add whatever packages you want here

(defvar my/packages '(
		                ;;;;;;dependency
				ctable
				deferred
				epc
				s		      
				;;;;;;;;;;;;tool;;;;;;;;;;;;;;
		                 company  ;; 用于进行自动补全
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
				 ace-flyspell ;; 拼写检查工具，但是需要ispell或者aspell的预先安装？！
				 wucuo ;;同样用来进行拼写检查

				 ;;metaweblog
				 ;;org2blog
				 
				 evil ;;众所周知？
                                 ;;;;;;;;;;;;;python;;;;;;;;;;;;;;;;;
				 python
				 pyvenv ;;需要和pipenv 联合使用
				 python-black
				 pyenv-mode
				 anaconda-mode
				 elpy
				 company-anaconda ;;为company提供的anaconda后台
				 
				 ;;;;;;;;;;;;;;;org;;;;;;;;;;;;;
				 org-bullets
				 org-alert
				 org-download
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



;;开启evil 模式
(use-package evil
  :ensure t
  :config
  (evil-mode 1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smartparens)
(require 'smartparens-config)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil) ;; 停止对单引号的smart补全
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode) ;;smartparens
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; config for yasnippet.
(setq yas-snippet-dirs              ;;设置模板存放的地址.
      '("~/.emacs.d/snippets"))

(yas-global-mode 1)

;; 代码折叠 hideshow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package hideshow
  :ensure nil
  :diminish hs-minor-mode
  :hook (prog-mode . hs-minor-mode))

;; 显示被隐藏的代码行数
;; 这里额外启用了 :box t 属性使得提示更加明显
(defconst hideshow-folded-face '((t (:inherit 'font-lock-comment-face :box t))))

(defun hideshow-folded-overlay-fn (ov)
    (when (eq 'code (overlay-get ov 'hs))
      (let* ((nlines (count-lines (overlay-start ov) (overlay-end ov)))
             (info (format " ... #%d " nlines)))
        (overlay-put ov 'display (propertize info 'face hideshow-folded-face)))))

(setq hs-set-up-overlay 'hideshow-folded-overlay-fn)
;; ===============================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-hungry-delete-mode)

;;; search and replace with ivy-counsel-swiper
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper) ;; 在进行C-s时提供一个candidate
(global-set-key (kbd "C-c C-r") 'ivy-resume)  ;; 不知道是干什么的。
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key (kbd "C-c p f") 'counsel-git) ; find file in current git repo.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





(provide 'init-elpa)

