;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this file is for the elpa related configs.
;; zi liang. 2021.03.25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;(if (< emacs-major-version 27)
;  (package-initialize))
(package-initialize)
;; 防止出现签名校验失败的问题
(setq package-check-signature nil)

;;add whatever packages you want here

(defvar my/packages '(
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
				 evil ;;众所周知？
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

(provide 'init-elpa)

