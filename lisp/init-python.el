(require 'use-package)
(my/install-package-if-not-found 'company-anaconda)
(my/install-package-if-not-found 'anaconda-mode)

(setenv "PYTHONPATH" "$HOME/anaconda3/bin/python")

;; for python
(use-package python
  :mode ("\\.py" . python-mode)
  :ensure t)

(require 'anaconda-mode)

;; disable some keys:

(global-unset-key (kbd "C-x 4 ."))
(global-unset-key (kbd "C-x 5 ."))
(global-unset-key (kbd "C-x 4 ="))
(global-unset-key (kbd "C-x 5 ="))
(global-unset-key (kbd "C-x 4 r"))
(global-unset-key (kbd "C-x 5 r"))

(define-key python-mode-map (kbd "C-d") 'anaconda-mode-find-definitions)
(define-key python-mode-map (kbd "C-c d") 'anaconda-mode-find-definitions-other-window)
(define-key python-mode-map (kbd "M-r") 'anaconda-mode-find-references)
(define-key python-mode-map (kbd "C-c r") 'anaconda-mode-find-references)

;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; (use-package python-black
;;   :demand t
;;   :after python
;;   :config
;;   (python-black-on-save-mode))

;; (if *is-gui*
;;     (message "we do not use elpy on GUI.")
;;   (progn
;;     (require 'elpy)
;;     (setq elpy-get-info-from-shell t)
;;     (setq elpy-shell-echo-input t)
;;     (setq elpy-shell-echo-output t)
;;     (use-package elpy
;;     :ensure t
;;     :defer t
;;     :init
;;     (advice-add 'python-mode :before 'elpy-enable))
;;     )
;;   )


;; 需要安装pyenv才能使用
;; (use-package pyenv-mode
;;  :init
;;  (add-to-list 'exec-path "~/.pyenv/shims")
;;  (setenv "WORKON_HOME" "~/.pyenv/versions/")
;;  :config
;;  (pyenv-mode))


;; (setq a (buffer-file-name))
;; (message a)
;; (setq b (buffer-name))
;; (setq c (nth 0(split-string a b)))
;; (format-time-string "%F_%A_%T")

;;nohup bash test.sh> 0414_1147-testlogres----running_test.log &
(defun lz/running-current-bash-with-nohup ()
  (interactive)
  (let* ((buffer-name (buffer-name))
	 (filepath (buffer-file-name))
	 (current-day-time (format-time-string "%m%d_%H%M"))
	 (filename (concat "runfile_" (s-replace ".sh" "" buffer-name)))
	 (directory-path (nth 0(split-string filepath buffer-name)))
	 (identify-part (read-from-minibuffer
			 "Please insert log file name:"))
	 (running-string (concat "nohup bash " buffer-name "> "
				 current-day-time "-"
				 identify-part "---"
				 filename ".log &"))
	 (default-directory directory-path))
    (message "RUNNING COMMAND '%s'" running-string)
    (let ((output (with-output-to-string
		    (shell-command running-string)
		    )))))
  )

(defun lz/running-current-python-with-nohup ()
  (interactive)
  (let* ((buffer-name (buffer-name))
	 (filepath (buffer-file-name))
	 (current-day-time (format-time-string "%m%d_%H%M"))
	 (filename (concat "runfile_" (s-replace ".py" "" buffer-name)))
	 (directory-path (nth 0 (split-string filepath buffer-name)))
	 (identify-part (read-from-minibuffer
			 "Please insert log file name:"))
	 (conda-env-name (read-from-minibuffer
			  "Please insert the anaconda name:"))

	 (environ_conda-str
		       (concat "export python=~/anaconda3/envs/"
			       conda-env-name "/bin/python \n"))
	 (running-string (concat "nohup $python " buffer-name " > "
				 current-day-time "-"
				 identify-part "---"
				 filename ".log &"))
	 (final-command (concat environ_conda-str 
				running-string))
	 (default-directory directory-path))
    (message "RUNNING COMMAND '%s'" final-command)
    (shell-command (format "bash -c %s"(shell-quote-argument
					final-command))))
  )

(defun lz/nohup-switch-run()
  (interactive)
  (if (string-match ".py" (buffer-name))
      (lz/running-current-python-with-nohup)
    (lz/running-current-bash-with-nohup)))

(global-set-key (kbd "<f5>") 'lz/nohup-switch-run)

(defun lz/run-occupy-python()
  (interactive)
  (let* ((device (read-from-minibuffer "device occupied:"))
	 (conda-env (read-from-minibuffer "conda environs:"))
	 (command (concat
		   (concat "export python=~/anaconda3/envs/" conda-env
			   "/bin/python \n")
		   (concat "nohup $python ~/occupyGPU/hehe.py --device="
			   device " >nohup.out &")))
	 )
    (shell-command (format "bash -c '%s'" command))
    (message command)
    (message (format "working on device %s ~" device))
    ))

;; tensorboard configuration.

(defun lz/open-tensorboard-in-current-buffer()
  (interactive)

  (let* ((buffer-name (buffer-name))
	 (filepath (buffer-file-name))
	 (current-day-time (format-time-string "%F"))
	 (directory-path (nth 0(split-string filepath buffer-name)))
	 (default-directory directory-path)
	 (host (nth 0 (split-string (nth 1 (split-string filepath "@")) ":"))))

    (setq tpath (read-from-minibuffer "tenserboard path is:" "\"./tensorboard\""))
    (setq envname "dslz")
    (setq full-string (concat
		       "source ~/anaconda3/bin/activate ~/anaconda3/envs/" envname "\n"
		       "nohup tensorboard --host=" host " --logdir=" tpath ">>results.log &"))
    
    (shell-command (format "bash -c %s" (shell-quote-argument full-string))))

  )

(defun lz/look-nvidia-state()
  (interactive)
  (let ((default-directory (nth 0 (split-string (buffer-file-name) (buffer-name)))))
    
    (shell-command "nvidia-smi")
    )
  )

(provide 'init-python)

;; 搜罗到的其他还没有尝试的链接,值得一试,如果有时间的话
;; https://www.jianshu.com/p/dac96805cb10

