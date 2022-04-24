;; only for latex files.
;; liangzid in 2020.4.18

;; (mapc (lambda (mode)
;; 	(add-hook 'LaTeX-mode-hook mode))
;;       (list 'turn-on-org-cdlatex
;; 	    'reftex-mode
;; 	    'outline-minor-mode
;; 	    'auto-fill-mode
;; 	    'flyspell-mode
;; 	    'hide-body t)
;;       )

;; 数学符号默认字体为Cambria Math
;; (set-fontset-font "fontset-default" 'symbol
;;  		  "Cambria Math")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'use-package)
(my/install-package-if-not-found 'auctex)
;;(my/install-package-if-not-found 'reftex)
(my/install-package-if-not-found 'cdlatex)
(my/install-package-if-not-found 'company-reftex)
;;(my/install-package-if-not-found 'company-auctex)
;;;;;;初始化acutex

(require 'company-reftex)


  ;; (if (system-is-linux)
  ;;     (setq TeX-view-program-selection
  ;; 	    (quote (((output-dvi style-pstricks) "dvips and gv")
  ;; 		    (output-dvi "xdvi")
  ;; 		    (output-pdf "Evince")
  ;; 		                        (output-html "xdg-open"))))))




(load "auctex.el" nil t t)
(setq TeX-parse-self t)
(setq TeX-parse-selt t) ;; 对新文件自动解析(usepackage, bibliograph, newtheorem等信息)
(setq-default Tex-master nil) ;; nil means it will query which file is the master file.


;; 设置正常的pdf 运行模式为pdftex
(setq-default TeX-PDF-mode t)
(setq latex-run-command "pdflatex")

;;;;;;;;;;;;;;;;;;;;;;;;;;CDLaTeX;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;LaTex-mode settings;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook (lambda ()
		  ;; (TeX-fold-mode 1) ;; 自动折叠，似乎不是很需要
		  (auto-fill-mode 1) ;;开启自动断行
		  ;; (turn-on-auto-fill)              ;;LaTeX mode，turn off auto fold
		  ;; (auto-complete-mode 1)
          (LaTeX-math-mode 1) ;; using ` for similar latex symbol insert!
		  (outline-minor-mode 1)
  		  (imenu-add-menubar-index)

		  (setq TeX-show-compilation t)   ;; display compilation windows
		  (setq TeX-global-PDF-mode t       ;;PDF mode enable, not plain
		  		TeX-engine 'default)  ;;use xelatex default

		  (setq TeX-clean-confirm nil) ;; cleaning file without ask human.
		  (setq TeX-save-query nil)    ;; for save permission. we give it.
          (setq font-latex-fontify-script t) ;;简单的可视化
		  (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
		  (setq TeX-electric-escape nil)   ;; press \ then, jump to mini-buffer to input commands
		  (if *is-linux*
		      (setq TeX-view-program-list '(("Evince" "evince %o")))
		    )
		  ;; (setq TeX-view-program-list '(("Evince" "evince %o"))) ;;

(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))

(add-to-list 'TeX-view-program-list '("eaf" eaf-pdf-synctex-forward-view))

(add-to-list 'TeX-view-program-selection '(output-pdf "eaf"))

		  ; (setq TeX-view-program-selection '((output-pdf "Evince")))

		  ;(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
		  ;(setq TeX-command-default "XeLaTeX")

          ;; (setq TeX-fold-env-spec-list (quote (("[comment]" ("comment")) ("[figure]" ("figure")) ("[table]" ("table"))("[itemize]"("itemize"))("[enumerate]"("enumerate"))("[description]"("description"))("[overpic]"("overpic"))("[tabularx]"("tabularx"))("[code]"("code"))("[shell]"("shell")))))

          (setq LaTeX-section-hook
                '(LaTeX-section-heading
            LaTeX-section-title
            LaTeX-section-toc
            LaTeX-section-section
            LaTeX-section-label))
));;



;; ==============================废弃，无法使用==================================================
;; ==============================废弃，无法使用==================================================
;; (use-package company-auctex
;;   :config
;;   (add-hook 'LaTeX-mode-hook
;; 	    (lambda ()
;; 	      (make-local-variable 'company-backends)
;; 	      (setq company-backends '())
;; 	      (company-auctex-init))))

;; ;;;-------------------------------------------------------------------------------------

;; ;; ;; PDF正向搜索相关设置
;; ;; (setq TeX-PDF-mode t) 
;; ;; (setq TeX-source-correlate-mode t) 
;; ;; (setq TeX-source-correlate-method 'synctex) 
;; (setq TeX-view-program-list
;;       '(("foxitreader" "foxitreader %s.pdf")
;; 	("Sumatra PDF" ("\"c:/Users/liangzi/AppData/Local/SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o")))) 
;; (setq Tex-view-program-selection '((output-pdf "foxitreader")))


;; ;; ;; 打开TeX文件时应该加载的mode/执行的命令
;; ;; (defun my-latex-hook ()
;; ;;   (turn-on-cdlatex) ;; 加载cdlatex
;; ;;   (outline-minor-mode) ;; 加载outline mode
;; ;;   (turn-on-reftex)  ;; 加载reftex
;; ;;   (auto-fill-mode)  ;; 加载自动换行
;; ;;   (flyspell-mode)   ;; 加载拼写检查 (需要安装aspell)
;; ;;   (TeX-fold-mode t) ;; 加载TeX fold mode
;; ;;   ;; (outline-hide-body) ;; 打开文件时只显示章节标题
;; ;;   (assq-delete-all (quote output-pdf) TeX-view-program-selection)
;; ;;   ;; 以下两行是正向搜索相关设置
;; ;;   )
;; ;; (add-hook 'LaTeX-mode-hook 'my-latex-hook)


		  ;; ;;;;;;;;;;;;;;;; flyspell settings
		  ;; (flyspell-mode 1)
		  ;; (setq flyspell-sort-corrections nil)
		  ;; (setq flyspell-doublon-as-error-flag nil)

		  ;; (define-key LaTeX-mode-map (kbd "C-c C-p") 'reftex-parse-all)


;; LaTeX mode相关设置完毕
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-latex)
