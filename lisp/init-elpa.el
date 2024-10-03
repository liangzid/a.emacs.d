;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this file is for the elpa related configs.
;; zi liang. 2021.03.25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)
;(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
;                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
;                         ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")
;                         ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")))
;;(package-refresh-contents)
;;(setq package-archives
;;      '(
	;; uncomment below line if you need use GNU ELPA
;;	("gnu" . "https://elpa.gnu.org/packages/")
;;	("melpa" . "https://melpa.org/packages/")
;;	("melpa-stable" . "https://stable.melpa.org/packages/")

	;;("gnu"   . "http://elpa.emacs-china.org/gnu/")
	;;("melpa" . "http://elpa.emacs-china.org/melpa/")
	;;("melpa-stable" . "http://elpa.emacs-china.org/stable-melpa/")
	;;("org" . "http://elpa.emacs-china.org/org/")

;;	))


(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;;(setq package-archives '(("gnu"   . "http://1.15.88.122/gnu/")
;;                           ("melpa" . "http://1.15.88.122/melpa/")))

(if (file-exists-p "~/.emacs.d/lisp/")
    (message "no fresh")
  (package-refresh-contents)
    )


;; (package-refresh-contents)

;(setq package-archives '(("gnu" . "http://elpa.zilongshanren.com/gnu/")
;			("melpa" . "http://elpa.zilongshanren.com/melpa/")))

;(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
; 			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
; 			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))


;;(if (< emacs-major-version 27)
;; (package-initialize))
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
	    general
	    ;;;;;;;;;;;;tool;;;;;;;;;;;;;;
		company  ;; 用于进行自动补全
		citre    ;; front of ctags, for Complete.
		projectile ;;project manager..
		command-log-mode
		hungry-delete
		highlight-symbol
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
		;; wucuo ;;同样用来进行拼写检查

		;;metaweblog
		;;org2blog

		;; meow ;; used to replace evil and help my little finger.
		evil ;;众所周知？
		evil-leader
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
		org-roam
		;; org-modern
		;;org-roam-protocol
		;; org-roam-server

		exec-path-from-shell
		popwin
	    ;;;;;;;;;;;;;theme;;;;;;;;;;;;;
		monokai-theme
		rainbow-mode
		rainbow-delimiters
	    ;;;;;;;;;;;;;;;latex;;;;;;;;;;;;;;;
		auctex
		cdlatex
		reftex
		company-auctex
		;;;;;;;;;version control;;;;;;;;;;
		magit
		;;;;;;;;;js,html,...;;;;;;;;;;;;;;
		js2-mode
		web-mode

		leetcode

		)  "Default packages")


(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  ;; (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(defun my/install-package-if-not-found (pkg)
  (unless (package-installed-p pkg)
    ;;	(when (need-refresh-contents)
    (message "%s" "Refreshing package database...")
    ;;(package-refresh-contents)
    )
  ;;	  )
  (message "install package %s ..." pkg)
  (package-install pkg))




(provide 'init-elpa)

