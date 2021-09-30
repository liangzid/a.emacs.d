;; nothing.


(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)

;;用来消除emacs 27以上版本的警告。
(setq warning-suppress-log-types '((package reinitialization)))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/other-files")

(require 'init-elpa)
(require 'init-self-config-function)
(require 'init-modeline)
(require 'init-window)


(require 'init-python)
(require 'init-org)
(require 'init-latex)
(require 'init-cpp)
(require 'init-rust)
;;(require 'init-blog)

(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-spell)
(require 'init-packages)
(require 'init-lsp)

;; for computer custom application. cannot be used for any self-designing.
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)


(defconst *is-server* t)

(if (and *is-linux* (not *is-server*))
    ((message "prepare to load eaf which may cost some time...")
     (require 'init-eaf))
  (message "---> In Server, donnot need to use eaf.")  
    )

(provide 'init)


