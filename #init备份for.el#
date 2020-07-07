;; nothing.

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)



(tool-bar-mode -1)

(scroll-bar-mode -1)
(global-linum-mode 1)

(setq cursor-type 'bar)
(setq inhibit-splash-screen 1)

(set-face-attribute 'default nil :height 160)

;;快速打开配置文件.
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)


;; enable company.
(global-company-mode 1)

;; stop auto 备份 file
(setq make-backup-files nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(delete-selection-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; add melpa. ;;;;;;;;;;;;;;;;;;;;;
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")

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

 ;; Find Executable Path on OS X
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))


;;max-screen.
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


;; highlight of this line.
(global-hl-line-mode 1)

;; 
(add-to-list 'my/packages 'monokai-theme)

(load-theme 'monokai 1)

(setq auto-mode-alist
      (append
       '(("\\.js\\" . js2-mode))
       auto-mode-alist)
      )

(require 'org)
(setq org-src-fontify-natively t)






