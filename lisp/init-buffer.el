;;; INIT-BUFFER --- Manage Buffer for Myself.
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2021, ZiLiang, all rights reserved.
;; Created: 22 December 2021
;;
;;; Commentary:
;;
;;  This file provide some pluggles for manage buffers.
;;
;;; Code:

(defun clean-all-buffers()
  (let* ((bufls (buffer-list))
	 (i (length bufls)))
    (while (> i 0)
      (progn
	(setq i (- i 1))
	(message "%s" bufls)
	(message "%d" i)
      (kill-buffer (nth i bufls))))
    (message "All buffers cleaning done.")))

(buffer-list)

(length (buffer-list))

(kill-buffer "0.02_test.res")

(clean-all-buffers)

(current-buffer)

(kill-buffer (current-buffer))

(provide 'init-buffer)
;;; init-buffer.el ends here
