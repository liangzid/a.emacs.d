(require 'tramp)
;; (add-to-list 'tramp-remote-path "/home/zliang/software/ctags/")


(if *is-windows*
    (progn
      (setq tramp-default-method "plink")
      (add-to-list 'exec-path "D:/sf/Git/newgit/bin/")
      (add-to-list 'exec-path "D:/sf/Git/newgit/")
      (setq explicit-shell-file-name "bash")
      (setq shell-file-name explicit-shell-file-name)
      (setq tramp-default-remote-shell "/bin/bash")
      (add-to-list 'tramp-connection-properties
		   (list (regexp-quote "/plink:liangzi")
			 "remote-shell" "/bin/bash"))
      (add-to-list 'tramp-connection-properties
		   (list (regexp-quote "/plink:liangzi")
                   "remote-shell-login" '("-i")))
      (connection-local-set-profile-variables
       'remote-bash
       '((explicit-shell-file-name . "/bin/bash")
	 (explicit-bash-args . "-i")
	 ))
      (connection-local-set-profiles
       '(:application tramp :protocol "plink")
       'remote-bash)
      )
  (progn
    (add-to-list 'tramp-connection-properties
		 (list (regexp-quote "/ssh:liangzi")
                       "remote-shell" "/bin/bash"))
    (add-to-list 'tramp-connection-properties
		 (list (regexp-quote "/ssh:liangzi")
                       "remote-shell-login" '("-i")))
    )

    )
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(let ((process-environment tramp-remote-process-environment))
  (setenv "ENV" "$HOME/.bashrc")
  (setq tramp-remote-process-environment process-environment))




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
  (counsel-find-file "/plink:liangzi@219.245.186.45:/home/liangzi/")
  (counsel-find-file "/ssh:liangzi@219.245.186.45:/home/liangzi/")
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


 
(provide 'init-ssh)
