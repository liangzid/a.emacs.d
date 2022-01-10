
;; 定义快速打开init-file的操作，并将之绑定在F2上.
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 判断是哪一个操作系统，有利于后续的一些操作
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(defconst *is-gui* (getenv "DISPLAY"))


(defun select-a-region (begin end)
  "select the region with begin and end posion; I use it for holding existing region."
  (interactive)
  (setq deactivate-mark nil)
  (push-mark begin '() t)
  (goto-char end))


(defun helpme-select ()
  (interactive)
  (message "%s" (random 2)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; 补充满足正常编辑器风格的tab缩进和 S-TAB 反缩进

;; (defun make-suojin (line)
;;   ;; (message "%s" (concat "    " line))
;;   (concat "    " line))


;; (defun get-region-content ()
;;   (buffer-substring-no-properties (region-beginning) (region-end))
;;   )

;; (defun replace-region-with-new-content (new-content)
;;   (interactive)
;;   (delete-region (region-beginning) (region-end))
;;   (insert (concat new-content "\n")))

;; (defun concat-string-list (slist)
;;   (let ((num (length slist))
;; 	(i 0)
;; 	(finally-string ""))
;;     (while (<= i num)
;;       (setq finally-string (concat finally-string (nth i slist)))
;;       (setq i (+ i 1)))
;;     finally-string
;;     ))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




 

(provide 'init-self-config-function)
