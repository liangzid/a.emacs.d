;;; ORG-UI ---
;;
;; all UI settings for ORG mode.
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 26 二月 2023
;;
;;; Code:

;;; -*- lexical-binding: t; -*-



;; 按需安装并加载 org-superstar ----------------------------------------------
(use-package org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-leading-bullet " "
        org-superstar-special-todo-items t
        org-superstar-todo-bullet-alist '(("TODO"      . 9744)
                                          ("INPROGRESS" . 9744)
                                          ("WAITING"    . 9744)
                                          ("REVIEW"     . 9744)
                                          ("DONE"       . 9744)
                                          ("CANCELED"   . 9744))))

;; 按需安装并加载 org-fragtog（LaTeX 片段自动预览开关） ----------------------
(use-package org-fragtog
  :ensure t
  :hook (org-mode . org-fragtog-mode))

;; 按需安装并加载 valign（表格列对齐） ---------------------------------------
(use-package valign
  :ensure t
  :hook (org-mode . (lambda ()
                      (when (display-graphic-p)
                        (valign-mode +1)))))

;; ;; 按需安装并加载 org-visual-indent -----------------------------------------
;; (use-package org-visual-indent
;;   :ensure t
;;   :hook (org-mode . org-visual-indent-mode))

;; ;; 按需安装并加载 org-dynamic-bullets ---------------------------------------
;; (use-package org-dynamic-bullets
;;   :ensure t
;;   :hook (org-mode . org-dynamic-bullets-mode))

(defun my-org--set-vars ()
  "Set org variables."
  (setq org-adapt-indentation t
        org-hide-leading-stars t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-ellipsis "…"
        org-fontify-quote-and-verse-blocks t
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0
        org-src-preserve-indentation nil
        org-log-done 'time
        org-log-reschedule 'time
        org-log-redeadline 'time)
  ;; 给 emphasis 增加 + 删除线
  (add-to-list 'org-emphasis-alist '("+" (:foreground "dark gray" :strike-through t)))
  ;; LaTeX 预览缩放
  (plist-put org-format-latex-options :scale 2))

;; 平台相关字体 --------------------------------------------------------------
(defun my-org--set-platform-fonts ()
  "Set fonts depending on platform."
  (cond
   (*is-windows*
    (set-face-attribute 'default nil :font "LXGWWenKaiMono 12")
    (set-face-attribute 'fixed-pitch nil :family "LXGWWenKaiMono")
    (set-face-attribute 'variable-pitch nil :family "LXGWWenKaiMono" :height 1.18))
   (t
    (set-face-attribute 'default nil :font "LXGWWenKaiMono 12")
    (set-face-attribute 'fixed-pitch nil :family "LXGWWenKaiMono")
    (set-face-attribute 'variable-pitch nil :family "LXGWWenKaiMono" :height 1.18))))


;; pangu-spacing 只给中文用户留手动命令，不全局加载 ---------------------------
(use-package pangu-spacing
  :ensure t
  :config
  (global-pangu-spacing-mode 0)          ; 关闭全局
  :commands (pangu-spacing-mode
             pangu-spacing-search-overlay))


(provide 'org-ui)
;;; org-ui.el ends here

