;; nothing.


(add-to-list 'load-path "~/.emacs.d/lisp")


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(require 'init-elpa)
(require 'init-self-config-function)
(require 'init-packages)
(require 'init-ui)
(require 'init-python)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(require 'init-latex)


(provide 'init)
