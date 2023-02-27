;; (message "donot use lsp")
(require 'eglot)

(if *is-linux*
    (progn
      (message "Using LSP-BRIDGE.")
      (require 'my-lspbridge)
      )
  (progn
    (gloabl-comany-mode)
    ))


(provide 'init-lsp)
