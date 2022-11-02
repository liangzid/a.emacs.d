; nothing. add something.

(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-threshold (* 50 1024 1024)) 


;; 定义快速打开init-file的操作，并将之绑定在F2上.
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)


;; load eaf if necessary, bounding it into <F9>
(defun zl/load-eaf()
  (interactive)
  (require 'init-eaf))
(global-set-key (kbd "<f1>") 'zl/load-eaf)

;;用来消除emacs 27以上版本的警告。
(setq warning-suppress-log-types '((package reinitialization)))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/other-files")
(add-to-list 'load-path "~/.emacs.d/other-files/netease-cloud-music.el")

(defconst *is-server* t)


(require 'init-wsl)
(require 'init-elpa)
(require 'init-dired)
(require 'init-self-config-function)
(require 'init-modeline)
(require 'init-window)
(require 'init-chinese)
(require 'init-ssh)
(require 'init-clipboard)
(require 'init-yas)
(require 'init-git)
;;(require 'init-telegram)
(require 'init-citre)
(require 'init-python)
(require 'init-org)
(require 'init-latex)
(require 'init-cpp)
(require 'init-rust)
(require 'init-cider)
(require 'init-blog)
(require 'init-web)
(require 'init-path)
(require 'init-collection)
(require 'init-rss)

;;(require 'init-netease)

(require 'init-better-defaults)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-spell)
(require 'init-packages)
(require 'init-lsp) ;; language server p
(require 'init-evil)

(if *is-linux*
    (zl/load-eaf)
    )

;; for computer custom application. cannot be used for any self-designing.
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(setq gc-cons-percentage 0.6)



;; toggle maximized screen
;; (maximize-window)
;; (toggle-frame-fullscreen)

(add-to-list 'default-frame-alist '(full-screen . maximized))






(provide 'init)
