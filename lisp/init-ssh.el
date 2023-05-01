(require 'tramp)
;; (add-to-list 'tramp-remote-path "/home/zliang/software/ctags/")

(setq explicit-shell-file-name "/bin/bash")
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(defun ssh-connect-41 ()
  (interactive)
  (if *is-windows*
  (counsel-find-file "/plink:szhang@219.245.186.41:/home/szhang/liangzi_need_smile")
  (counsel-find-file "/ssh:szhang@219.245.186.41:/home/szhang/liangzi_need_smile")
  )
  )

(defun ssh-connect-meidi ()
  (interactive)
  (counsel-find-file "/ssh:zijian@128.173.236.231:22/")
  )

(defun ssh-connect-42 ()
  (interactive)
  (if *is-windows*
  (counsel-find-file "/plink:zliang@219.245.186.42:/home/zliang/")
  (counsel-find-file "/ssh:zliang@219.245.186.42:/home/zliang/")
  )
  )

(defun ssh-connect-45 ()
  (interactive)
  (if *is-windows*
  (counsel-find-file "/plink:liangzi@219.245.186.45:/home/liangzi")
  (counsel-find-file
   "/ssh:liangzi@219.245.186.45:/home/liangzi/")
  )
  )
;; "/ssh:szhang@219.245.186.45:/home/szhang/liangzi_need_smile"

(defun ssh-connect-48 ()
  (interactive)
  (if *is-windows*
   (counsel-find-file "/plink:liangzi@219.245.186.48:/home/liangzi/")
   (counsel-find-file "/ssh:liangzi@219.245.186.48:/home/liangzi/")
      )
  )

(defun ssh-connect-49 ()
  (interactive)
  (if *is-windows*
   (counsel-find-file "/plink:liangzi@219.245.186.49:/home/liangzi/")
   (counsel-find-file "/ssh:liangzi@219.245.186.49:/home/liangzi/")
      )
  )

;; (defun plinkx-connect-48 ()
;;   (interactive)
;;   (counsel-find-file "/plink:zliang@219.245.186.48:/home/zliang/")
;;   )

 
(provide 'init-ssh)
