;; load this package
;; (load-file "~/.emacs.d/other-files/easy-collections/collections.el")
;; (require 'easy-collections)

;;; custom setting variables if you needed.
;; setting your save path. default:"~/.emacs.d/collected/box.org"
;; (setq collected-save-path "~/.emacs.d/collected/box.org")

;; setting your save format. default:
;;--------------------------------------------------------------------------
;; ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> COLLECTED TIME: </time>
;; >> FROM BUFFER: </buffer>
;; >> FROM PATH: </filepath>
;; #+BEGIN_SRC </mode> 
;; </region> 
;; #+END_SRC 
;; >>YOUR COMMENT: </comment>
;; "
;;--------------------------------------------------------------------------
;; (setq collected-format "YOUR/FORMAT/")
;; setting your keybindings to quick running collected command.
;; (global-set-key (kbd "") 'collected-run)
;; you can also running with "M-x collected-run"

(provide 'init-collection)
