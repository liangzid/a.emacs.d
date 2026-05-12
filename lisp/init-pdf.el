;;; INIT-PDF --- pdf-tools configuration
;;
;; Author: Zi Liang <zi1415926.liang@connect.polyu.hk>
;; Copyright © 2025, ZiLiang, all rights reserved.
;; Created: 18 May 2025
;;
;;; Commentary:
;;
;;  Configure pdf-tools as the PDF reader in Emacs.
;;
;;; Code:

(unless (package-installed-p 'pdf-tools)
  (package-refresh-contents)
  (package-install 'pdf-tools))

(pdf-tools-install)


(provide 'init-pdf)

;;; init-pdf.el ends here
