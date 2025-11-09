;;; INIT-UNDO ---
;; For undo protect

;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2022, ZiLiang, all rights reserved.
;; Created: 20 十月 2022


;; undo tree
(use-package undo-tree
  :ensure t
  :config
  (progn
    (undo-tree-mode 1)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))
(global-undo-tree-mode)

(global-set-key (kbd "C-x u") 'undo-tree-undo)



(provide 'init-undo)
;;; init-undo.el ends here
