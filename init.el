; nothing. add something.

(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/.local/bin") t)
(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/miniconda3/bin") t)
(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/anaconda3/bin") t)

;; (setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-threshold (* 50 1024 1024)) 

;; Improve lsp perf https://emacs-lsp.github.io/lsp-mode/page/performance/#increase-the-amount-of-data-which-emacs-reads-from-the-process
(setq read-process-output-max (* 3 1024 1024))

(set-frame-parameter nil 'alpha-background  0.75)
(setq default-frame-alist '((alpha-background . 75)))


;; (set-frame-parameter nil 'alpha 0.99999)

;; 定义快速打开init-file的操作，并将之绑定在F2上.
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)


;; ;; load eaf if necessary, bounding it into <F9>
;; (defun zl/load-eaf()
;;   (interactive)
;;   (if *is-gui*
;;       (require 'init-eaf))
;;   (message "do not need to load eaf! thanks sky.")
;;       )
;; (global-set-key (kbd "<f1>") 'zl/load-eaf)

;;用来消除emacs 27以上版本的警告。
(setq warning-suppress-log-types '((package reinitialization)))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/other-files")
;; (add-to-list 'load-path "~/.emacs.d/other-files/netease-cloud-music.el")

(defconst *is-server* t)


;;; functional configs.
(require 'init-wsl)
(require 'init-elpa)
(require 'init-eshell)
;; (require 'init-docker)
(require 'init-proxy)
(require 'init-largefile)
(require 'init-dired)
(require 'init-self-config-function)
(require 'init-clipboard)
(require 'init-yas)
(require 'init-git)
(require 'init-citre)
(require 'init-python)
(require 'init-latex)
(require 'init-cl)
(require 'init-cpp)
(require 'init-rust)
(require 'init-cider)
(require 'init-blog)
(require 'init-web)
;;(require 'init-astaple)
(require 'init-path)
(require 'init-collection)
(require 'init-rss)
(require 'init-keybindings)
(require 'init-spell)
(require 'init-packages)
(require 'init-lsp) ;; language server protocol
(require 'init-evil)
;; (require 'init-meow)
(require 'init-undo)
(require 'init-keyfreq);;(require 'init-netease)
(require 'init-org)
(require 'init-ssh)

(require 'easy-surround)

;; (desktop-save-mode)
;; (desktop-read)
;; for computer custom application. cannot be used for any self-designing.
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

;;; UI configs.
(require 'init-modeline)
(require 'init-window)
(require 'init-chinese) ;; only have part of UI.
(require 'init-better-defaults)
(require 'init-ui)
;; (require 'init-dashboard)


(setq gc-cons-percentage 0.6)

;; toggle maximized screen
;; (maximize-window)
(toggle-frame-fullscreen)
(if (and *is-gui* (not (equal *is-gui* ":0")))
    (enable-150%-scale-big)
    )
(enable-150%-scale-big)


(setq debug-on-error nil)
(setq debug-on-signal nil)


;; (add-to-list 'default-frame-alist '(full-screen . maximized))

 ;; (setq default-frame-alist '((alpha-background . 80)))
(provide 'init)
