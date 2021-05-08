;; nothing.


(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-elpa)
(require 'init-self-config-function)
(require 'init-python)
(require 'init-org)
(require 'init-latex)
(require 'init-cpp)
(require 'init-blog)

(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(require 'init-packages)






(defconst *is-server* t)
(if (and *is-linux* (not *is-server*))
    ((message "prepare to load eaf which may cost some time...")
     (require 'init-eaf))
  ((message "---> In Server, donnot need to use eaf."))  
    )



(provide 'init)
