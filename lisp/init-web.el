(my/install-package-if-not-found 'emmet-mode)
(my/install-package-if-not-found 'web-mode)
(my/install-package-if-not-found 'js2-mode)
(require 'emmet-mode)
(require 'web-mode)
(require 'js2-mode)

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(setq auto-mode-alist
     (append
      '(("\\.js\\'" . js2-mode)
	("\\.html\\'" . web-mode)
	)
       auto-mode-alist))

(add-hook 'js2-mode-hook #'js2-refactor-mode)

(add-hook 'web-mode-hook '(lambda() (local-set-key (kbd "M-e") 'emmet-expand-yas)))

(provide 'init-web)









