;; (message "donot use lsp")
(my/install-package-if-not-found 'eglot)
(my/install-package-if-not-found 'corfu)
(my/install-package-if-not-found 'orderless)
;; (my/install-package-if-not-found 'lsp-pyright)

(require 'eglot)

;; ==============config lsp-bridge=============================
;; (add-to-list 'load-path "~/.emacs.d/other-files/lsp-bridge/")
(add-to-list 'load-path "~/.emacs.d/other-files/lsp-bridge/")

(require 'lsp-bridge)             ;; load lsp-bridge
;; (global-corfu-mode)               ;; use corfu as completion ui
;; (setq lsp-bridge-enable-log t)

;; (require 'lsp-bridge-orderless)   ;; make lsp-bridge support fuzzy match, optional
;; (require 'lsp-bridge-icon)        ;; show icon for completion items, optional

;; ;; Enable auto completion in elisp mode.
;; (dolist (hook (list
;;                'emacs-lisp-mode-hook
;;                ))
;;   (add-hook hook (lambda ()
;;                    (setq-local corfu-auto t)
;;                    )))

;; Enable lsp-bridge.
(dolist (hook (list
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               ;; 'python-mode-hook
               'ruby-mode-hook
               ;; 'rust-mode-hook
               'elixir-mode-hook
               'go-mode-hook
               'haskell-mode-hook
               'haskell-literate-mode-hook
               'dart-mode-hook
               'scala-mode-hook
               'typescript-mode-hook
               'js2-mode-hook
               'js-mode-hook
               'tuareg-mode-hook
               'latex-mode-hook
               'Tex-latex-mode-hook
               'texmode-hook
               'context-mode-hook
               'texinfo-mode-hook
               'bibtex-mode-hook
               ))
  (add-hook hook (lambda ()
                   ;; (setq-local corfu-auto nil)  ;; let lsp-bridge control when popup completion frame
                   (lsp-bridge-mode 1)
                   )))

;; ==============config lsp-bridge=============================


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

;; (add-hook 'python-mode-hook 'eglot-ensure)

;; (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))

(add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio")))
;; (add-to-list 'eglot-server-programs '(rust-mode . ("/home/zliang/.cargo/bin/rust-analyzer")))

(add-to-list 'eglot-server-programs '(rust-mode . ("/home/liangzi/.cargo/bin/rust-analyzer")))
;; (add-to-list 'eglot-server-programs
             ;; `(python-mode . ("/home/liangzi/anaconda3/bin/pyright")))

;; (use-package lsp-pyright
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp))))  ; or lsp-deferred

;; (define-key eglot-mode-map (kbd "C-c r") 'eglot-rename)
;; (define-key eglot-mode-map (kbd "C-c o") 'eglot-code-action-organize-imports)
;; (define-key eglot-mode-map (kbd "C-c h") 'eldoc)
;; (define-key eglot-mode-map (kbd "<f6>") 'xref-find-definitions)

(defun lz-lsp (choice)
    (interactive
    (let ((choices '("remote" "win10" "subSystem")))
      (list (gnus-ido-completing-read "LSP RUNNING AT: " choices))))
    
    ;; let user select to open which server.
    (message "%s" choice)
    (progn
      (if (string= choice "remote")
	  (progn
	    (add-to-list 'eglot-server-programs '(python-mode ("pyright-langserver" "--stdio")))
	    (add-to-list 'eglot-server-programs '(rust-mode . ("/home/zliang/.cargo/bin/rust-analyzer")))
	    (eglot)
	    )
	(if (string= choice "win10")
	    (progn
	    (add-to-list 'eglot-server-programs '(python-mode ("pyright-langserver" "--stdio")))
	    (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))
	    (eglot)	    
	    )
	  (progn
	    ;; not setting...
	    (message "current env not setting yet.")
	    )
	  ))
      ))

(provide 'init-lsp)
