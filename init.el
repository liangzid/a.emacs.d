;; nothing.


(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(require 'init-latex)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))





(provide 'init)
