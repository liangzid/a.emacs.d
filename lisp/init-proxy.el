;;; INIT-PROXY --- 
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 16 四月 2023
;;
;;; Commentary:
;;
;;  set proxy for emacs
;;
;;; Code:

(defun lz/toggle-proxy()
  (interactive)
  (if (eq url-proxy-services nil)
      (lz/open-http-proxy)
    (progn
      (setq url-proxy-services nil)
      (message "Proxy Closed!"))))


(defun lz/open-http-proxy()
  "to use this function, you need to get a file called ``http_proxy.json''
 and it must contains the arrtributes of `name',`head',`url',`username',
  as well as the `password'."
  (interactive)
  (let* ((config-proxy-path "D:/http_proxy.json"))
    (if *is-linux*
	(setq config-proxy-path "~/http_proxy.json"))
    (let* ((config-info (json-read-file config-proxy-path))
	   (name (cdr (assoc 'name config-info)))
	   (head (cdr (assoc 'head config-info)))
	   (url (cdr (assoc 'url config-info)))
	   (uname (cdr (assoc 'username config-info)))
	   (pwd (cdr (assoc 'password config-info)))
	   (res (concat head "://" uname ":" pwd "@" url
						   ))
	   )
      (message res)
      (setq url-proxy-services `(("http" . ,res)
				 ("https" . ,res)))
      (message (format "Proxy Open! Using %s ~" name))
      )
    )
  )

(global-set-key (kbd "<f4>") 'lz/toggle-proxy)
(provide 'init-proxy)
;;; init-proxy.el ends here
