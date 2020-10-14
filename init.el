;; nothing.


(add-to-list 'load-path "~/.emacs.d/lisp")


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(require 'init-latex)

;; ti添加只有在linux远程命令里才会出现的特殊问题的解法
;; 对backspace键的使用提供帮助
(global-set-key "\C-h" 'backward-delete-char-untabify)
(global-set-key "\d" 'delete-char)



(provide 'init)
