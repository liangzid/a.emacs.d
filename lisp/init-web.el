;; 1. 按需安装（保持你的习惯）
(my/install-package-if-not-found 'emmet-mode)
(my/install-package-if-not-found 'web-mode)
(my/install-package-if-not-found 'js2-mode)
(my/install-package-if-not-found 'js2-refactor)

;; 2. 只注册“用到时再加载”的存根
(autoload 'emmet-mode "emmet-mode" nil t)
(autoload 'web-mode  "web-mode"  nil t)
(autoload 'js2-mode  "js2-mode"  nil t)
(autoload 'js2-refactor-mode "js2-refactor" nil t)

;; 3. mode 与扩展名关联
(add-to-list 'auto-mode-alist '("\\.js\\'"   . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; 4. hook：依然写，但不会触发立即加载
(dolist (hook '(sgml-mode-hook css-mode-hook web-mode-hook))
  (add-hook hook #'emmet-mode))

(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; 5. web-mode 里额外绑定
(add-hook 'web-mode-hook
          (lambda ()
            (local-set-key (kbd "M-e") 'emmet-expand-yas)))

(provide 'init-web)









