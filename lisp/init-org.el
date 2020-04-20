
(require 'org)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))



(global-set-key (kbd "C-c c") 'org-capture)


;; 增加截图功能。

;; (use-package org-download
;; 	  :ensure t 
;; 	  ;;将截屏功能绑定到快捷键：Ctrl + Shift + Y
;; 	  :bind ("C-S-y" . org-download-screenshot)
;; 	  :config
;; 	  (require 'org-download)
;; 	  ;; Drag and drop to Dired
;; 	  (add-hook 'dired-mode-hook 'org-download-enable)
;; 	  )

;; (use-package org-download
;;     :bind ("C-M-y" . org-download-clipboard)
;;     :config
;;     (defun org-download-clipboard ()
;;       "Save the captured image from clipboard to file, and insert into buffer. Or org-download-yank."
;;       (interactive)
;;       (let ((link "http://images2015.cnblogs.com/blog/717724/201703/717724-20170318145647104-177813066.jpg"))
;;         (if (eq 0 (shell-command (format "C:\\Program Files\\ImageMagick-7.0.10-Q16\\imdisplay.exe  clipboard:myimage %s " link)
;;             "*screenshot2file*" "*screenshot2file*"))
;;             (org-download-image link)
;;           (org-download-yank)))))

;; (use-package org-download
;;     :bind ("C-S-y" . org-download-clipboard)
;;     :config
;;     (defun org-download-clipboard ()
;;       "Save the captured image from clipboard to file, and insert into buffer. Or org-download-yank."
;;       (interactive)
;;       (let ((link "http://images2015.cnblogs.com/blog/717724/201703/717724-20170318145647104-177813066.jpg"))
;;         (if (eq 0 (shell-command (format "\"c:/Program\sFiles/ImageMagick-6.9.3-Q16/convert.exe\" clipboard:myimage %s" link)
;; 				 "*screenshot2file*" "*screenshot2file*"))
;;             (org-download-image link)
;;           (org-download-yank))))) 









(setq org-todo-keywords 
      '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "REVIEW(r)" "|" "DONE(d)" "CANCELED(c)")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("INPROGRESS" . "yellow")
        ("WAITING" . "purple")
        ("REVIEW" . "orange")
        ("DONE" . "green")
        ("CANCELED" .  "red")))

(use-package org-bullets
  :config
  (progn
    (setq org-bullets-bullet-list '("☯" "✿" "✚" "◉" "❀"))
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    ))

(use-package org-alert
  :defer t
  :config
  (progn
    (setq alert-default-style 'libnotify)
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;for org publish;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;===============================================================
;;          begin: org-to-latex
;;===============================================================
;; if you want use it,you should:
;; #+LATEX_CLASS: cn_article
;; or:
;; #+LATEX_CLASS: beamer


(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil)))
(require 'org-install)
;; (require 'org-latex) org-latex可以被自动加载。

;; 使用xelatex一步生成PDF
(setq org-latex-pdf-process
'("xelatex -interaction nonstopmode %f"
"xelatex -interaction nonstopmode %f"))
;; code执行免应答（Eval code without confirm）
(setq org-confirm-babel-evaluate nil)
;; Auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(defun org-mode-article-modes ()
  (reftex-mode t)
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all)))
(add-hook 'org-mode-hook
          (lambda ()
            (if (member "REFTEX" org-todo-keywords-1)
                (org-mode-article-modes))))
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(require 'ox-latex)


(add-to-list 'org-latex-classes
             '("org-article"
               "\\documentclass{article}
                 \\usepackage{graphicx}
                 \\usepackage{xcolor}
                 \\usepackage{xeCJK}
                 \\usepackage{fixltx2e}
                 \\usepackage{longtable}
                 \\usepackage{float}        
                 \\usepackage{tikz}         
                 \\usepackage{wrapfig}      
                 \\usepackage{latexsym,amssymb,amsmath}
                 \\usepackage{textcomp}
                 \\usepackage{listings}     
                \\usepackage{marvosym}     
                \\usepackage{textcomp}     
                \\usepackage{latexsym}     
                \\usepackage{natbib}       
                \\usepackage{geometry}     
                [NO-DEFAULT-PACKAGES]      
                [PACKAGES]                 
                [EXTRA]"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(add-to-list 'org-latex-classes
             '("cn-article"
               "\\documentclass[10pt,a4paper]{article}
\\usepackage{graphicx}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{lmodern}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{tikz}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{listings}
\\usepackage{geometry}
\\usepackage{algorithm}
\\usepackage{algorithmic}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{natbib}
\\usepackage{fancyhdr}
\\usepackage[xetex,colorlinks=true,CJKbookmarks=true,
linkcolor=blue,
urlcolor=blue,
menucolor=blue]{hyperref}
\\usepackage{fontspec,xunicode,xltxtra}
\\setmainfont[BoldFont=Adobe Heiti Std]{Adobe Song Std}  
\\setsansfont[BoldFont=Adobe Heiti Std]{AR PL UKai CN}  
\\setmonofont{Bitstream Vera Sans Mono}  
\\newcommand\\fontnamemono{AR PL UKai CN}%等宽字体
\\newfontinstance\\MONO{\\fontnamemono}
\\newcommand{\\mono}[1]{{\\MONO #1}}
\\setCJKmainfont[Scale=0.9]{Adobe Heiti Std}%中文字体
\\setCJKmonofont[Scale=0.9]{Adobe Heiti Std}
\\hypersetup{unicode=true}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,
marginparsep=7pt, marginparwidth=.6in}
\\definecolor{foreground}{RGB}{220,220,204}%浅灰
\\definecolor{background}{RGB}{62,62,62}%浅黑
\\definecolor{preprocess}{RGB}{250,187,249}%浅紫
\\definecolor{var}{RGB}{239,224,174}%浅肉色
\\definecolor{string}{RGB}{154,150,230}%浅紫色
\\definecolor{type}{RGB}{225,225,116}%浅黄
\\definecolor{function}{RGB}{140,206,211}%浅天蓝
\\definecolor{keyword}{RGB}{239,224,174}%浅肉色
\\definecolor{comment}{RGB}{180,98,4}%深褐色
\\definecolor{doc}{RGB}{175,215,175}%浅铅绿
\\definecolor{comdil}{RGB}{111,128,111}%深灰
\\definecolor{constant}{RGB}{220,162,170}%粉红
\\definecolor{buildin}{RGB}{127,159,127}%深铅绿
\\punctstyle{kaiming}
\\title{}
\\fancyfoot[C]{\\bfseries\\thepage}
\\chead{\\MakeUppercase\\sectionmark}
\\pagestyle{fancy}
\\tolerance=1000
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
(setq org-export-latex-listings t)
;; Options for \lset command（reference to listing Manual)
(setq org-export-latex-listings-options
      '(
        ("basicstyle" "\\color{foreground}\\small\\mono")           ; 源代码字体样式
        ("keywordstyle" "\\color{function}\\bfseries\\small\\mono") ; 关键词字体样式
        ("identifierstyle" "\\color{doc}\\small\\mono")
        ("commentstyle" "\\color{comment}\\small\\itshape")         ; 批注样式
        ("stringstyle" "\\color{string}\\small")                    ; 字符串样式
        ("showstringspaces" "false")                                ; 字符串空格显示
        ("numbers" "left")                                          ; 行号显示
        ("numberstyle" "\\color{preprocess}")                       ; 行号样式
        ("stepnumber" "1")                                          ; 行号递增
        ("backgroundcolor" "\\color{background}")                   ; 代码框背景色
        ("tabsize" "4")                                             ; TAB等效空格数
        ("captionpos" "t")                                          ; 标题位置 top or buttom(t|b)
        ("breaklines" "true")                                       ; 自动断行
        ("breakatwhitespace" "true")                                ; 只在空格分行
        ("showspaces" "false")                                      ; 显示空格
        ("columns" "flexible")                                      ; 列样式
        ("frame" "single")                                          ; 代码框：阴影盒
        ("frameround" "tttt")                                       ; 代码框： 圆角
        ("framesep" "0pt")
        ("framerule" "8pt")
        ("rulecolor" "\\color{background}")
        ("fillcolor" "\\color{white}")
        ("rulesepcolor" "\\color{comdil}")
        ("framexleftmargin" "10mm")
        ))
;; Make Org use ido-completing-read for most of its completing prompts.
(setq org-completion-use-ido t)
;; 各种Babel语言支持
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (matlab . t)
   (C . t)
   (perl . t)
   (shell . t)
   (ditaa . t)
   (python . t)
   (haskell . t)
   (dot . t)
   (latex . t)
   (js . t)
   ))

;; 导出Beamer的设置
;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
;;-----------------------------------------------------------------------------
(add-to-list 'org-export-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt,professionalfonts]{beamer}
\\mode
\\usetheme{{{{Warsaw}}}}
%\\usecolortheme{{{{beamercolortheme}}}}

\\beamertemplateballitem
\\setbeameroption{show notes}
\\usepackage{graphicx}
\\usepackage{tikz}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{amsmath}
\\usepackage{lmodern}
\\usepackage{fontspec,xunicode,xltxtra}
\\usepackage{polyglossia}
\\setmainfont{Times New Roman}
\\setCJKmainfont{DejaVu Sans YuanTi}
\\setCJKmonofont{DejaVu Sans YuanTi Mono}
\\usepackage{verbatim}
\\usepackage{listings}
\\institute{{{{beamerinstitute}}}}
\\subject{{{{beamersubject}}}}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))

(setq ps-paper-type 'a4
      ps-font-size 16.0
      ps-print-header nil
      ps-landscape-mode nil)

;;From：https://blog.csdn.net/pfanaya/java/article/details/7669364

;;===============================================================
;;          end: org-to-latex
;;===============================================================















;; (use-package org
;;   :ensure org-plus-contrib
;;   :defer t)
 
;; (require 'ox-md)
;; (require 'ox-publish)

;; ;; setup export theme
;; (defun @-publish-theme (theme fn &rest args)
;;   (let ((current-themes custom-enabled-themes))
;;     (mapcar #'disable-theme custom-enabled-themes)
;;     (load-theme theme t)
;;     (let ((result (apply fn args)))
;;       (mapcar #'disable-theme custom-enabled-themes)
;;       (mapcar (lambda (theme) (load-theme theme t)) current-themes)
;;       result)))

;; (advice-add #'org-export-to-file :around (apply-partially #'@-publish-theme 'dracula))
;; (advice-add #'org-export-to-buffer :around (apply-partially #'@-publish-theme 'dracula))

;; ;; force publish whole site
;; (use-package htmlize)
;; (defun @-force-org-publish ()
;;   (interactive)
;;   (progn
;;     (org-reload)
;;     (org-publish-remove-all-timestamps)
;;     (org-publish-all t)
;;     (load-theme 'doom-molokai)    
;;     (set-face-background 'vertical-border (face-background 'default))
;;     (set-face-foreground 'vertical-border "grey")
;;     ))

;; ;; read file content
;; (defun @-load-file-contents (filename)
;;   "Return the contents of FILENAME."
;;   (with-temp-buffer
;;     (insert-file-contents filename)
;;     (buffer-string)))

;; ;; sitemap function
;; (defun @-org-publish-org-sitemap (title list)
;;   "Sitemap generation function."
;;   (concat (format "#+TITLE: %s\n" title)
;;           "#+OPTIONS: toc:nil\n"
;;           "#+KEYWORDS:技术博客,技术思考,机器学习,边缘计算,Kubernets,容器技术\n"
;;           "#+DESCRIPTION:前沿技术博客,记录技术生活点滴,Dont't Panic\n\n"
;;           "* Articals\n"
;;           (replace-regexp-in-string "\*" " " (org-list-to-subtree list))
;;           "\n\n"
;;           (@-load-file-contents (expand-file-name "~/.emacs.d/aboutme.org"))
;;           ))

;; (defun @-org-publish-org-sitemap-format (entry style project)
;;   "Custom sitemap entry formatting: add date"
;;   (cond ((not (directory-name-p entry))
;;          (format "- [[file:%s][ %s]]"
;;                  entry
;;                  (org-publish-find-title entry project)))
;;         ((eq style 'tree)
;;          ;; Return only last subdir.
;;          (concat "+ "
;;                  (capitalize (file-name-nondirectory (directory-file-name entry)))
;;                  "/"))
;;         (t entry)))

;; ;; customize exported html
;; (setq org-html-head (@-load-file-contents (expand-file-name "~/.emacs.d/template.html")))
;; (setq org-html-preamble t)
;; (setq org-html-postamble (@-load-file-contents (expand-file-name "~/.emacs.d/footer.html")))
;; (setq org-publish-project-alist
;;       '(("orgfiles"
;;          :base-directory "/Users/deyuhua/Documents/org/notebooks/"
;;          :base-extension "org"
;;          :publishing-directory "/Users/deyuhua/Workspace/Documents/网站生成/notebooks/"
;;          :publishing-function org-html-publish-to-html
;;          :headline-levels 3
;;          :section-numbers nil
;;          :with-toc t
;;          :html-head-include-scripts nil  
;;          ;; :html-head site-header
;;          ;; :html-preamble t
;;          :recursive t
;;          :with-email "deyuhua@gmail.com"
;;          :with-title t
;;          :html-html5-fancy t
;;          :auto-sitemap t
;;          :sitemap-function @-org-publish-org-sitemap
;;          :sitemap-format-entry @-org-publish-org-sitemap-format
;;          :sitemap-filename "index.org"
;;          :sitemap-title "Don't Panic!"
;;          )

;;         ("images"
;;          :recursive t
;;          :base-directory "/Users/deyuhua/Documents/org/notebooks/images/"
;;          :base-extension "jpg\\|gif\\|png\\|jpeg\\|ico"
;;          :publishing-directory "/Users/deyuhua/Workspace/Documents/网站生成/notebooks/images/"
;;          :publishing-function org-publish-attachment)

;;         ("style"
;;          :base-directory "/Users/deyuhua/Documents/org/notebooks/style/"
;;          :base-extension "css\\|el\\|js"
;;          :publishing-directory "/Users/deyuhua/Workspace/Documents/网站生成/notebooks/style/"
;;          :publishing-function org-publish-attachment)

;;         ("fonts"
;;          :base-directory "/Users/deyuhua/Documents/org/notebooks/fonts/"
;;          :base-extension "eot\\|woff2\\|woff\\|ttf\\|svg"
;;          :publishing-directory "/Users/deyuhua/Workspace/Documents/网站生成/notebooks/fonts/"
;;          :publishing-function org-publish-attachment)   

;;         ("website" :components ("orgfiles" "images" "style" "fonts"))))











(provide 'init-org)
