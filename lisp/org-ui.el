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


;; ;; 按需安装并加载 org-visual-indent -----------------------------------------
(require 'org-visual-indent)
(org-visual-indent-mode)

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

(my-org--set-vars)

;; ########## Org Mode 全局字体/样式完整自定义 ##########

(defun my-org-apply-faces ()
  "Apply custom org faces."
  (set-face-attribute 'org-default nil
    :family "LXGW WenKai Mono 22" :height 140 :weight 'regular :foreground "#f8f8f2")
  (set-face-attribute 'org-level-1 nil
    :family "LXGW WenKai Mono 22" :height 180 :weight 'bold :foreground "#f92672")
  (set-face-attribute 'org-level-2 nil
    :family "LXGW WenKai Mono 22" :height 160 :weight 'bold :foreground "#66d9ef")
  (set-face-attribute 'org-level-3 nil
    :family "LXGW WenKai Mono 22" :height 150 :weight 'semi-bold :foreground "#a6e22e")
  (set-face-attribute 'org-level-4 nil
    :family "LXGW WenKai Mono 22" :height 140 :weight 'semi-bold :foreground "#e6db74")
  (set-face-attribute 'org-level-5 nil :inherit 'org-level-4)
  (set-face-attribute 'org-level-6 nil :inherit 'org-level-4)
  (set-face-attribute 'org-level-7 nil :inherit 'org-level-4)
  (set-face-attribute 'org-level-8 nil :inherit 'org-level-4)
  (set-face-attribute 'org-italic nil
    :family "LXGW WenKai Mono 22" :slant 'italic :foreground "#f8f8f2")
  (set-face-attribute 'org-bold nil
    :family "LXGW WenKai Mono 22" :weight 'bold :foreground "#f8f8f2")
  (set-face-attribute 'org-bold-italic nil
    :family "LXGW WenKai Mono 22" :weight 'bold :slant 'italic :foreground "#f8f8f2")
  (set-face-attribute 'org-code nil
    :family "Cascadia Code 22" :height 130 :foreground "#f8f8f2" :background "#272822")
  (set-face-attribute 'org-block nil
    :family "Cascadia Code 22" :height 130 :foreground "#f8f8f2" :background "#272822")
  (set-face-attribute 'org-link nil
    :family "Cascadia Code 22" :foreground "#f92672" :underline t)
  (set-face-attribute 'org-list-dt nil
    :family "Cascadia Code 22" :weight 'bold :foreground "#66d9ef")
  (set-face-attribute 'org-checkbox nil
    :family "Cascadia Code 22" :weight 'bold :foreground "#a6e22e"))

(add-hook 'org-mode-hook #'my-org-apply-faces)

;; 可选：Org Mode 开启自动换行（避免横向滚动，提升排版体验）
(setq org-startup-truncated nil)
;; 可选：Org 标题折叠/展开的缩进优化
(setq org-indent-mode t)






















(provide 'org-ui)
;;; org-ui.el ends here

