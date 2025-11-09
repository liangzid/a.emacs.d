;;; INIT-RSS --- 
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2022, ZiLiang, all rights reserved.
;; Created: 17 January 2022
;;
;;; Commentary:
;;
;;  
;;
;;; Code:

(my/install-package-if-not-found 'elfeed-org)
(my/install-package-if-not-found 'elfeed)


;; use an org file to organise feeds
(use-package elfeed-org
  :ensure t
  :defer t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.emacs.d/feeds/myfeeds.org")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elfeed feed reader                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;shortcut functions
(defun bjm/elfeed-show-all ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-all"))
(defun bjm/elfeed-show-emacs ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-emacs"))
(defun bjm/elfeed-show-daily ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-daily"))
(defun lz/elfeed-show-havefun ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-havefun"))


;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun bjm/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

;;write to disk when quiting
(defun bjm/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))


(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
              ("A" . bjm/elfeed-show-all)
              ("E" . bjm/elfeed-show-emacs)
              ("D" . bjm/elfeed-show-daily)
              ("H" . lz/elfeed-show-havefun)
              ("q" . bjm/elfeed-save-db-and-bury)
	      ))


(provide 'init-rss)
;;; init-rss.el ends here
