(my/install-package-if-not-found 'metaweblog)
(my/install-package-if-not-found 'org2blog)
(my/install-package-if-not-found 'xml-rpc)
(require 'metaweblog)
(require 'org2blog)
(require 'xml-rpc)

(setq org2blog/wp-blog-alist
      '(("cnblogs"
         :url "http://rpc.cnblogs.com/metaweblog/frostliangzi"
         :username "frostliangzi"
         ;; :password "xxxxx"
         :default-title "Hello World"
	 )))

;; (add-to-list 'load-path
;; 	     "~/.emacs.d/other-files/cnblogs/")

;; (require 'cnblogs)



;; ;; (add-hook 'org-mode-hook (lambda ()
;;     ;; (load-file "~/.emacs.d/other-files/cnblogs/metaweblog.el")))
;; (add-hook 'org-mode-hook (lambda ()
;;                            (cnblogs-minor-mode)))
;; ;; (setq org-export-show-temporary-export-buffer nil)

(provide 'init-blog)


