;; nothing.



;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;;用来消除emacs 27以上版本的警告。
(setq warning-suppress-log-types '((package reinitialization)))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/other-files"))

(require 'init-elpa)
(require 'init-self-config-function)

(require 'init-python)
(require 'init-org)
(require 'init-latex)
(require 'init-cpp)
(require 'init-rust)
;;(require 'init-blog)

(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-spell)
(require 'init-roam)
(require 'init-packages)
(require 'init-lsp)
;; (setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
;; (load-file custom-file)


(defconst *is-server* t)
(if (and *is-linux* (not *is-server*))
    ((message "prepare to load eaf which may cost some time...")
     (require 'init-eaf))
  (message "---> In Server, donnot need to use eaf.")  
    )

(setq gc-cons-threshold (* 2 1000 1000))

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rust-mode ctable deferred epc s company citre projectile hungry-delete youdao-dictionary swiper counsel smartparens use-package undo-tree which-key neotree smart-tab yasnippet all-the-icons ace-flyspell evil evil-leader python pyvenv python-black pyenv-mode anaconda-mode elpy company-anaconda org-bullets org-alert org-download htmlize org-roam org-roam-server exec-path-from-shell popwin monokai-theme rainbow-mode rainbow-delimiters auctex cdlatex reftex company-auctex magit js2-mode web-mode leetcode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
