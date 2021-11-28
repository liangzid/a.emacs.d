(message "donot use lsp")
;;(my/install-package-if-not-found 'eglot)

;; (require 'eglot)
;; (add-to-list 'eglot-server-programs '(rust-mode . ("/home/liangzi/.local/bin/rust-analyzer")))
;; (add-hook 'rust-mode-hook 'eglot-ensure)

;; (add-hook 'python-mode-hook 'eglot-ensure)
;; ;; (add-to-list 'eglot-server-programs '(python-mode . ("pyls")))
;; (add-to-list 'eglot-server-programs
;;              `(python-mode . ("/home/liangzi/.local/bin/pyls" "-v" "--tcp" "--host"
;;                               "localhost" "--port" :autoport)))

;; (define-key eglot-mode-map (kbd "C-c r") 'eglot-rename)
;; (define-key eglot-mode-map (kbd "C-c o") 'eglot-code-action-organize-imports)
;; (define-key eglot-mode-map (kbd "C-c h") 'eldoc)
;; (define-key eglot-mode-map (kbd "<f6>") 'xref-find-definitions)


(provide 'init-lsp)
