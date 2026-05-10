;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this file is for the elpa related configs.
;; zi liang. 2021.03.25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl-lib)
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

(if (file-exists-p "~/.emacs.d/elpa/")
    (message "elpa directory exists, skip refresh")
  (package-refresh-contents))


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

(defun my/install-package-if-not-found (pkg)
  (unless (package-installed-p pkg)
    (message "Refreshing package database...")
    (package-refresh-contents)
    (message "install package %s ..." pkg)
    (package-install pkg)))

;; install ematrix theme from GitHub
(unless (package-installed-p 'ematrix)
  (message "Installing ematrix from GitHub...")
  (package-vc-install "https://github.com/liangzid/ematrix"))
(add-to-list 'load-path (expand-file-name "ematrix" package-user-dir))




(provide 'init-elpa)

