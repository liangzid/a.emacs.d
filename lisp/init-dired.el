(my/install-package-if-not-found 'dirvish)
(require 'dired)
;; (require 'dirvish)

;; (put 'dired-find-alternate-file 'disabled nil);;不必每次都新建buffer
;; ;; 延迟加载,可提升编辑器的加载速度
;; (with-eval-after-load 'dired
;;     (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; (dirvish-override-dired-mode 1)

(provide 'init-dired)
