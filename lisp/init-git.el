
;; Give up git-gutter as it is slow for tramp.
;; ;; using git-gittuer as it is more beautiful.
(my/install-package-if-not-found 'git-gutter)
(require 'git-gutter)
(global-git-gutter-mode 1)

(provide 'init-git)
