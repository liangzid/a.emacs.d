(my/install-package-if-not-found 'eglot)

(global-company-mode)
(require 'eglot)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))


(setq-default eglot-workspace-configuration
                '((haskell
                   (plugin
                    (stan
                     (globalOn . :json-false))))))  ;; disable stan

;; (eglot-autoshutdown t)  ;; shutdown language server after closing last file
(setq eglot-confirm-server-initiated-edits nil)  ;; allow edits without confirmation

;; (if (and *is-gui* *is-linux* nil)
;;     (progn
;;       (message "Using LSP-BRIDGE.")
;;       (require 'my-lspbridge)
;;       )
;;   (progn
;;     (global-company-mode)

;;     ;; for python
;;     ;; (add-to-list 'company-backends 'company-anaconda)
;;     ;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;;     ;; (require 'my-lspmode)
    
;;     ))

(provide 'init-lsp)
