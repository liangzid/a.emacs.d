
;; Give up git-gutter as it is slow for tramp.
;; ;; using git-gittuer as it is more beautiful.
;; (my/install-package-if-not-found 'git-gutter)
;; (require 'git-gutter)
;; (global-git-gutter-mode 1)

(defun git-add-and-commit-lz (mtext)
  (interactive "splease input sentence with commit:")
  (shell-command "git add -A")
  (shell-command (concat "git commit -m " mtext))
  ;; (shell-command "git push origin master")
  (message "ALL SOURCE CODE DATA LOAD DONE.")
  (shell-command "git status"))


(defun git-add-commit-push-lz (mtext)
  (interactive "splease input sentence with commit:")
  (shell-command "git add -A")
  (shell-command (concat "git commit -m " mtext))
  (shell-command "git push origin master")
  (message "ALL SOURCE CODE DATA LOAD DONE.")
  (shell-command "git status"))


(defun git-turn-on-save-lz ()
  (interactive)
  (shell-command "git config --global credential.helper store")
  (message "username-password saved has been turned on."))


(defun git-close-save-lz ()
  (interactive)
  (shell-command "git credential-manager uninstall")
  (message "username-password saved has been turned off."))

(provide 'init-git)
