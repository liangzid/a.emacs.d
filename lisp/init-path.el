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
(defvar code-path "/mnt/d/code/" "PATH of codes in writing...")

(defvar win10-paper-path "~/paper/" "PATH of Latex Papers in Writing...")
(defvar win10-code-path "~/code/" "PATH of codes in writing...")
(defvar win10-worklog-path "~/worklog/" "PATH of worklogs in writing...")

(defun open-papers-in-writing()
  (interactive)
  (if *is-gui*
      (counsel-find-file win10-paper-path)
  (counsel-find-file paper-path)))

(defun open-codes-in-d()
  (interactive)
  (if *is-gui*
      (counsel-find-file win10-code-path)
  (counsel-find-file code-path)))

(defun open-worklog-in-d()
  (interactive)
  (if *is-gui*
      (counsel-find-file win10-worklog-path)
  (counsel-find-file code-path)))

(provide 'init-path)

;;; init-path.el ends here
