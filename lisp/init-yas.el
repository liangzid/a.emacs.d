
;; config for yasnippet.

(setq yas-snippet-dirs              ;;设置模板存放的地址.
      '("~/.emacs.d/my-yas"))

;; (yas-global-mode 1)

(add-hook 'prog-mode-hook 'my-enable-yas-minor-mode)
(add-hook 'text-mode-hook 'my-enable-yas-minor-mode)

(provide 'init-yas)
