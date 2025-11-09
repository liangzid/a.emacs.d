;;; INIT-CL --- 
;;
;; Configuration for Common Lisp.
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created:  7 三月 2023
;;



(my/install-package-if-not-found 'sly)

;; (require 'sly)

(use-package sly
  :ensure t
  :defer t                       ; 打开 .lisp 前不加载
  :hook (lisp-mode . sly-mode)   ; 打开 .lisp 即启用 sly-mode
  :init
  (setq inferior-lisp-program "sbcl")
  :config
  ;; 自动连接（仅当未连接时）
  (add-hook 'sly-mode-hook
            (lambda ()
              (unless (sly-connected-p)
                (save-excursion (sly))))))

(provide 'init-cl)
;;; init-cl.el ends here
