;;; INIT-SMEX ---
;; for smex
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2022, ZiLiang, all rights reserved.
;; Created:  4 十二月 2022
;;
;;; Commentary:
;;
;;  
;;
;;; Code:

(my/install-package-if-not-found 'smex)
(require 'smex) ; Not needed if you use package.el
(smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(provide 'init-smex)

;;; init-smex.el ends here
