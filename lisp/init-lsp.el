(my/install-package-if-not-found 'eglot)
(require 'eglot)
(if (and *is-gui* *is-linux*)
    (progn
      (message "Using LSP-BRIDGE.")
      (require 'my-lspbridge)
      )
  (progn
    (global-company-mode)
    ))

(provide 'init-lsp)
