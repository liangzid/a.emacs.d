;; nothing.



;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;;用来消除emacs 27以上版本的警告。
(setq warning-suppress-log-types '((package reinitialization)))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/other-files"))

(require 'init-elpa)
(require 'init-self-config-function)


(require 'init-python)
(require 'init-org)
(require 'init-latex)
(require 'init-cpp)
;;(require 'init-blog)

(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-spell)
(require 'init-roam)
(require 'init-packages)

;; (setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
;; (load-file custom-file)


(defconst *is-server* t)
(if (and *is-linux* (not *is-server*))
    ((message "prepare to load eaf which may cost some time...")
     (require 'init-eaf))
  (message "---> In Server, donnot need to use eaf.")  
    )

(setq gc-cons-threshold (* 2 1000 1000))

(provide 'init)
