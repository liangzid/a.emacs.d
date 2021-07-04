(require 'js2-mode)
(require 'web-mode)



(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))


(add-hook 'js2-mode-hook #'js2-refactor-mode)














