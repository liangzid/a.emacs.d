;;; INIT-ESHELL --- 
;;
;; Author: Zi Liang <zi1415926.liang@connect.polyu.hk>
;; Copyright © 2024, ZiLiang, all rights reserved.
;; Created: 22 March 2024
;;
;;; Commentary:
;;
;;  
;;
;;; Code:


;; Remove Environment of Windows to improve the inference time.

(defun eshell-remove-windows-path ()
  "Filter out windows paths from the $PATH."
  (setq exec-path (remove-if (lambda (p)
			       (or
				(string-match-p "/mnt/d/" p)
				(string-match-p "/mnt/c/" p)
				)
			       )
			     exec-path))
  (setenv "PATH" (mapconcat 'identity exec-path path-separator))
  )

(add-hook 'eshell-mode-hook 'eshell-remove-windows-path)
(add-hook 'shell-mode-hook 'eshell-remove-windows-path)


(provide 'init-eshell)

;;; init-eshell.el ends here
