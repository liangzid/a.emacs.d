;;; MY-SURROUND --- 
;;
;; Surround texts with different file types
;;
;; Author: Zi Liang <zi1415926.liang@connect.polyu.hk>
;; Copyright © 2024, ZiLiang, all rights reserved.
;; Created: 22 March 2024
;;
;;; Commentary:
;;
;;  
;;
;;; Code:


(defun surround-region-with-text ()
  "Surround a region with a given text."
  (interactive)
  (setq cover-command (concat "" (read-from-minibuffer "command:"
						   cover-command)))
  (let* ((s (evil-range-beginning (evil-visual-range)))
	 (e (evil-range-end (evil-visual-range)))
	 (selected-text (buffer-substring s e))
	 (new-text (concat cover-command "{" selected-text "}"))
	 )
	(progn
	  (kill-region s e)
	  (insert new-text)
	  (message "done")))
    )

(defcustom surround/prefix-key "C-c C-s" "Prefix key of the formaiton")
(defvar surround/TRIGGERS '(
			  "b" ;; bold
			  "e" ;; italic
			  "u" ;; underline
			  "[" ;; []
			  "<" ;; <>
			  "(" ;; ()
			  "{" ;; {}
			  "d" ;; delete line
			  "c" ;; code
			  "C" ;; code in new line <CODE BLOCK>
			  "q" ;; quote
			  ))

(defvar surround/MD-LS '(
			 ("**" . "**")
			 ("*" . "*")
			 ("<u>" . "</u>")

			 ("[" . "]")
			 ("<" . ">")
			 ("(" . ")")
			 ("{" . "}")
			 ("~~" . "~~")
			 ("`" . "`")
			 ("```" . "\n```")
			 ("> " . "")
			 ))
(defvar surround/ORG-LS '(
			("*" . "*")
			("/" . "/")
			("_" . "_")

			("[" . "]")
			("<" . ">")
			("(" . ")")
			("{" . "}")

			("+" . "+")
			("=" . "=")
			("#+BEGIN_SRC" . "\n#+END_SRC")
			("#+BEGIN_QUOTE\n" . "\n#+END_QUOTE")
			))

(defvar surround/LATEX-LS '(
			("\\textbf{" . "}")
			("\\emph{" . "}")
			("\\underline{" . "}")

			("[" . "]")
			("<" . ">")
			("(" . ")")
			("{" . "}")

			("\\sout{" . "}")
			("\\begin{Verbatim}" . "\\end{Verbatim}")
	("\\begin{lstlisting}[language=" . "\n\\end{lstlisting}")
			("\\begin{quote}" . "\n\\end{quote}")
			))

(defvar surround/MODE-LS-DICT '(
			      ("latex-mode" . surround/LATEX-LS)
			      ("markdown-mode" . surround/MD-LS)
			      ("org-mode" . surround/ORG-LS)
			      ))
(defun surround/surround (a b)
  (interactive)
  (let* ((s (evil-range-beginning (evil-visual-range)))
	 (e (evil-range-end (evil-visual-range)))
	 (selected-text (buffer-substring s e))
	 (new-text (concat a selected-text b))
	 )
	(progn
	  (kill-region s e)
	  (insert new-text)
	  (message "done")))
  )

(setq value
(symbol-value (cdr (assoc "org-mode" surround/MODE-LS-DICT))))
(nth 0 value)

(require 'cl-lib)
(defvar surround/language-code "")
;; (setq debug-on-error 'surround/surround_a_text_with)

(defun surround/surround_a_text_with (label)
  "Surround the region depending on the type of files."
  (interactive)
  (
  let* ((mode-name (symbol-name major-mode))
	(surround-ls (cdr (assoc mode-name surround/MODE-LS-DICT)))
	(idx (seq-position surround/TRIGGERS label))
	(surround-map-ls (nth idx (symbol-value surround-ls)))
	(s (evil-range-beginning (evil-visual-range)))
	(e (evil-range-end (evil-visual-range)))
	(selected-text (buffer-substring s e))
	)
    (if (string-equal label "C")
	(progn
	  (setq surround/language-code (read-from-minibuffer
					"language: "
					surround/language-code
					))
	  (if (string-equal mode-name "latex-mode")
	      (setq surround/language-code (concat
					    surround/language-code
					    "]\n"))
	      )
	  (surround/surround (concat (car surround-map-ls)
				     " "
				     surround/language-code
				     "\n"
				     )
			     (cdr surround-map-ls))
	  )
      (if (string-equal mode-name "org-mode")
	  (progn
	    (if (and (not (eql s 1))
		     (not (eql e (1- (buffer-size))))
		     (or
		      (not (string-equal (buffer-substring (- s 1) s) " "))
		      (not (string-equal (buffer-substring e (1+ e)) " "))
		      )
		     (member label '("b" "e" "u" "d" "c"))
		     )
		(surround/surround (concat " " (car surround-map-ls))
				   (concat (cdr surround-map-ls) " "))
	      (surround/surround (concat "" (car surround-map-ls))
				 (concat (cdr surround-map-ls) ""))
		     ))
	(progn
	  (message "model name %s" mode-name)
	  (surround/surround (car surround-map-ls)
			   (cdr surround-map-ls))
	  )
	    )
	  )
	)
    )

(define-key org-mode-map (kbd "C-c C-s") nil)
;; (define-key tex-mode-map (kbd "C-c C-s") nil)
;; (define-key latex-mode-map (kbd "C-c C-s") nil)
;; (define-key LaTeX-mode-map (kbd surround/prefix-key) nil)

(defmacro make-surround-func (k)
  `(lambda ()
    (interactive)
    (surround/surround_a_text_with ,k)))

(global-set-key (kbd (concat surround/prefix-key " " "b"))
		(make-surround-func "b"))
(global-set-key (kbd (concat surround/prefix-key " " "e"))
		(make-surround-func "e"))
(global-set-key (kbd (concat surround/prefix-key " " "u"))
		(make-surround-func "u"))
(global-set-key (kbd (concat surround/prefix-key " " "["))
		(make-surround-func "["))
(global-set-key (kbd (concat surround/prefix-key " " "<"))
		(make-surround-func "<"))
(global-set-key (kbd (concat surround/prefix-key " " "("))
		(make-surround-func "("))
(global-set-key (kbd (concat surround/prefix-key " " "{"))
		(make-surround-func "{"))

(global-set-key (kbd (concat surround/prefix-key " " "d"))
		(make-surround-func "d"))
(global-set-key (kbd (concat surround/prefix-key " " "c"))
		(make-surround-func "c"))
(global-set-key (kbd (concat surround/prefix-key " " "C"))
		(make-surround-func "C"))
(global-set-key (kbd (concat surround/prefix-key " " "q"))
		(make-surround-func "q"))

(provide 'easy-surround)
;;; my-surround.el ends here
