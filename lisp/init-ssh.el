;; (my/install-package-if-not-found 'tramp)
;; (my/install-package-if-not-found 'counsel-tramp)
(require 'tramp)
;; (require 'counsel-tramp)
;; (add-to-list 'tramp-remote-path "/home/zliang/software/ctags/")


(if *is-windows*
    (progn
      ;; (setq tramp-default-method "plink")
      ;; (add-to-list 'exec-path "D:/sf/Git/newgit/bin/")
      ;; (add-to-list 'exec-path "D:/sf/Git/newgit/")
      ;; (setq explicit-shell-file-name "bash")
      ;; (setq shell-file-name explicit-shell-file-name)
      ;; (setq tramp-default-remote-shell "/bin/bash")
      ;; (add-to-list 'tramp-connection-properties
      ;; 		   (list (regexp-quote "/plink:liangzi")
      ;; 			 "remote-shell" "/bin/bash"))
      ;; (add-to-list 'tramp-connection-properties
      ;; 		   (list (regexp-quote "/plink:liangzi")
      ;;              "remote-shell-login" '("-i")))
      ;; (connection-local-set-profile-variables
      ;;  'remote-bash
      ;;  '((explicit-shell-file-name . "/bin/bash")
      ;; 	 (explicit-bash-args . "-i")
      ;; 	 ))
      ;; (connection-local-set-profiles
      ;;  '(:application tramp :protocol "plink")
      ;;  'remote-bash)
      (add-to-list 'exec-path "D:/Program Files/Git/usr/bin")
      (setq explicit-shell-file-name "bash.exe")
      (setq shell-file-name "bash.exe")
      (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
      (prefer-coding-system 'utf-8)
      )
  (progn
    (message "...")

   ;;  (add-to-list 'tramp-connection-properties
   ;; 		 (list (regexp-quote "/ssh:liangzi")
   ;;                     "remote-shell" "/bin/bash"))
   ;;  (add-to-list 'tramp-connection-properties
   ;; 		 (list (regexp-quote "/ssh:liangzi")
   ;;                     "remote-shell-login" '("-i")))
   ;;  (add-to-list 'tramp-connection-properties
   ;; 		 (list (regexp-quote "/ssh:zi")
   ;;                     "remote-shell" "/bin/bash"))
   ;;  (add-to-list 'tramp-connection-properties
   ;; 		 (list (regexp-quote "/ssh:zi")
   ;;                     "remote-shell-login" '("-i")))

   (setq tramp-default-method "ssh")
   ;; (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
   ;; (setq tramp-ssh-extra-args "-o ForwardAgent=yes")
    )
    )

(setq new-tramp-pth
      '(
	"/home/zi/anaconda3/bin"
	"/home/zi/anaconda3/condabin"
	"/home/liangzi/anaconda3/bin"
	"/home/liangzi/anaconda3/condabin"
	"/snap/bin"
	))

(with-eval-after-load "tramp" 
  (progn
    (loop for pth in new-tramp-pth
	  do (add-to-list 'tramp-remote-path pth))
    ))



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


(defun ssh-connect-234 ()
  (interactive)
   (counsel-find-file "/ssh:liangzi@158.132.150.234:/home/liangzi/")
  )

(defun ssh-connect-226 ()
  (interactive)
  (if *is-windows*
  (counsel-find-file "/plink:zi@158.132.150.226:/home/zi/")
  (counsel-find-file "/ssh:zi@158.132.150.226:/home/zi/")
  )
  )

(defun ssh-connect-231 ()
  (interactive)
  (if *is-windows*
  (counsel-find-file "/plink:zi@158.132.150.231:/home/zi/")
  (counsel-find-file "/ssh:zi@158.132.150.231:/home/zi/")
  )
  )

(defun ssh-connect-142 ()
  (interactive)
  (if *is-windows*
  (counsel-find-file "/plink:zi@10.21.20.142:/home/zi/")
  (counsel-find-file "/ssh:zi@10.21.20.142:/home/zi/")
  )
  )

(defun ssh-connect-141 ()
  (interactive)
  (if *is-windows*
  (counsel-find-file "/plink:zi@10.21.20.141:/home/zi/")
  (counsel-find-file "/ssh:zi@10.21.20.141:/home/zi/")
  )
  )

(defun ssh-connect-fromout-226 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@gs9.astaple.com:/home/zi/")
  )

(defun ssh-connect-fromout-231 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@gs10.astaple.com:/home/zi/")
  )

(defun ssh-connect-fromout-142 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@10.21.20.142:/home/zi")
  )

(defun ssh-connect-fromout-141 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@10.21.20.141:/home/zi/")
  )
 
(provide 'init-ssh)
