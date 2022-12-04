(add-to-list 'load-path "~/.emacs.d/other-files/emacs-application-framework/")
(require 'eaf)
(require 'eaf-airshare)
;; (require 'eaf-browser)
;; (require 'eaf-camera)
;; (require 'eaf-demo)
;; (require 'eaf-file-browser)
;; (require 'eaf-file-manager)
;; (require 'eaf-file-sender)
;; (require 'eaf-git)
(require 'eaf-image-viewer)
;; (require 'eaf-jupyter)
(require 'eaf-markdown-previewer)
;; (require 'eaf-mermaid)
(require 'eaf-mindmap)
;; (require 'eaf-music-player)
;; (require 'eaf-netease-cloud-music)
(require 'eaf-org-previewer)
(require 'eaf-pdf-viewer)
;; (require 'eaf-rss-reader)
;; (require 'eaf-system-monitor)
;; (require 'eaf-terminal)
;; (require 'eaf-video-player)
(require 'eaf-vue-demo)

(use-package eaf
  :load-path "~/.emacs.d/other-files/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :init
  (use-package epc :defer t :ensure t)
  (use-package ctable :defer t :ensure t)
  (use-package deferred :defer t :ensure t)
  (use-package s :defer t :ensure t)
  :config
  (setq eaf-pdf-dark-mode "ignore")
)
  ;; :custom
  ;; (eaf-browser-continue-where-left-off t)
  ;; :config
  ;; (eaf-setq eaf-browser-enable-adblocker "true")
  ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  ;; (setq eaf-pdf-dark-mode "ignore")
  ;; (eaf-bind-key nil "M-q" eaf-browser-keybinding)

  ) ;; unbind, see more in the Wiki



;; (defun adviser-find-file (orig-fn file &rest args)
;;   (let ((fn (if (commandp 'eaf-open) 'eaf-open orig-fn)))
;;     (pcase (file-name-extension file)
;;       ("pdf"  (apply fn file nil))
;;       ("epub" (apply fn file nil))
;;       (_      (apply orig-fn file args)))))
;; (advice-add #'find-file :around #'adviser-find-file)



(provide 'init-eaf)
