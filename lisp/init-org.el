(require 'org)
(my/install-package-if-not-found 'org-download)


(setq org-tag-alist
      '(("@Research" . ?r)
	("@Literature" . ?l)
	("@Book" . ?b)
	))

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

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-files '("~/org"))
;; org capture setup
(define-key org-mode-map (kbd "C-c c") 'org-capture)

(setq org-default-notes-file "~/liangzid.github.io/org/capture-file-inbox.org")
(setq org-capture-templates nil)
(add-to-list 'org-capture-templates
             '("n" "Notes"
               entry (file "~/liangzid.github.io/org/notes/inbox.org")
               "* %^{heading} %t %^g\n  %?\n"
               :empty-lines 1
               ))
(add-to-list 'org-capture-templates
             '("t" "Tasks" entry
               (file "~/liangzid.github.io/org/task.org")
               "* TODO %^{title} %^g\n  %U\n\n  %?"
               :empty-lines 1))
;;; org agenda
(setq org-agenda-span 'week)
(setq org-agenda-files (list "~/liangzid.github.io/org/task.org" "~/liangzid.github.io/org/capture-file-inbox.org"))
(setq org-deadline-warning-days 1)
(setq org-agenda-todo-ignore-deadlines 'far)
(setq org-agenda-inhibit-startup t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(defun my-agenda-list ()
  (interactive)
  (progn
    (org-agenda-list)
    (delete-other-windows)))

;; (message "========begin for auto image thing.============")
;; 设置org自动显示图片。
(add-hook 'org-mode-hook (auto-image-file-mode t))
;; (org-toggle-inline-images)
(add-hook 'org-mode-hook (iimage-mode t))
;; (message "====end for auto image thing====")

(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "REVIEW(r)" "|" "DONE(d)" "CANCELED(c)")))

(setq-default org-enforce-todo-dependencies t)

(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight "bold")
        ("INPROGRESS" :foreground "blue" :weight "bold")
        ("WAITING" . "purple")
        ("REVIEW" . "orange")
        ("DONE" . "forest green")
        ("CANCELED" .  "green")))

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
          '("python" "emacs-lisp" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite" "rust")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

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

  ;; 不要自动创建备份文件
  (setq make-backup-files nil)

;;code running
(org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . t)
       (ditaa . t)
       (python . t)
       (shell . t)
       (latex . t)
       (plantuml . t)
       (R . t)))

(setq org-plantuml-jar-path
     (expand-file-name "~/.emacs.d/software/plantuml.jar"))

;;code执行免应答（Eval code without confirm）
(setq org-confirm-babel-evaluate nil)

(require 'org-ui)
(require 'org-export)
(provide 'init-org)
