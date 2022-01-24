(require 'tramp)
;; (add-to-list 'tramp-remote-path "/home/zliang/software/ctags/")

(defun ssh-connect-41 ()
  (interactive)
  (counsel-find-file "/ssh:szhang@219.245.186.41:/home/szhang/liangzi_need_smile")
  )

(defun ssh-connect-meidi ()
  (interactive)
  (counsel-find-file "/ssh:zijian@128.173.236.231:22/")
  )

(defun ssh-connect-42 ()
  (interactive)
  (counsel-find-file "/ssh:zliang@219.245.186.42:/home/zliang/")
  )

(defun ssh-connect-45 ()
  (interactive)
  (counsel-find-file "/ssh:szhang@219.245.186.45:/home/szhang/liangzi_need_smile")
  )

 
(provide 'init-ssh)
