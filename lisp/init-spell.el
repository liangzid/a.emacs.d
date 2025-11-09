
;; (if *is-linux*
;;     (progn
;;       (my/install-package-if-not-found 'jinx)
;;       (require 'jinx)
;;       (add-hook 'org-mode-hook #'jinx-mode)
;;       (add-hook 'markdown-mode-hook #'jinx-mode)
;;       (add-hook 'LaTeX-mode-hook #'jinx-mode)
;;       (global-set-key (kbd "M-c") 'jinx-correct)
;;       (setq jinx-languages "en")
;;       ))


(when *is-linux*
  (use-package flycheck-vale
    :ensure t        ;; 自动装
    :after flycheck  ;; 等到 flycheck 加载完再执行
    :config
    (flycheck-vale-setup)))


(provide 'init-spell)


;;
;;
