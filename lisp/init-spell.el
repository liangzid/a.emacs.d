
(if *is-linux*
    (progn
      (my/install-package-if-not-found 'jinx)
      (require 'jinx)
      (add-hook 'org-mode-hook #'jinx-mode)
      (add-hook 'markdown-mode-hook #'jinx-mode)
      (add-hook 'LaTeX-mode-hook #'jinx-mode)
      (global-set-key (kbd "M-c") 'jinx-correct)
      (setq jinx-languages "en")
      ))

(provide 'init-spell)


;;
;;
