(my/install-package-if-not-found 'eglot)

(require 'eglot)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver")))
;; (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))
(setq eglot-ignored-server-capabilities '(textDocument/semanticTokens textDocument/colorProvider))

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main"))

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)


;; (setq-default eglot-workspace-configuration
;;                 '((haskell
;;                    (plugin
;;                     (stan
;;                      (globalOn . :json-false))))))  ;; disable stan

;; ;; (eglot-autoshutdown t)  ;; shutdown language server after closing last file
;; (setq eglot-confirm-server-initiated-edits nil)  ;; allow edits without confirmation


(provide 'init-lsp)
