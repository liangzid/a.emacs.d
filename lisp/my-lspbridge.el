;;; MY-LSPBRIDGE --- 
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 26 二月 2023
;;
;;; Commentary:
;;
;;  My configuration of LSP BRIDGE
;;
;;; Code:
(my/install-package-if-not-found 'posframe)

(add-to-list 'load-path "~/.emacs.d/other-files/")
(add-to-list 'load-path "~/.emacs.d/other-files/lsp-bridge")
(add-to-list 'load-path "~/.emacs.d/other-files/acm-terminal")
(add-to-list 'load-path "~/.emacs.d/other-files/emacs-popon")

;; end the company mode
(setq company-mode nil)
;; (eglot-shutdown)


(require 'posframe)

(require 'lsp-bridge)
(add-hook 'python-mode-hook 'lsp-bridge-mode)
(add-hook 'latex-mode-hook 'lsp-bridge-mode)
(add-hook 'shell-mode-hook 'lsp-bridge-mode)

(global-lsp-bridge-mode)
(setq lsp-bridge-python-lsp-server "pyright")

(setq lsp-bridge-python-command "/home/liangzi/anaconda3/bin/python")

(unless *is-gui*
  (require 'acm-terminal))

(global-set-key (kbd "M-d") 'acm-doc-toggle)
(global-set-key (kbd "M-j") 'acm-doc-scroll-up)
(global-set-key (kbd "M-k") 'acm-doc-scroll-down)

(global-set-key (kbd "C-c d") 'lsp-bridge-find-def-other-window)
(global-set-key (kbd "C-c r") 'lsp-bridge-find-references)
(global-set-key (kbd "C-c i") 'lsp-bridge-find-impl-other-window)
(global-set-key (kbd "C-c c") 'lsp-bridge-rename)
(global-set-key (kbd "C-c b") 'lsp-bridge-diagnostic-jump-next)



;; (unless (display-graphic-p)
;;               (with-eval-after-load 'acm
;;                 (require 'acm-terminal)))


(provide 'my-lspbridge)
;;; my-lspbridge.el ends here
