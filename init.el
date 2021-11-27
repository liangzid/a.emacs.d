;; nothing.


(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-threshold (* 50 1024 1024)) 
;; (setq gc-cons-percentage 0.6)

;;用来消除emacs 27以上版本的警告。
(setq warning-suppress-log-types '((package reinitialization)))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/other-files")

(defconst *is-server* t)

(require 'init-wsl)
(require 'init-elpa)
(require 'init-self-config-function)
(require 'init-modeline)
(require 'init-window)
(require 'init-chinese)
(require 'init-ssh)
(require 'init-clipboard)
(require 'init-yas)
(require 'init-git)

(require 'init-python)
(require 'init-org)
(require 'init-latex)
(require 'init-cpp)
(require 'init-rust)
(require 'init-blog)
(require 'init-web)

(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-spell)
(require 'init-packages)
(require 'init-lsp)
(require 'init-evil)

;; for computer custom application. cannot be used for any self-designing.
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)


(if (and *is-linux* (or (not *is-server*) *is-gui*))
    ((message "prepare to load eaf which may cost some time...")
     (require 'init-eaf))
  (message "NO EAF-INSTALL FOR TUI ENVIRONMENT.")  
    )

(provide 'init)


