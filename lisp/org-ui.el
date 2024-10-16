;;; ORG-UI ---
;;
;; all UI settings for ORG mode.
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 26 二月 2023
;;
;;; Code:

(my/install-package-if-not-found 'org-modern)
(my/install-package-if-not-found 'pangu-spacing)
(my/install-package-if-not-found 'org-fragtog)
(my/install-package-if-not-found 'valign)
;; (my/install-package-if-not-found 'ftable)
(require 'valign)
;; (require 'ftable)
(require 'org-visual-indent)
(require 'org-dynamic-bullets)

(global-pangu-spacing-mode 0)

;; (if *is-gui*
;;     (progn
;;       ;; open the valign for table alignments in org mode.
;;        (add-hook 'org-mode-hook #'valign-mode)
;;       ))


(add-hook 'org-mode-hook
          (lambda ()
            (org-shifttab 2)))
(setq org-modern-table nil) ;; 存在对齐问题，故禁用之~
(if *is-gui*
    (progn
	(add-hook 'org-mode-hook #'org-modern-mode)
	(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
	;; for org's mathmatical completion.
	(add-hook 'org-mode-hook 'org-fragtog-mode)
	(add-hook 'org-mode-hook 'org-visual-indent-mode)
	;; (add-hook 'org-mode-hook 'org-dynamic-bullets-mode)
      ))

;; set special font for org-mode.

(defun set-org-font()
  (interactive)
  (progn
    (make-face 'org-face)
    (set-face-attribute 'org-face nil :font "Times New Roman 12")
    (set-face-attribute 'org-face nil
			:family "Microsoft YaHei UI 12")
    (setq buffer-face-mode-face 'org-face)
    (buffer-face-mode)))

(if *is-windows*
    (add-hook 'org-mode-hook 'set-org-font)
  (progn

   ;; (set-face-attribute 'org-level-2 nil :font "Maple Mono 16"
   ;;			:weight bold)
    )
    )


(setq org-src-fontify-natively t)

;; Make verbatim with highlight text background.

;; (add-to-list 'org-emphasis-alist
;;            '("=" (:background " #fef7ca")))

;; Make deletion(obsolote) text foreground with dark gray.
(add-to-list 'org-emphasis-alist
           '("+" (:foreground "dark gray"
                  :strike-through t)))
;; Make code style around with box.

;; (setq org-hide-emphasis-markers nil)

;; (add-to-list 'org-emphasis-alist
	     ;; '("/" italic))
(setq org-fontify-quote-and-verse-blocks t)

(setq org-src-tab-acts-natively t)
(setq org-src-preserve-indentation nil)

(setq org-log-done 'time)
(setq org-log-reschedule 'time)
(setq org-log-redeadline 'time)

(setq org-ellipsis " ▼ ")

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
