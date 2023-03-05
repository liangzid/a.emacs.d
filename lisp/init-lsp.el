;; (message "donot use lsp")
(my/install-package-if-not-found 'eglot)

(require 'eglot)


;; (add-to-list 'eglot-server-programs '(rust-mode . ("/home/liangzi/.local/bin/rust-analyzer")))
(add-hook 'rust-mode-hook 'eglot-ensure)

;; (add-hook 'python-mode-hook 'eglot-ensure)

;; (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))

(add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio")))
;; (add-to-list 'eglot-server-programs '(rust-mode . ("/home/zliang/.cargo/bin/rust-analyzer")))

(add-to-list 'eglot-server-programs '(rust-mode . ("/home/liangzi/.cargo/bin/rust-analyzer")))
;; (add-to-list 'eglot-server-programs
             ;; `(python-mode . ("/home/liangzi/anaconda3/bin/pyright")))

(provide 'init-lsp)
