(my/install-package-if-not-found 'msgpack)

(use-package tramp-rpc
  :after tramp
  :vc (:url "https://github.com/ArthurHeymans/emacs-tramp-rpc"
       :rev :newest
       :lisp-dir "lisp")
  :config
  (setq tramp-default-method "rpc")
  (setq tramp-rpc-deploy-git-build-policy 'release))

(provide 'init-tramp-rpc)
