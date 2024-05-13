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
	(add-hook 'org-mode-hook 'org-fragtog-mode)
	(add-hook 'org-mode-hook 'org-visual-indent-mode)
	(add-hook 'org-mode-hook 'org-dynamic-bullets-mode)
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
(add-to-list 'org-emphasis-alist
           '("~" (:box (:line-width 1
                        :color "grey75"
                        :style released-button))))

;; (setq org-hide-emphasis-markers nil)

;; (add-to-list 'org-emphasis-alist
	     ;; '("/" italic))
(setq org-fontify-quote-and-verse-blocks t)

(setq org-src-tab-acts-natively t)
(setq org-src-preserve-indentation nil)

(setq org-log-done t)
(setq org-ellipsis " ▼ ")

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
