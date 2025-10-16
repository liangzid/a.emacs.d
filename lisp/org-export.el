;;; ORG-EXPORT --- 
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 26 二月 2023
;;
;;; Commentary:
;;
;;  Code for export ORG to other modes, specifically, it concludes:
;;  1. LATEX, BEAMER
;;  2. HTML for blogs
;;; Code:


(my/install-package-if-not-found 'ox-reveal)
;; NEW in 2025: I decide to use =reveal.js= for slides presentation.

(with-eval-after-load 'ox
  (require 'ox-reveal))

(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js@4.3.1")
(setq org-reveal-hlevel 2)           
(setq org-reveal-theme "moon")
(setq org-reveal-plugins '(classList markdown highlight zoom notes))







;;==================================
;;          begin: org-to-latex
;;==================================

;; 使用xelatex，配合当前org文件最开始的配置来正常输出中文
  ;; 这类笔记基本不可能是全英文，所以就安心用xelatex算了
(setq org-latex-pdf-process
      '("xelatex -file-line-error -interaction nonstopmode %f"
		"bibtex %b"
		"xelatex -file-line-error -interaction nonstopmode %f"
		"xelatex -file-line-error -interaction nonstopmode %f"))

  ;; 图片默认宽度
  (setq org-image-actual-width '(300))
  (setq org-export-with-sub-superscripts nil)


  ;; elegantpaper.cls
  ;; https://github.com/ElegantLaTeX/ElegantPaper/blob/master/elegantpaper.cls
  (with-eval-after-load 'ox-latex
  ;; http://orgmode.org/worg/org-faq.html#using-xelatex-for-pdf-export
  ;; latexmk runs pdflatex/xelatex (whatever is specified) multiple times
  ;; automatically to resolve the cross-references.
  (setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))
   ;; (setq org-latex-pdf-process '("latexmk -xelatex -quiet -shell-escape -f %f"))
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

  ;; beamer settings.
  (add-to-list 'org-latex-classes
                `("beamer"
                  ,(concat "\\documentclass[lang=cn]{beamer}\n"
                           "[DEFAULT-PACKAGES]"
                           "[PACKAGES]"
                           "[EXTRA]\n")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
		  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

   (add-to-list 'org-latex-classes
               '("lz-beamer"
"\\documentclass[aspectratio=169]{ctexbeamer} % 比例16:9, ctex以支持中文
\\usetheme{Warsaw}
% \\usefonttheme{serif}              % 衬线字体
% \\usefonttheme{professionalfonts}  % 数学公式字体
\\AtBeginSection{\\frame{\\sectionpage}} %我理解好像加入一个section首页
\\institute{The Hong Kong Polytechnic University}         %加入学校名称
\\usetheme{CambridgeUS}                       % 主题
\\usecolortheme{default}                          %使用默认颜色
\\useinnertheme{rectangles}                       % itemize的形式
\\definecolor{links}{HTML}{0000A0}                
\\setbeamertemplate{itemize items}[default]
\\setbeamertemplate{enumerate items}[default]
\\setbeamertemplate{items}[default]
\\setbeamercolor*{local structure}{fg=darkred}
\\setbeamercolor{section in toc}{fg=darkred}
\\setlength{\\parskip}{\\smallskipamount}
% beamer set
\\usepackage[none]{hyphenat}
\\usepackage[abs]{overpic}
[NO-DEFAULT-PACKAGES]
[PACKAGES]

%如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
\\defaultfontfeatures{Mapping=tex-text}
% 中文断行
\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
[EXTRA]
"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
)

;; 生成PDF后清理辅助文件
;; https://answer-id.com/53623039
(setq org-latex-logfiles-extensions
(quote ("lof" "lot" "tex" "tex~" "aux"
    "idx" "log" "out" "toc" "nav"
    "snm" "vrb" "dvi" "fdb_latexmk"
    "blg" "brf" "fls" "entoc" "ps"
    "spl" "bbl" "xdv")))
(add-hook 'org-mode-hook 'org-beamer-mode)

(setq org-html-coding-system 'utf-8)
(setq org-html-doctype "html5")
(setq org-html-head
      "<link rel='stylesheet' type='text/css' href='https://gongzhitaao.org/orgcss/org.css'/> ")

(provide 'org-export)
;; ;;=====================================
;; ;;          end: org-to-latex
;; ;;=====================================


;;; export to html


















;;; org-export.el ends here
