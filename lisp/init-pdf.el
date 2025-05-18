;;; INIT-PDF --- 
;;
;; Author: Zi Liang <zi1415926.liang@connect.polyu.hk>
;; Copyright © 2025, ZiLiang, all rights reserved.
;; Created: 18 May 2025
;;
;;; Commentary:
;;
;;  
;;
;;; Code:

(use-package reader
:straight '(reader :type git :host codeberg :repo "divyaranjan/emacs-reader"
	    :files ("reader.el" "render-core.so")
	    :pre-build ("make" "all")))

(provide 'init-pdf)

;;; init-pdf.el ends here
