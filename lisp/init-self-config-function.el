

;; 判断是哪一个操作系统，有利于后续的一些操作
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))
(defconst *is-wsl* (string-match-p "-[Mm]icrosoft" operating-system-release))
(defconst *is-gui* (getenv "DISPLAY"))

;; (if *is-windows*
;;     (progn
;;   (global-set-key (kbd "C-x C-s") 
;;   'lz/save-buffer)
;;    ))


;; (defun select-a-region (begin end)
;;   "select the region with begin and end posion; I use it for holding existing region."
;;   (interactive)
;;   (setq deactivate-mark nil)
;;   (push-mark begin '() t)
;;   (goto-char end))

;; (defun zl/select-region-then-query-replace (replacement)
;;   "Replace the region with REPLACEMENT."
;;   (interactive (let (())
;;                  (highlight-symbol-temp-highlight)
;;                  (set query-replace-to-history-variable
;;                       (cons (substring-no-properties symbol)
;;                             (eval query-replace-to-history-variable)))
;;                  (list
;;                   (read-from-minibuffer "Replacement: " nil nil nil
;;                                         query-replace-to-history-variable))))
;;   (goto-char (beginning-of-thing 'symbol))
;;   (query-replace-regexp (highlight-symbol-get-symbol) replacement))

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


(defun my/indent-4-space (backward)
  "Indent/dedent region or insert/delete 4 sapce."
  (interactive "P")
  (cond ((and (use-region-p) backward)
         (replace-regexp "^    " "" nil (region-beginning) (region-end)))
        ((and (use-region-p) (not backward))
         (replace-regexp "^" "    " nil (region-beginning) (region-end)))
        (backward
         (let ((spaces 4)
               char)
           (while (> spaces 0)
             (setq char (char-after (point)))
             (cond ((char-equal (char-after (point)) 32) ; delete a space char
                    (delete-char 1)
                    (setq spaces (- spaces 1)))
                   ((char-equal (char-after (point)) 9) ; delete a tab char
                    (delete-char 1)
                    (setq spaces (- spaces 4)))))))
        (t (insert "    "))))
(global-set-key (kbd "TAB") 'my/indent-4-space)
(global-set-key (kbd "S-TAB") 'my/indent-4-space)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



 

(provide 'init-self-config-function)
