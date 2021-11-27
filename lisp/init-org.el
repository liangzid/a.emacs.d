(require 'org)
(my/install-package-if-not-found 'org-download)

(setq org-src-fontify-natively t)

(defun fastinsert-org-head()
  "a fast command to insert heads."
  (interactive)
  (let ((head (concat "#+title: \n" "#+author: \n"
		      (concat "#+date: " (current-time-string) "\n")
		      "#+email: 2273067585@qq.com \n"
		      "#+latex_class: elegantpaper \n"
		      "* 标题1" )))
    ;;insert
    (insert head)
    (goto-char 9)
    ))
;;bind to C-F
(define-key org-mode-map (kbd "C-f h") 'fastinsert-org-head )

(setq org-agenda-files '("~/org"))

;;...
(add-to-list 'load-path (expand-file-name ""))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)



;;-----------------------INSERT IMAGE---------(require 'org-download)
(require 'org-download)
;; (when (eq system-type 'windows-nt)
;;   (setq org-download-screenshot-file
;;         "D:\\Index\\screenshot.png"
;;         org-download-screenshot-method
;;         "\"C:\\Program Files\\IrfanView\\i_view64.exe\" /capture=4 /convert=\"%s\""))

(setq-default org-download-heading-lvl nil)
(setq-default org-download-image-dir "./img") ;; 把图片保存在 org 文档所在目录的 img 子目录下

(add-hook 'org-mode-hook
          #'org-download-enable)

;; 设置插入图片的快捷键
;; (after-load 'org-download
  (define-key org-mode-map (kbd "C-c C-x s") 'org-download-screenshot) ;; 插入截图
(define-key org-mode-map (kbd "C-c C-x y") 'org-download-yank)
;; )
;; 下载剪切板中链接的图片，并插入------------------------------------------------

;; "C:\Program Files\IrfanView\i_view64.exe"
(defun my-screen-capture ()
  "Take a screenshot into a unique-named file in the current buffer file
   directory and insert a link to this file."
  (interactive)
  (lower-frame)
  (let ((capture-name (concat
                       (format-time-string "%Y%m%d%H%M%S") ".png"))
        (capture-save-path (concat
                            (file-name-directory buffer-file-name) "images/")))
    (setq capture-file (concat capture-save-path capture-name))
    (if *is-windows*
	((setq command (concat "\"C://Program Files//IrfanView//i_view64.exe\"  /capture=4 /dpi=(300,300) /convert="
			       (replace-regexp-in-string "/" "\\\\" capture-file)))
	 (shell-command command))
      (call-process-shell-command "scrot" nil nil nil nil "-s" capture-file)
      )

    (insert (concat
             "[[file:./images/" capture-name "]]")))
  )

(define-key org-mode-map (kbd "C-M-Y") 'my-screen-capture)


;; (message "========begin for auto image thing.============")
;; 设置org自动显示图片。
(add-hook 'org-mode-hook (auto-image-file-mode t))
;; (org-toggle-inline-images)
(add-hook 'org-mode-hook (iimage-mode t))
;; (message "============end for auto image thing=============")

(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "REVIEW(r)" "|" "DONE(d)" "CANCELED(c)")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("INPROGRESS" . "yellow")
        ("WAITING" . "purple")
        ("REVIEW" . "orange")
        ("DONE" . "green")
        ("CANCELED" .  "green")))


(use-package org-bullets
  :config
  (progn
    (setq org-bullets-bullet-list '("▶" "►" "▸" "●" "•" ))
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    ))


(use-package org-alert
  :defer t
  :config
  (progn
    (setq alert-default-style 'libnotify)
    ))

;; 设置org快速插入源代码
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

;; (message "--------------------begin--------------------")
;;将其加载在快捷键上
(add-hook 'org-mode-hook
	  '(lambda ()
	     ;; ;; C-TAB for expanding
             ;; (local-set-key (kbd "C-<tab>")
             ;; 'yas/expand-from-trigger-key)
             ;; keybinding for editing source code blocks
             (local-set-key (kbd "C-c s e")
             'org-edit-src-code)
             ;; keybinding for inserting code blocks
             (local-set-key (kbd "C-c s i") 'org-insert-src-block )))

;; (message "-----------------end----------------------")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;for org publish;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;===============================================================
;;          begin: org-to-latex
;;===============================================================

;; 使用xelatex，配合当前org文件最开始的配置来正常输出中文
  ;; 这类笔记基本不可能是全英文，所以就安心用xelatex算了
  (setq org-latex-pdf-process '("xelatex -file-line-error -interaction nonstopmode %f"
                                "bibtex %b"
                                "xelatex -file-line-error -interaction nonstopmode %f"
                                "xelatex -file-line-error -interaction nonstopmode %f"))

  ;; 生成PDF后清理辅助文件
  ;; https://answer-id.com/53623039
  (setq org-latex-logfiles-extensions
    (quote ("lof" "lot" "tex" "tex~" "aux"
      "idx" "log" "out" "toc" "nav"
      "snm" "vrb" "dvi" "fdb_latexmk"
      "blg" "brf" "fls" "entoc" "ps"
      "spl" "bbl" "xdv")))

  ;; 图片默认宽度
  (setq org-image-actual-width '(300))

  (setq org-export-with-sub-superscripts nil)

  ;; 不要自动创建备份文件
  (setq make-backup-files nil)

  ;; elegantpaper.cls
  ;; https://github.com/ElegantLaTeX/ElegantPaper/blob/master/elegantpaper.cls
  (with-eval-after-load 'ox-latex
  ;; http://orgmode.org/worg/org-faq.html#using-xelatex-for-pdf-export
  ;; latexmk runs pdflatex/xelatex (whatever is specified) multiple times
  ;; automatically to resolve the cross-references.
  (setq org-latex-pdf-process '("latexmk -xelatex -quiet -shell-escape -f %f"))
  (setq org-latex-listings t)
  (add-to-list 'org-latex-classes
                '("elegantpaper"
                  "\\documentclass[lang=cn]{elegantpaper}
                  [NO-DEFAULT-PACKAGES]
                  [PACKAGES]
                  [EXTRA]"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )

;; ;;===============================================================
;; ;;          end: org-to-latex
;; ;;===============================================================

;;code running
(org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . t)
       (ditaa . t)
       (python . t)
       ;;(sh . t)
       (latex . t)
       (plantuml . t)
       (R . t)))

(setq org-plantuml-jar-path
     (expand-file-name "~/.emacs.d/software/plantuml.jar"))


;;code执行免应答（Eval code without confirm）
(setq org-confirm-babel-evaluate nil)

(provide 'init-org)
