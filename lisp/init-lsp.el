;; (message "donot use lsp")
(my/install-package-if-not-found 'eglot)
;; (my/install-package-if-not-found 'lsp-pyright)

(require 'eglot)

;; (defun my--project-files-in-directory (dir)
;; "Use `fd' to list files in DIR."
;; (let* ((default-directory dir)
;; 	(localdir (file-local-name (expand-file-name dir)))
;; 	(command (format "fd -H -t f -0 . %s" localdir)))
;;     (project--remote-file-names
;;     (sort (split-string (shell-command-to-string command) "\0" t)
;; 	    #'string<))))

;; (cl-defmethod project-files ((project (head local)) &optional dirs)
;; "Override `project-files' to use `fd' in local projects."
;; (mapcan #'my--project-files-in-directory
;; 	(or dirs (list (project-root project)))))


;; (add-to-list 'eglot-server-programs '(rust-mode . ("/home/liangzi/.local/bin/rust-analyzer")))
;; (add-hook 'rust-mode-hook 'eglot-ensure)

(add-hook 'python-mode-hook 'eglot-ensure)
;; (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))
(add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio")))
(add-to-list 'eglot-server-programs '(rust-mode . ("/home/zliang/.cargo/bin/rust-analyzer")))
;; (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer" "/home/zliang/.cargo/bin/rust-analyzer")))

	     ;; (add-to-list 'eglot-server-programs
;;              `(python-mode . ("/home/liangzi/anaconda3/bin/pyright")))

;; (use-package lsp-pyright
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp))))  ; or lsp-deferred

;; (define-key eglot-mode-map (kbd "C-c r") 'eglot-rename)
;; (define-key eglot-mode-map (kbd "C-c o") 'eglot-code-action-organize-imports)
;; (define-key eglot-mode-map (kbd "C-c h") 'eldoc)
;; (define-key eglot-mode-map (kbd "<f6>") 'xref-find-definitions)


(provide 'init-lsp)
