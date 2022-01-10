;;; INIT-PATH --- This file gives some special paths for myself usage.
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2022, ZiLiang, all rights reserved.
;; Created:  8 January 2022
;;
;;; Commentary:
;;
;;  balblabl
;;
;;; Code:

(defvar paper-path "/mnt/d/paper/" "PATH of Latex Papers in Writing...")

(defun open-papers-in-writing()
  (interactive)
  (counsel-find-file paper-path))

(provide 'init-path)

;;; init-path.el ends here
