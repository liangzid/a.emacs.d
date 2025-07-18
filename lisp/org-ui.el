;;; ORG-UI ---
;;
;; all UI settings for ORG mode.
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 26 二月 2023
;;
;;; Code:

;; 安装必要的包
(my/install-package-if-not-found 'org-modern)
(my/install-package-if-not-found 'org-superstar)
(my/install-package-if-not-found 'pangu-spacing)
(my/install-package-if-not-found 'org-fragtog)
(my/install-package-if-not-found 'valign)
;; (my/install-package-if-not-found 'org-visual-indent)
;; (my/install-package-if-not-found 'org-dynamic-bullets)

;; 加载必要的包
(require 'valign)
(require 'org-visual-indent)
(require 'org-dynamic-bullets)

;; 禁用全局 pangu-spacing 模式
(global-pangu-spacing-mode 0)

;; Org Mode 钩子函数
(add-hook 'org-mode-hook
          (lambda ()
            ;; 启用 org-modern 模式
            (org-modern-mode)
            ;; 启用 org-fragtog 模式
            (org-fragtog-mode)
            ;; 启用 org-visual-indent 模式
            (org-visual-indent-mode)
            ;; 启用 org-dynamic-bullets 模式
            (org-dynamic-bullets-mode)
            ;; 设置 Org 模式下的字体
            (set-org-font)
            ;; 设置 Org 模式下的表格对齐
            (if *is-gui*
                (valign-mode))
            ;; 设置 Org 模式下的缩进
            (org-shifttab 2)
            ;; 启用代码块原生字体美化
            (setq org-src-fontify-natively t)
            ;; 启用代码块内 TAB 键的原生行为
            (setq org-src-tab-acts-natively t)
            ;; 禁用代码块内容缩进
            (setq org-src-preserve-indentation nil)
            ;; 启用任务完成时间记录
            (setq org-log-done 'time)
            ;; 启用任务重新安排时间记录
            (setq org-log-reschedule 'time)
            ;; 启用任务重新设置截止时间记录
            (setq org-log-redeadline 'time)
            ;; 设置 Org 模式下的标题字体大小
            (dolist (face '((org-level-1 . 1.2)
                            (org-level-2 . 1.1)
                            (org-level-3 . 1.05)
                            (org-level-4 . 1.0)
                            (org-level-5 . 1.0)
                            (org-level-6 . 1.0)
                            (org-level-7 . 1.0)
                            (org-level-8 . 1.0)))
              (set-face-attribute (car face) nil :font "LXGWWenKaiMono 18" :foreground "#66ff66" :weight 'bold :height (cdr face)))
            ;; 设置 Org 模式下的文档标题字体大小
            (set-face-attribute 'org-document-title nil :font "LXGWWenKaiMono" :weight 'bold :height 1.8)
            ;; 设置 Org 模式下的字体属性
            (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
            (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch :height 0.85)
            (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch) :height 0.85)
            (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch) :height 0.85)
            (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
            (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
            (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
            ;; 设置 Org 模式下的文本美化
            (setq org-adapt-indentation t
                  org-hide-leading-stars t
                  org-hide-emphasis-markers t
                  org-pretty-entities t
                  org-ellipsis "…")
            ;; 设置 Org 模式下的源代码块设置
            (setq org-src-fontify-natively t
                  org-src-tab-acts-natively t
                  org-edit-src-content-indentation 0)

            (setq org-todo-keyword-faces
                  '(("TODO"      :inherit (org-todo region) :foreground "white" :background "#ff0a22" :weight bold)
                    ("INPROGRESS" :inherit (org-todo region) :foreground "#3867d6" :background "yellow" :weight bold)
                    ("WAITING"    :inherit (org-todo region) :foreground "#3867d6" :background "green" :weight bold)
                    ("REVIEW"     :inherit (org-todo region) :foreground "#81A1C1" :background "#F2F4C1" :weight bold)
                    ("DONE"       :inherit (org-todo region) :foreground "#808080" :background "#30343d" :weight bold)
                    ("CANCELED"       :inherit (org-todo region) :foreground "#808080" :background "#30343d" :weight bold)))
            ;; 设置 Org 模式下的特殊字体
            (setq org-fontify-quote-and-verse-blocks t)
            ;; 设置 Org 模式下的删除线颜色
            (add-to-list 'org-emphasis-alist
                         '("+" (:foreground "dark gray" :strike-through t)))
            ;; 设置 Org 模式下的 LaTeX 预览大小
            (plist-put org-format-latex-options :scale 2)
            ;; 设置 Org 模式下的表格对齐
            (if *is-gui*
                (valign-mode))
            ;; 设置 Org 模式下的动态子弹点
            (org-dynamic-bullets-mode)
            ;; 设置 Org 模式下的代码块高亮
            (org-fragtog-mode)
            ;; 设置 Org 模式下的视觉缩进
            (org-visual-indent-mode)
            ;; 设置 Org 模式下的 Org Modern 模式
            (global-org-modern-mode)
            ))

;; 设置 Org 模式下的字体
(defun set-org-font()
  (interactive)
  (progn
    (make-face 'org-face)
    (set-face-attribute 'org-face nil :font "LXGWWenKaiMono 12")
    (set-face-attribute 'org-face nil :family "LXGWWenKaiMono 12")
    (setq buffer-face-mode-face 'org-face)
    (buffer-face-mode)))

;; 为 Windows 系统设置字体
(if *is-windows*
    (add-hook 'org-mode-hook 'set-org-font)
  (progn
    ;; 为非 Windows 系统设置字体
    (set-face-attribute 'default nil :font "LXGWWenKaiMono 12")
    (set-face-attribute 'fixed-pitch nil :family "LXGWWenKaiMono")
    (set-face-attribute 'variable-pitch nil :family "LXGWWenKaiMono" :height 1.18)
    ))

;; 配置 org-superstar
(use-package org-superstar
  :ensure t
  :config
  (setq org-superstar-leading-bullet " ")
  (setq org-superstar-special-todo-items t)
  (setq org-superstar-todo-bullet-alist '(("TODO" . 9744)
                                          ("INPROGRESS" . 9744)
                                          ("WAITING" . 9744)
                                          ("REVIEW" . 9744)
                                          ("DONE" . 9744)
                                          ("CANCELED" . 9744)
					  )))

;; 配置 org-modern
(use-package org-modern
  :ensure t
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
        org-modern-todo-bullet-alist '(("TODO" . "•")
                                       ("INPROGRESS" . "•")
                                       ("WAITING" . "•")
                                       ("REVIEW" . "•")
                                       ("DONE" . "•") ("CANCELED" . "•"))
        org-modern-todo-faces '((todo . (:inherit org-todo :foreground "#A3BE8C" :weight bold))
                                (inprogress . (:inherit org-todo :foreground "#88C0D0" :weight bold))
                                (waiting . (:inherit org-todo :foreground "#8FBCBB" :weight bold))
                                (review . (:inherit org-todo :foreground "#81A1C1" :weight bold))
                                (done . (:inherit org-todo :foreground "#30343d" :weight bold))))
  (global-org-modern-mode))





;; CONFIG Ends here

   ;; ;; org-mode
   ;; `(org-agenda-date-today                            ((t (:foreground ,color-14 :slant italic :weight bold))) t)
   ;; `(org-agenda-clocking                              ((t (:foreground ,color-14 :weight bold))) t)
   ;; `(org-agenda-structure                             ((t (:inherit font-lock-comment-face))))
   ;; `(org-archived                                     ((t (:foreground ,color-13 :weight bold))))
   ;; `(org-checkbox                                     ((t (:foreground ,color-10 :background ,color-4 :bold t :inherit fixed-pitch))))
   ;; `(org-checkbox-statistics-todo                     ((t (:foreground ,color-10 :background ,color-4 :bold t :inherit fixed-pitch))))
   ;; `(org-date                                         ((t (:foreground ,color-11 :underline t))))
   ;; `(org-deadline-announce                            ((t (:foreground ,color-9))))
   ;; `(org-formula                                      ((t (:foreground ,color-11))))
   ;; `(org-macro                                        ((t (:foreground ,color-11 :italic t))))
   ;; `(org-headline-done                                ((t (:foreground ,color-8 :strike-through t))))
   ;; `(org-hide                                         ((t (:foreground ,color-4))))
   ;; `(org-document-title                               ((t (:foreground ,color-12 :height ,(tao-theme-height 0.8) :bold nil))))
   ;; `(org-document-info                                ((t (:foreground ,color-7 :height ,(tao-theme-height 0.8)))))
   ;; `(org-document-info-keyword                        ((t (:foreground ,color-7 :height ,(tao-theme-height 0.8)))))
   ;; `(org-checkbox-statistics-done                     ((t (:foreground ,color-14 :weight normal))))
   ;; `(org-checkbox-statistics-todo                     ((t (:foreground ,color-14 :weight normal))))
   ;; `(org-heading                                      ((t (:foreground ,color-14 :weight normal :variable-pitch t :inherit variable-pitch ))))
   ;; `(org-level-1                                      ((t ( :height ,(tao-theme-height 1.5) :inherit org-heading))))
   ;; `(org-level-2                                      ((t ( :height ,(tao-theme-height 1.1) :inherit org-heading))))
   ;; `(org-level-3                                      ((t ( :height ,(tao-theme-height 1.1) :inherit org-heading))))
   ;; `(org-level-4                                      ((t ( :height ,(tao-theme-height 1.1) :inherit org-heading))))
   ;; `(org-level-5                                      ((t ( :height ,(tao-theme-height 1.1) :inherit org-heading))))
   ;; `(org-level-6                                      ((t ( :height ,(tao-theme-height 1.1) :inherit org-heading))))
   ;; `(org-level-7                                      ((t ( :height ,(tao-theme-height 1.1) :inherit org-heading))))
   ;; `(org-level-8                                      ((t ( :height ,(tao-theme-height 1.1) :inherit org-heading))))
   ;; `(org-link                                         ((t (:foreground ,color-8 :underline ,color-7))))
   ;; `(org-scheduled                                    ((t (:foreground ,color-13))))
   ;; `(org-scheduled-previously                         ((t (:foreground ,color-10))))
   ;; `(org-scheduled-today                              ((t (:foreground ,color-11))))
   ;; `(org-sexp-date                                    ((t (:foreground ,color-11 :underline t))))
   ;; `(org-table                                        ((t (:foreground ,color-11 :inherit fixed-pitch))))
   ;; `(org-tag                                          ((t (:bold t :weight normal :italic nil :foreground ,color-8))))
   ;; `(org-time-grid                                    ((t (:foreground ,color-11))))
   ;; `(org-done                                         ((t (:bold nil :foreground ,color-8 :weight normal :box t))))
   ;; `(org-todo                                         ((t (:bold nil :foreground ,color-9 :weight normal :box t))))
   ;; `(org-upcoming-deadline                            ((t (:inherit font-lock-keyword-face))))
   ;; `(org-warning                                      ((t (:bold t :foreground ,color-10 :weight bold :underline nil))))
   ;; `(org-column                                       ((t (:background ,color-3))))
   ;; `(org-column-title                                 ((t (:background ,color-3 :underline t :weight bold))))
   ;; `(org-mode-line-clock                              ((t (:foreground ,color-13 :background ,color-3))))
   ;; `(org-mode-line-clock-overrun                      ((t (:foreground ,color-5 :background ,color-9))))
   ;; `(org-ellipsis                                     ((t (:foreground ,color-8 ))))
   ;; `(org-footnote                                     ((t (:foreground ,color-12 ))))
   ;; `(org-meta-line                                    ((t (:background ,color-4 :foreground ,color-7 :height ,(tao-theme-height 0.7) :inherit fixed-pitch :box nil))))
   ;; `(org-drawer                                    ((t (:background ,color-4 :foreground ,color-7 :height ,(tao-theme-height 0.7) :inherit fixed-pitch :box nil))))
   ;; `(org-block-begin-line                             ((t (:background ,color-4 :foreground ,color-7 :height ,(tao-theme-height 0.7) :inherit fixed-pitch :box nil))))
   ;; `(org-block-end-line                               ((t (:background ,color-4 :foreground ,color-7 :height ,(tao-theme-height 0.7) :inherit fixed-pitch))))
   ;; `(org-special-keyword                              ((t (:inherit org-meta-line :foreground ,color-8 :italic nil))))
   ;; `(org-property-value                               ((t (:inherit org-meta-line :foreground ,color-8 :italic t ))))
   ;; `(org-block-background                             ((t (:foreground ,color-4 :height ,(tao-theme-height 0.9) :inherit fixed-pitch))))
   ;; `(org-block                                        ((t (:background ,color-4  :height ,(tao-theme-height 0.9) :inherit fixed-pitch))))










(provide 'org-ui)
;;; org-ui.el ends here

;; (defun my/set-specific-faces-org ()
;;   (set-face-attribute 'org-code nil
;;                       :inherit '(shadow fixed-pitch))
;;   ;; Without indentation the headlines need to be different to be visible
;;   (set-face-attribute 'org-level-1 nil
;;                       :height 1.25
;;                       :foreground "#BEA4DB")
;;   (set-face-attribute 'org-level-2 nil
;;                       :height 1.15
;;                       :foreground "#A382FF"
;;                       :slant 'italic)
;;   (set-face-attribute 'org-level-3 nil
;;                       :height 1.1
;;                       :foreground "#5E65CC"
;;                       :slant 'italic)
;;   (set-face-attribute 'org-level-4 nil
;;                       :height 1.05
;;                       :foreground "#ABABFF")
;;   (set-face-attribute 'org-level-5 nil
;;                       :foreground "#2843FB")
;;   (set-face-attribute 'org-date nil
;;                       :foreground "#ECBE7B"
;;                       :height 0.8)
;;   (set-face-attribute 'org-document-title nil
;;                       :foreground "DarkOrange3"
;;                       :height 1.3)
;;   (set-face-attribute 'org-ellipsis nil
;;                       :foreground "#4f747a" :underline nil)
;;   (set-face-attribute 'variable-pitch nil
;;                       :family "Roboto Slab" :height 1.2))
;; (my/set-specific-faces-org)
