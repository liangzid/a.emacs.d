;;; INIT-KEYFREQ ---
;;
;; statistic the keyboard frequency
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2022, ZiLiang, all rights reserved.
;; Created:  4 十二月 2022
;;
;;; Commentary:
;;
;;  
;;
;;; Code:

(my/install-package-if-not-found 'keyfreq)

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(provide 'init-keyfreq)


;;; init-keyfreq.el ends here
