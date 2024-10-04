;;; INIT-RG --- 
;;
;; Author: Zi Liang <zi1415926.liang@connect.polyu.hk>
;; Copyright © 2024, ZiLiang, all rights reserved.
;; Created:  1 October 2024
;;
;;; Commentary:
;;
;;  
;;
;;; Code:

(my/install-package-if-not-found 'rg)

(require 'rg)

;; C-c s
(rg-enable-default-bindings)

(setq rg-executable "rg")

(provide 'init-rg)
;;; init-rg.el ends here
