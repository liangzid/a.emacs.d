;;; INIT-UNDO ---
;; For undo protect

;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2022, ZiLiang, all rights reserved.
;; Created: 20 十月 2022

;; undo-tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode 1)          ; 必须放 :config
  (undo-tree-mode 1)          ; 必须放 :config
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
  (global-set-key (kbd "C-x u") 'undo-tree-undo)
  )

(provide 'init-undo)
;;; init-undo.el ends here
