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

(custom-set-faces
  ;; 1. Org 正文基础字体（全局Org文件的正文文字）
 '(org-default ((t (:family "LXGW WenKai Mono 22" :height 140 :weight regular :foreground "#f8f8f2")))) ; Monokai默认亮白正文
  ;; 2. Org 各级标题（Monokai经典配色梯度，1级最大依次递减）
 '(org-level-1 ((t (:family "LXGW WenKai Mono 22" :height 180 :weight bold :foreground "#f92672")))) ; 1级标题：Monokai品红（主标题色）
 '(org-level-2 ((t (:family "LXGW WenKai Mono 22" :height 160 :weight bold :foreground "#66d9ef")))) ; 2级标题：Monokai浅蓝
 '(org-level-3 ((t (:family "LXGW WenKai Mono 22" :height 150 :weight semi-bold :foreground "#a6e22e")))) ; 3级标题：Monokai嫩绿
 '(org-level-4 ((t (:family "LXGW WenKai Mono 22" :height 140 :weight semi-bold :foreground "#e6db74")))) ; 4级标题：Monokai明黄
 '(org-level-5 ((t (:inherit org-level-4)))) ; 5级及以下继承4级样式，保持梯度统一
 '(org-level-6 ((t (:inherit org-level-4))))
 '(org-level-7 ((t (:inherit org-level-4))))
 '(org-level-8 ((t (:inherit org-level-4))))
  ;; 3. Org 强调文本（*斜体* / **粗体** / ***粗斜体***）
 '(org-italic ((t (:family "LXGW WenKai Mono 22" :slant italic :foreground "#f8f8f2")))) ; 斜体：继承正文色，仅加斜体样式
 '(org-bold ((t (:family "LXGW WenKai Mono 22" :weight bold :foreground "#f8f8f2"))))     ; 粗体：继承正文色，仅加粗
 '(org-bold-italic ((t (:family "LXGW WenKai Mono 22" :weight bold :slant italic :foreground "#f8f8f2")))) ; 粗斜体：组合样式，统一正文色
  ;; 4. Org 代码相关（`行内代码` / 代码块）- Monokai代码区经典配色
 '(org-code ((t (:family "Cascadia Code 22" :height 130 :foreground "#f8f8f2" :background "#272822")))) ; 行内代码：亮白字+深灰底
 '(org-block ((t (:family "Cascadia Code 22" :height 130 :foreground "#f8f8f2" :background "#272822")))) ; 代码块：与行内代码统一，贴合Monokai代码区
  ;; 5. Org 链接（[[链接][文字]]）- Monokai链接经典色
 '(org-link ((t (:family "Cascadia Code 22" :foreground "#f92672" :underline t)))) ; 链接：Monokai品红（标志性链接色）+ 下划线
  ;; 6. Org 列表/复选框（- /* [ ] */ [X]）- 适配Monokai配色，突出交互元素
 '(org-list-dt ((t (:family "Cascadia Code 22" :weight bold :foreground "#66d9ef")))) ; 列表项：Monokai浅蓝，与2级标题呼应
 '(org-checkbox ((t (:family "Cascadia Code 22" :weight bold :foreground "#a6e22e")))) ; 复选框：Monokai嫩绿，醒目且不刺眼
)

;; 可选：Org Mode 开启自动换行（避免横向滚动，提升排版体验）
(setq org-startup-truncated nil)
;; 可选：Org 标题折叠/展开的缩进优化
(setq org-indent-mode t)






















(provide 'org-ui)
;;; org-ui.el ends here

