;; (setq use-package-compute-statistics t)   ; early-init.el 或 init.el 最前面
;; (use-package benchmark-init               ; 可选，提供更细瀑布图
;;   :ensure t
;;   :config
;;   (benchmark-init/activate))

;;;;; Config Environment Path 
(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/.local/bin") t)
(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/.ghcup/bin") t)
(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/miniconda3/bin") t)
(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/anaconda3/bin") t)
(add-to-list 'exec-path 
			 "/snap/bin" t)

(setenv "LC_ALL" "C.UTF-8")
(setenv "LANG"   "C.UTF-8")

;; (setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-threshold (* 50 1024 1024)) 

;; (exec-path-from-shell-initialize)
;; (exec-path-from-shell-copy-env "DEEPSEEK_API_KEY")

;; Improve lsp perf https://emacs-lsp.github.io/lsp-mode/page/performance/#increase-the-amount-of-data-which-emacs-reads-from-the-process
(setq read-process-output-max (* 3 1024 1024))

(set-frame-parameter nil 'alpha-background  0.99)
;; (set-frame-parameter nil 'alpha-background  0.99)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;remove warns for version up to emacs 27
(setq warning-suppress-log-types '((package reinitialization)))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/other-files")
;; (add-to-list 'load-path "~/.emacs.d/other-files/netease-cloud-music.el")


;; ;;; Config =straight.el= for common usages
;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name
;;         "straight/repos/straight.el/bootstrap.el"
;;         (or (bound-and-true-p straight-base-dir)
;;             user-emacs-directory)))
;;       (bootstrap-version 7))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))


;;; functional configs.
(require 'init-self-config-function)
(require 'init-wsl)
(require 'init-elpa)
(require 'init-openai)
;; (require 'init-pdf)
(require 'init-eshell)
;; (require 'init-docker)
(require 'init-proxy)
(require 'init-largefile)
(require 'init-dired)
(require 'init-clipboard)
(require 'init-yas)
(require 'init-git)
(require 'init-citre)
(require 'init-python)
;;(require 'init-haskell)
(require 'init-latex) ;; Not optimized yet.
(require 'init-cl)
(require 'init-cpp)
(require 'init-rust)
(require 'init-cider)
(require 'init-blog)
(require 'init-web)
;;(require 'init-astaple)
(require 'init-path)
;; (require 'init-collection)
(require 'init-rss)
(require 'init-keybindings)
(require 'init-rg)
(require 'init-spell)

(require 'init-packages)
(require 'init-lsp) ;; language server protocol
(require 'init-evil)
;; (require 'init-meow)
(require 'init-undo)
(require 'init-keyfreq)
;;(require 'init-netease)
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
(require 'org-ui)
;; (require 'init-dashboard)


(setq gc-cons-percentage 0.6)

;; toggle maximized screen
;; (maximize-window)
;; (toggle-frame-fullscreen)

;; (if (and *is-gui* (not (equal *is-gui* ":0")))
    ;; (enable-150%-scale-big)
    ;; )
;; (enable-150%-scale-big)


(setq debug-on-error nil)
(setq debug-on-signal nil)

(global-set-key (kbd "<f1>") 'restart-emacs)
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-c C-=") 'enable-150%-scale-big)
(global-set-key (kbd "C-c C--") 'enable-75%-scale-big)


;; ;; easysession save
;; (my/install-package-if-not-found 'easysession)
;; (use-package easysession
;;   :ensure t
;;   ;; :custom
;;   ;; (easysession-save-interval (* 10 60))
;;   :init
;;   (add-hook 'emacs-startup-hook #'easysession-load-including-geometry)
;;   (add-hook 'emacs-startup-hook #'easysession-save-mode))

(provide 'init)
