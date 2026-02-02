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

   (setq tramp-default-method "sshx")
   ;; (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
   ;; (setq tramp-ssh-extra-args "-o ForwardAgent=yes")
    )
    )
(require 'tramp)
(with-eval-after-load 'tramp
  (unless (boundp 'tramp-ssh-controlmaster-options)
    (setq tramp-ssh-controlmaster-options nil))
  (add-to-list 'tramp-ssh-controlmaster-options
               "-o ServerAliveInterval=60 -o ServerAliveCountMax=3"))

(setq new-tramp-pth
      '(
	"/home/zi/anaconda3/bin"
	"/home/zi/anaconda3/conda/bin"
	"/home/liangzi/anaconda3/bin"
	"/home/liangzi/anaconda3/conda/bin"
	"/snap/bin"
	))

(with-eval-after-load "tramp" 
  (progn
    (loop for pth in new-tramp-pth
	  do (add-to-list 'tramp-remote-path pth))
    ))



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

(defun ssh-connect-designer ()
  (interactive)
  (if *is-windows*
  (counsel-find-file "/plink:ronghua@206.189.46.166:/home/ronghua/")
  (counsel-find-file "/ssh:ronghua@206.189.46.166:/home/ronghua/")
  )
  )

;; Visit Servers from Internal LLMs.

(defun ssh-connect-cs1 ()
  (interactive)
  (counsel-find-file "/ssh:zi@cs1.astaple.com:/home/zi")
  )

(defun ssh-connect-cs2 ()
  (interactive)
  (counsel-find-file "/ssh:zi@cs2.astaple.com:/home/zi")
  )

(defun ssh-connect-gs9 ()
  (interactive)
  (counsel-find-file "/ssh:zi@gs9.astaple.com:/home/zi")
  )

(defun ssh-connect-gs10 ()
  (interactive)
  (counsel-find-file "/ssh:zi@gs10.astaple.com:/home/zi")
  )

(defun ssh-connect-gs11 ()
  (interactive)
  (counsel-find-file "/ssh:liangzi@gs11.astaple.com:/home/zi")
  )

(defun ssh-connect-gs12 ()
  (interactive)
  (counsel-find-file "/ssh:zi@gs12.astaple.com:/home/zi")
  )

(defun ssh-connect-gs13 ()
  (interactive)
  (counsel-find-file "/ssh:zi@gs13.astaple.com:/home/zi")
  )

(defun ssh-connect-gs14 ()
  (interactive)
  (counsel-find-file "/ssh:zi@gs14.astaple.com:/home/zi")
  )

(defun ssh-connect-gs15 ()
  (interactive)
  (counsel-find-file "/ssh:zi@gs15.astaple.com:/home/zi")
  )

(defun ssh-connect-gs16 ()
  (interactive)
  (counsel-find-file "/ssh:zi@gs16.astaple.com:/home/zi")
  )

;; setting servers from out service.

(defun ssh-connect-fromout-cs1 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@cs1.astaple.com:/home/zi")
  )

(defun ssh-connect-fromout-cs2 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@cs2.astaple.com:/home/zi")
  )

(defun ssh-connect-fromout-gs9 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@gs9.astaple.com:/home/zi")
  )

(defun ssh-connect-fromout-gs10 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@gs10.astaple.com:/home/zi")
  )

(defun ssh-connect-fromout-gs11 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:liangzi@gs11.astaple.com:/home/zi")
  )

(defun ssh-connect-fromout-gs12 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@gs12.astaple.com:/home/zi")
  )

(defun ssh-connect-fromout-gs13 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@gs13.astaple.com:/home/zi")
  )

(defun ssh-connect-fromout-gs14 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@gs14.astaple.com:/home/zi")
  )

(defun ssh-connect-fromout-gs15 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@gs15.astaple.com:/home/zi")
  )

(defun ssh-connect-fromout-gs16 ()
  (interactive)
  (counsel-find-file "/ssh:zi@is1.astaple.com|ssh:zi@gs16.astaple.com:/home/zi")
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



(defun ssh-connect-vuln ()
  (interactive)
  (counsel-find-file "/ssh:ubuntu@129.226.147.182:/home/ubuntu/")
  )
 
(provide 'init-ssh)
