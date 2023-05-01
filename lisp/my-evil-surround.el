;;; MY-EVIL-SURROUND --- 
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 28 四月 2023
;;
;;; Commentary:
;;
;;  My Evil Sounrrounds
;;
;;; Code:

(defvar left-part "")
(defvar right-part "")

(defun liangzi-warp ()
  (interactive)
  (setq left-part (read-from-minibuffer "Left Part:" left-part))
  (setq right-part (read-from-minibuffer "Right Part:" right-part))
  (let* ((start (evil-range-beginning (evil-visual-range)))
	 (end (evil-range-end (evil-visual-range)))
	 (selected-text (buffer-substring start end))
	 (new-text (concat left-part selected-text right-part))
	 (is-run (read-from-minibuffer (format "replace %s to %s? y or n:"
					      selected-text
					      new-text) "y")))
    (if (string-equal is-run "y")
	(progn
	  (kill-region start end)
	  (insert new-text)
	  (message "replace done.")
	  )
      (message "quit."))

    ))

(defvar liangzi-pairs-hashmap (make-hash-table :test 'equal))
(puthash "(" ")" liangzi-pairs-hashmap)
(puthash "[" "]" liangzi-pairs-hashmap)
(puthash "{" "}" liangzi-pairs-hashmap)
(puthash "<" ">" liangzi-pairs-hashmap)
(puthash "'" "'" liangzi-pairs-hashmap)
(puthash "\"" "\"" liangzi-pairs-hashmap)
(puthash "&" "&" liangzi-pairs-hashmap)
(puthash "=" "=" liangzi-pairs-hashmap)

(defvar pair-left-part "(")
(defun liangzi-warp-pair ()
  (interactive)
  (setq pair-left-part (read-from-minibuffer "Left Part:"
					     pair-left-part))
  (let* ((start (evil-range-beginning (evil-visual-range)))
	 (end (evil-range-end (evil-visual-range)))
	 (selected-text (buffer-substring start end))
	 (pair-right-part (gethash pair-left-part
		liangzi-pairs-hashmap pair-left-part))
	 (new-text (concat pair-left-part selected-text
			   pair-right-part))
	 ;; no ask, just do it.
	 (is-run "y")
	 ;; (is-run (read-from-minibuffer (format "replace %s to %s? y or n:"
	 ;; 				      selected-text
	 ;; 				      new-text) "y"))
	 )
    (if (string-equal is-run "y")
	(progn
	  (kill-region start end)
	  (insert new-text)
	  (message "surrounded done.")
	  )
      (message "quit."))

    ))

(provide 'my-evil-surround)

;;; my-evil-surround.el {"<ends> [{here}]
