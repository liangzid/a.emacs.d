(my/install-package-if-not-found 'eglot)
(require 'eglot)
(if (and *is-gui* *is-linux* nil)
    (progn
      (message "Using LSP-BRIDGE.")
      (require 'my-lspbridge)
      )
  (progn
    (global-company-mode)

    ;; for python
    (add-to-list 'company-backends 'company-anaconda)
    ;; (add-hook 'python-mode-hook 'anaconda-mode) ;; key conficts
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

    ;; (require 'my-lspmode)
    
    ))

(provide 'init-lsp)
