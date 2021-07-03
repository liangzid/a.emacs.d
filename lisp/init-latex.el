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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;初始化acutex
(load "auctex.el" nil t t)
(setq TeX-parse-self t)
(setq TeX-parse-selt t) ;; 对新文件自动解析(usepackage, bibliograph, newtheorem等信息)
(setq-default Tex-master nil)

;; 设置正常的pdf 运行模式为pdftex
(setq-default TeX-PDF-mode t)
(setq latex-run-command "pdflatex")

;;;;;reftex
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-toc-split-windows-horizontally t) ;;*toc*buffer on left。
(setq reftex-toc-split-windows-fraction 0.2)  ;;*toc*buffer ratio。
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)  
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

;;;;;;;;;;;;;;;;;;;;;;;;;;CDLaTeX;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;LaTex-mode settings;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook (lambda ()
		  ;; (require 'init-auto-complete-settings)
                  ;; (require 'init-yasnippet-settings)
		  (TeX-fold-mode 1)
		  (auto-fill-mode 1)

		  ;;;;;;;;;;;;;;;; flyspell settings
		  (flyspell-mode 1)
		  (setq flyspell-sort-corrections nil)
		  (setq flyspell-doublon-as-error-flag nil)

		  
		  (turn-on-auto-fill)              ;;LaTeX mode，turn off auto fold
		  (linum-mode 1)
		  ;;(auto-complete-mode 1)
		  (latex-math-mode 1)
		  (outline-minor-mode 1)            
  		  (imenu-add-menubar-index)

		  (setq TeX-show-compilation nil)   ;;NOT display compilation windows
		  (setq TeX-global-PDF-mode t       ;;PDF mode enable, not plain
		  		TeX-engine 'default)  ;;use xelatex default
		  (setq TeX-clean-confirm nil)
		  (setq TeX-save-query nil)
		 
                  (setq font-latex-fontify-script t)
		  (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
		  (setq TeX-electric-escape t)      ;; press \ then, jump to mini-buffer to input commands
		  ;(setq TeX-view-program-list '(("Evince" "evince %o"))) ;;
		  ; (setq TeX-view-program-selection '((output-pdf "Evince")))
		  ;(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
		  ;(setq TeX-command-default "XeLaTeX")
                  (setq TeX-fold-env-spec-list (quote (("[comment]" ("comment")) ("[figure]" ("figure")) ("[table]" ("table"))("[itemize]"("itemize"))("[enumerate]"("enumerate"))("[description]"("description"))("[overpic]"("overpic"))("[tabularx]"("tabularx"))("[code]"("code"))("[shell]"("shell")))))

		 
		  (define-key LaTeX-mode-map (kbd "C-c C-p") 'reftex-parse-all)
		  

                      (setq LaTeX-section-hook
                            '(LaTeX-section-heading
	                	LaTeX-section-title
		                LaTeX-section-toc
	                 	LaTeX-section-section
		                LaTeX-section-label))
));;

(use-package company-auctex
  :config
  (add-hook 'LaTeX-mode-hook
    (lambda ()
      (make-local-variable 'company-backends)
      (setq company-backends '())
      (company-auctex-init))))

;;;-------------------------------------------------------------------------------------

;; ;; PDF正向搜索相关设置
;; (setq TeX-PDF-mode t) 
;; (setq TeX-source-correlate-mode t) 
;; (setq TeX-source-correlate-method 'synctex) 
(setq TeX-view-program-list
      '(("foxitreader" "foxitreader %s.pdf")
	("Sumatra PDF" ("\"c:/Users/liangzi/AppData/Local/SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o")))) 
(setq Tex-view-program-selection '((output-pdf "foxitreader")))


;; ;; 打开TeX文件时应该加载的mode/执行的命令
;; (defun my-latex-hook ()
;;   (turn-on-cdlatex) ;; 加载cdlatex
;;   (outline-minor-mode) ;; 加载outline mode
;;   (turn-on-reftex)  ;; 加载reftex
;;   (auto-fill-mode)  ;; 加载自动换行
;;   (flyspell-mode)   ;; 加载拼写检查 (需要安装aspell)
;;   (TeX-fold-mode t) ;; 加载TeX fold mode
;;   ;; (outline-hide-body) ;; 打开文件时只显示章节标题
;;   (assq-delete-all (quote output-pdf) TeX-view-program-selection)
;;   ;; 以下两行是正向搜索相关设置
;;   )
;; (add-hook 'LaTeX-mode-hook 'my-latex-hook)




;; LaTeX mode相关设置完毕
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-latex)
