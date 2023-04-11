(require 'use-package)
(my/install-package-if-not-found 'company-anaconda)
(my/install-package-if-not-found 'anaconda-mode)

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

(defun lz/running-current-bash-with-nohup ()
  (interactive)
  (let* ((buffer-name (buffer-name))
	 (filepath (buffer-file-name))
	 (current-day-time (format-time-string "%F_%A_%T"))
	 (filename (concat "running_" (s-replace ".sh" "" buffer-name)))
	 (directory-path (nth 0(split-string filepath buffer-name)))
	 (running-string (concat "nohup bash " buffer-name "> "
				 current-day-time "-" filename ".log &"))
	 (default-directory directory-path))
    
    (shell-command running-string))
  )

(defun lz/running-current-python-with-nohup ()
  (interactive)
  (let* ((buffer-name (buffer-name))
	 (filepath (buffer-file-name))
	 (current-day-time (format-time-string "%F"))
	 (filename (concat "running_" (s-replace ".sh" "" buffer-name)))
	 (directory-path (nth 0(split-string filepath buffer-name)))
	 (running-string (concat "nohup python " buffer-name "> "
				 current-day-time "-" filename ".log &"))
	 (default-directory directory-path))
    
    (shell-command running-string))
  )

(defun lz/running-current-python-with-nohup-env ()
  (interactive)
  (let* ((buffer-name (buffer-name))
	 (filepath (buffer-file-name))
	 (current-day-time (format-time-string "%F"))
	 (filename (concat "running_" (s-replace ".sh" "" buffer-name)))
	 (directory-path (nth 0(split-string filepath buffer-name)))
	 (running-string (concat "nohup python " buffer-name "> "
				 current-day-time "-" filename ".log &"))
	 (default-directory directory-path))

    (setq envname (read-from-minibuffer "running environment? Ans:"))
    (setq full-string (concat
		       (concat "export python=~/anaconda3/envs/"
			       envname "/bin/python \n")
		       "nohup $python " buffer-name "> "
		       current-day-time "-" filename ".log &"))
    
    (shell-command (format "bash -c %s" (shell-quote-argument full-string))))
  )

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

