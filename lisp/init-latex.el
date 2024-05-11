;; only for latex files.
;; liangzid in 2020.4.18
(my/install-package-if-not-found 'ivy-bibtex)
(my/install-package-if-not-found 'lsp-grammarly)
(my/install-package-if-not-found 'lsp-ltex)
(my/install-package-if-not-found 'langtool)

(autoload 'ivy-bibtex "ivy-bibtex" "" t)
;; ivy-bibtex requires ivy's `ivy--regex-ignore-order` regex builder, which
;; ignores the order of regexp tokens when searching for matching candidates.
;; Add something like this to your init file:
(setq ivy-re-builders-alist
      '((ivy-bibtex . ivy--regex-ignore-order)
        (t . ivy--regex-plus)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'use-package)
(my/install-package-if-not-found 'auctex)
;;(my/install-package-if-not-found 'reftex)
(my/install-package-if-not-found 'cdlatex)
(my/install-package-if-not-found 'company-reftex)
;;(my/install-package-if-not-found 'company-auctex)
;;;;;;初始化acutex

(require 'company-reftex)


(load "auctex.el" nil t t)
(setq TeX-parse-self t)
(setq TeX-parse-selt t) ;; 对新文件自动解析(usepackage, bibliograph, newtheorem等信息)
(setq-default Tex-master nil) ;; nil means it will query which file is the master file.

(setq TeX-source-correlate-start-server t)

;; 设置正常的pdf 运行模式为pdftex
(setq-default TeX-PDF-mode t)
(setq latex-run-command "pdflatex")

;;;;;;;;;;;;;;;;;;;;;;;;;;CDLaTeX;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;LaTex-mode settings;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if *is-linux*
    (progn
    (setq TeX-view-program-list '())
    (setq TeX-view-program-selection '())
    (add-to-list 'TeX-view-program-list '("Evince" "evince %o"))
    (add-to-list 'TeX-view-program-list '("okular" "okular %o"))
    (add-to-list 'TeX-view-program-list '("eaf" eaf-pdf-synctex-forward-view))
    (add-to-list 'TeX-view-program-selection '(output-pdf "eaf"))
    (add-to-list 'TeX-view-program-selection '(output-pdf "Evince"))
    (add-to-list 'TeX-view-program-selection '(output-pdf "okular"))
    )
  (message
   "message: not setting. USING DEFAULT."
   )
)

(add-hook 'LaTeX-mode-hook (lambda ()
		  (TeX-fold-mode 1) ;; 自动折叠，似乎不是很需要
		  (auto-fill-mode 0) ;;开启自动断行
		  (turn-on-auto-fill)   ;;LaTeX mode，turn off auto fold
		  ;; (auto-complete-mode 1)
		  (LaTeX-math-mode 1) ;; using ` for similar latex symbol insert!
		  (outline-minor-mode 1)
  		  (imenu-add-menubar-index)

		  (setq TeX-show-compilation nil) 
		  (setq TeX-global-PDF-mode t ;;PDF mode enable, not plain
		  		TeX-engine 'default)  ;;use xelatex default

		  (setq TeX-clean-confirm nil) ;; cleaning file without ask human.
		  (setq TeX-save-query nil);; for save permission. we give it.
		  (setq font-latex-fontify-script t) ;;简单的可视化
		  (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
		  (setq TeX-electric-escape nil) ;; press \ then, jump to mini-buffer to input commands
		  (if *is-linux*
		      (message "setted before.")
		    (setq TeX-view-program-list'(("~/.emacs.d/software/SumatraPDF-3.3.3-64-portable.exe -reuse-instance" (mode-io-correlate " -forward-search %b %n") " %o")))
		    )
		  ;; (setq TeX-view-program-list '(("Evince" "evince %o"))) ;;

		  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
		  ;; (add-to-list 'TeX-view-program-list '("eaf" eaf-pdf-synctex-forward-view))
		  ;; (add-to-list 'TeX-view-program-selection '(output-pdf "eaf"))
		  

		  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))

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

(defvar cover-command "")
(defun latex-cover-region-with@zl ()
  (interactive)
  (setq cover-command (concat "\\" (read-from-minibuffer "command:"
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
;;(define-key latex-mode-map (kbd "C-c c") 'latex-cover-region-with@zl)

;; (message "now enable the grammarly for writing latex.")

;; (use-package lsp-grammarly
;;   :ensure t
;;   :hook (text-mode . (lambda ()
;; 		       (require 'lsp-grammarly)
;; 		       (lsp)
;; 		       )))

;; (use-package lsp-ltex
;;   :ensure t
;;   :hook (text-mode . (lambda ()
;; 		       (require 'lsp-ltex)
;; 		       (lsp)))
;;   :config (progn
;; 	    (setq lsp-ltex--combined-disabled-rules nil)
;; 	    (setq lsp-ltex-additional-rules-language-model "")
;; 	    (setq lsp-ltex-check-frequency "save")
;; 	    (setq lsp-ltex-status-bar-item 1)
;; 	    )
  
;;   :init
;;   (setq lsp-ltex-version "15.2.0"))


; make sure you have set this, see below

;; (require 'flycheck)
;; (flycheck-define-checker vale
;;   "A prose linter"
;;   :command ("vale" "--output" "line"
;;             source)
;;   :standard-input nil
;;   :error-patterns
;;   ((error line-start (file-name) ":" line ":" column ":" (id (one-or-more (not (any ":")))) ":" (message) line-end))
;;   :modes (markdown-mode org-mode text-mode)
;;   )
;; (add-to-list 'flycheck-checkers 'vale 'append)
;; (setq flycheck-vale-executable "/snap/bin/vale")

(setq langtool-language-tool-jar
      "/home/liangzi/LanguageTool-stable/LanguageTool-6.3/languagetool-commandline.jar")
(require 'langtool)
(global-set-key (kbd "C-, C-c") 'langtool-check)
(global-set-key (kbd "C-, C") 'langtool-check-done)
(global-set-key (kbd "C-, y") 'langtool--correction-popup)

;; (my/install-package-if-not-found 'flycheck-grammarly)
;; (with-eval-after-load 'flycheck
;;   (flycheck-grammarly-setup))

;; (setq flycheck-grammarly-check-time 0.8)

(my/install-package-if-not-found 'lsp-grammarly)

(use-package lsp-grammarly
  :ensure t
  :hook (text-mode . (lambda ()
                       (require 'lsp-grammarly)
                       (lsp))))




(provide 'init-latex)
