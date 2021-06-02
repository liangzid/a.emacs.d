(require 'cl)
(require 'use-package)



;; 自动补全
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq company-idle-delay nil)
(setq company-show-numbers t)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 3)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)
(setq company-global-modes '(not shell-mode))
(global-company-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 用以进行辅助查询
(require 'popwin)
(popwin-mode t)


;; undo tree
(use-package undo-tree
  :ensure t
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))

;; display keybindings with which key
(use-package which-key
  :config
  (progn
    (which-key-mode)
    ;; (which-key-setup-side-window-bottom)
    ))

;; 项目文件的树状图
(use-package neotree
  :config
  (progn
    (setq neo-smart-open t)
    ;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq neo-window-fixed-size nil)
    ;; (setq-default neo-show-hidden-files nil)
    (global-set-key [f3] 'neotree-toggle)))

;; smart TAB
(use-package smart-tab
  :config
  (progn
    (defun @-enable-smart-tab ()
      (smart-tab-mode))
    (add-hook 'prog-mode-hook '@-enable-smart-tab)
    ))

(provide 'init-packages)
