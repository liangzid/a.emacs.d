;;; INIT-TELEGRAM --- running TG in emacs.
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2021, ZiLiang, all rights reserved.
;; Created: 30 November 2021
;;
;;; Commentary:
;;
;;  you should find the install introduction from here   https://zevlg.github.io/telega.el/
;;
;;; Code:

(if *is-linux*
    (progn
      (my/install-package-if-not-found 'telega)
      (message "To use TELEGA, you need to open the proxy with <f1>.")
      (if (not *is-gui*)
	  (setq telega-use-images nil))))

(provide 'init-telegram)

;;; init-telegram.el ends here
