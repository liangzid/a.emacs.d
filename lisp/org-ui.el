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


;; 按需安装并加载 org-modern -------------------------------------------------
(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-tag t
        org-modern-priority nil
        org-modern-todo nil
        org-modern-table nil
        org-modern-list nil
        org-modern-blocks nil
        org-modern-indent nil
        org-modern-headers nil
        org-modern-footers nil
        org-modern-keywords nil
        org-modern-links nil
        org-modern-images nil
        org-modern-entities nil
        org-modern-ellipsis "…"
        org-modern-star "•"
        org-modern-todo-bullet-alist '(("TODO"      . "•")
                                       ("INPROGRESS" . "•")
                                       ("WAITING"    . "•")
                                       ("REVIEW"     . "•")
                                       ("DONE"       . "•")
                                       ("CANCELED"   . "•"))
        org-modern-todo-faces '((todo       . (:inherit org-todo :foreground "#A3BE8C" :weight bold))
                                (inprogress . (:inherit org-todo :foreground "#88C0D0" :weight bold))
                                (waiting    . (:inherit org-todo :foreground "#8FBCBB" :weight bold))
                                (review     . (:inherit org-todo :foreground "#81A1C1" :weight bold))
                                (done       . (:inherit org-todo :foreground "#30343d" :weight bold))))
  ;; 如果只想在 org 里生效，把下面这行删掉或改成局部
  (global-org-modern-mode +1))

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

;; 字体/颜色/排版一次性设置 ---------------------------------------------------
(defun my-org--set-faces ()
  "Set org-level faces and document-title face."
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.0)
                  (org-level-6 . 1.0)
                  (org-level-7 . 1.0)
                  (org-level-8 . 1.0)))
    (set-face-attribute (car face) nil
                        :font "LXGWWenKaiMono 18"
                        :foreground "#66ff66"
                        :weight 'bold
                        :height (cdr face)))
  (set-face-attribute 'org-document-title nil
                      :font "LXGWWenKaiMono"
                      :weight 'bold
                      :height 1.8)
  (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch :height 0.85)
  (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch) :height 0.85)
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch) :height 0.85)
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(defun my-org--set-todo-faces ()
  "Set todo keyword faces."
  (setq org-todo-keyword-faces
        '(("TODO"      :inherit (org-todo region) :foreground "white" :background "#ff0a22" :weight bold)
          ("INPROGRESS" :inherit (org-todo region) :foreground "#3867d6" :background "yellow" :weight bold)
          ("WAITING"    :inherit (org-todo region) :foreground "#3867d6" :background "green" :weight bold)
          ("REVIEW"     :inherit (org-todo region) :foreground "#81A1C1" :background "#F2F4C1" :weight bold)
          ("DONE"       :inherit (org-todo region) :foreground "#808080" :background "#30343d" :weight bold)
          ("CANCELED"   :inherit (org-todo region) :foreground "#808080" :background "#30343d" :weight bold))))

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

;; 把以上函数挂到 org-mode-hook ----------------------------------------------
(use-package org
  :ensure nil
  :hook (org-mode . (lambda ()
                      (my-org--set-faces)
                      (my-org--set-todo-faces)
                      (my-org--set-vars)
                      (when (display-graphic-p)
                        (my-org--set-platform-fonts))
                      ;; 初始展开两级
                      (org-shifttab 2))))

;; pangu-spacing 只给中文用户留手动命令，不全局加载 ---------------------------
(use-package pangu-spacing
  :ensure t
  :config
  (global-pangu-spacing-mode 0)          ; 关闭全局
  :commands (pangu-spacing-mode
             pangu-spacing-search-overlay))


(provide 'org-ui)
;;; org-ui.el ends here

