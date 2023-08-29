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

(require 'lsp-mode)


(add-hook 'rust-mode-hook #'lsp-deferred)
(add-hook 'typescript-mode-hook #'lsp-deferred)
(add-hook 'javascript-mode-hook #'lsp-deferred)

(setq lsp-keymap-prefix "s-l")

(provide 'my-lspmode)

;;; my-lspmode.el ends here
