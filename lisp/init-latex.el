;; only for latex files.
;; liangzid in 2020.4.18

(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list 'turn-on-org-cdlatex
	    'reftex-mode
	    'outline-minor-mode
	    'auto-fill-mode
	    'flyspell-mode
	    'hide-body t)
      )

;; 数学符号默认字体为Cambria Math
;; (set-fontset-font "fontset-default" 'symbol
;;  		  "Cambria Math")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 以下为LaTeX mode相关设置
(setq-default TeX-master nil) ;; 编译时问询主文件名称
(setq TeX-parse-selt t) ;; 对新文件自动解析(usepackage, bibliograph, newtheorem等信息)
;; PDF正向搜索相关设置
(setq TeX-PDF-mode t) 
(setq TeX-source-correlate-mode t) 
(setq TeX-source-correlate-method 'synctex) 
(setq TeX-view-program-list
 '(("Sumatra PDF" ("\"c:/Users/liangzi/AppData/Local/SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o")))) 

;; 打开TeX文件时应该加载的mode/执行的命令
(defun my-latex-hook ()
  (turn-on-cdlatex) ;; 加载cdlatex
  (outline-minor-mode) ;; 加载outline mode
  (turn-on-reftex)  ;; 加载reftex
  (auto-fill-mode)  ;; 加载自动换行
  (flyspell-mode)   ;; 加载拼写检查 (需要安装aspell)
  (TeX-fold-mode t) ;; 加载TeX fold mode
  ;; (outline-hide-body) ;; 打开文件时只显示章节标题
  (assq-delete-all (quote output-pdf) TeX-view-program-selection)
  ;; 以下两行是正向搜索相关设置
  (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))
  )
(add-hook 'LaTeX-mode-hook 'my-latex-hook)


;; 设置正常的pdf 运行模式为pdftex
(setq-default TeX-PDF-mode t)
(setq latex-run-command "pdflatex")


;; LaTeX mode相关设置完毕
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(provide 'init-latex)
