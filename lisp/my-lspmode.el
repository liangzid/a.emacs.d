;;; MY-LSPMODE --- 
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 18 七月 2023
;;
;;; Commentary:
;;
;;  
;;
;;; Code:


(my/install-package-if-not-found 'lsp-mode)
(my/install-package-if-not-found 'lsp-ui)
(my/install-package-if-not-found 'lsp-ivy)
(my/install-package-if-not-found 'lsp-treemacs)
(my/install-package-if-not-found 'format-all)


(my/install-package-if-not-found 'lsp-mode)


(require 'lsp-mode)
(defun my/setup-lsp-mode ()
  ;; (flycheck-mode 1)
  (company-mode 1)
  (yas-minor-mode-on)
  (lsp-enable-which-key-integration)
  (lsp-diagnostics--enable)
  (lsp-completion--enable)
  ;; (when (lsp-feature? "textDocument/formatting")
  ;;   (setq my/format-buffer-function 'lsp-format-buffter)
  ;;   )
  )

(use-package format-all)
(defvar-local my/format-buffer-function 'format-all-buffer
  "Function to call in order to format the current buffer.")
(defun my/format-buffer ()
  "Run `my/format-buffer-function' to format the current buffer."
  (interactive)
  (funcall my/format-buffer-function))
(bind-key "C-c f f" 'my/format-buffer)

(require 'lsp-mode)

(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-log-io nil)
  (lsp-print-performance nil)
  (lsp-report-if-no-buffer nil)
  (lsp-keep-workspace-alive nil)
  (lsp-enable-snippet t)
  (lsp-auto-guess-root t)
  (lsp-restart 'iteractive)
 ;(lsp-session-file)
  (lsp-auto-configure nil)
 ;(lsp-document-sync-method)
  (lsp-auto-execute-action nil)
  (lsp-eldoce-render-all nil)
  (lsp-enable-completion-at-point t)
  (lsp-enable-xref t)
  ;; (lsp-diagnostics-provider :flycheck)
  (lsp-enable-indentation t)
  (lsp-enable-on-type-formatting nil)
  (lsp-before-save-edits nil)
  (lsp-imenu-show-container-name t)
  (lsp-imenu-container-name-separator "/")
  (lsp-imenu-sort-methods '(kind name))
  (lsp-response-timeout 5)
  (lsp-enable-file-watchers nil)
  (lsp-server-trace nil)
  (lsp-semantic-highlighting nil)
  (lsp-enable-imenu t)
  (lsp-signature-auto-activate t)
  (lsp-signature-render-documentation nil)
  (lsp-enable-text-document-color nil)
  (lsp-completion-provider :capf)
  (gc-cons-threshold 100000000)
  (read-process-output-max (* 3 1024 1024))
  :hook ((lsp-mode . my/setup-lsp-mode))
  ;; :bind (:map lsp-mode-map
  ;;             ("C-c f" . hydra-lsp/body))
  )
(add-hook 'python-mode-hook #'lsp)

(use-package lsp-ui
  :commands (lsp-ui-mode)
  :custom
  ;; Sideline
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-sideline-show-code-actions nil)
  (lsp-ui-sideline-update-mode 'line)
  (lsp-ui-sideline-delay 0)
  ;; Peek
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-show-directory nil)
  ;; Documentation
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-delay 0.5)
  ;; IMenu
  (lsp-ui-imenu-window-width 0)
  (lsp-ui-imenu--custom-mode-line-format nil)
  :hook (lsp-mode . lsp-ui-mode))


;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)


(add-hook 'rust-mode-hook #'lsp-deferred)
(add-hook 'typescript-mode-hook #'lsp-deferred)
(add-hook 'javascript-mode-hook #'lsp-deferred)

(setq lsp-keymap-prefix "s-l")

(provide 'my-lspmode)

;;; my-lspmode.el ends here
