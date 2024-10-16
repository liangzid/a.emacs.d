(my/install-package-if-not-found 'use-package)
(require 'use-package)
(my/install-package-if-not-found 'darcula-theme)
(my/install-package-if-not-found 'solarized-theme)
(my/install-package-if-not-found 'kaolin-themes)
(my/install-package-if-not-found 'nimbus-theme)
(my/install-package-if-not-found 'ample-theme)
(my/install-package-if-not-found 'inkpot-theme)
(my/install-package-if-not-found 'doom-themes)
(my/install-package-if-not-found 'almost-mono-themes)
(my/install-package-if-not-found 'modus-themes)
(my/install-package-if-not-found 'gruvbox-theme)
(my/install-package-if-not-found 'sublime-themes)
(my/install-package-if-not-found 'tao-theme)
(my/install-package-if-not-found 'all-the-icons)
(my/install-package-if-not-found 'all-the-icons-completion)
(my/install-package-if-not-found 'all-the-icons-dired)
(my/install-package-if-not-found 'beacon)
(my/install-package-if-not-found 'marginalia)

(require 'beacon)
(setq beacon-blink-when-focused t)
(setq beacon-blink-when-window-changes t)
(setq beacon-blink-when-point-moves-horizontally nil)
(setq beacon-blink-when-point-moves-vertically nil)

;; (setq beacon-timerk
;; (run-with-timer
;;  0
;;  (* 0.5 10)
;;  (lambda ()
;;    (progn
;;      (setq color-ls '(
;; 		     "#e84393"
;; 		     "#badc58"
;; 		     "#f6e58d"
;; 		     "#4bcffa"
;; 		     )
;; 	   )
;;      (setq beacon-color (nth (random (length color-ls)) color-ls))
;;      )))
;; )

(beacon-mode t)

;; prtovide extra informaiton via marginalia mode
(marginalia-mode)

;; 取消自动断行功能
(global-visual-line-mode nil)

;; 激活高亮当前行的功能
(require 'hl-line)
(global-hl-line-mode)

;; 取消UI界面的多余展示
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
;; (setq inhibit-startup-message t)
;; (setq inhibit-startup-screen t)

(setq font-ls '("Maple Mono 15"
		"Iosevka 17"
		"DejaVu Sans Mono 15"
		"FantasqueSansMono 18"
		"LXGWWenKaiMono 18"
		;; "Cascadia Mono PL 17"
		"Cascadia Code 15"
		"JetbrainsMono 15"
		)
      )

(defun my/set-fonts (font-ls)
    (if *is-windows*
    (progn
      ;; 解决显示Unicode字符的卡顿问题
      (setq inhibit-compacting-font-caches t)
      ;; (set-face-attribute 'default nil :font "微软雅黑 12")
      (set-face-attribute 'default nil :font "Cascadia Mono 10")
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
			  charset
			  (font-spec :family "微软雅黑" :font 14)))
      )
  (if (and *is-linux* (not (equal "0" *is-gui*)) *is-gui*)
      (progn
	(message "INIT-UI.EL:>>>is GUI: %s" *is-gui*)

	;;;; rqandom selection

	;; (set-face-attribute
	;; 'default nil :font
	;; (nth
	;; (random (length font-ls))
	;; font-ls)
	;; :weight 'normal)

	(set-face-attribute 'default nil :font "Iosevka 17"
			    :weight 'normal
			    :foreground "#A9F16C"
			    ;; :foreground "#badc58"
			    )
        (set-face-attribute 'font-lock-comment-face nil
			;; :slant 'italic
			;; :font "DejaVu Sans Mono 15"
			;; :weight 'normal
			:foreground "#96a0aa"
			)
        (set-face-attribute 'org-headline-done nil
			;; :slant 'italic
			;; :font "DejaVu Sans Mono 15"
			;; :weight 'normal
			:foreground "#96a0aa"
			)

	(dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
			  charset
			  (font-spec :family "LXGW WenKai Mono" :font 14
				     ;; :weight 'normal
				     )))
	;; (set-face-attribute 'default nil :font "FiraCode 10")
	;;(set-face-attribute 'default nil :font "文泉驿正黑 10")
	))))

(my/set-fonts font-ls)

;; set face for flymake-warning and flymake-error
;; (flymake-mode-on)

(add-hook 'flymake-mode-hook '(lambda ()
				(progn
    (set-face-attribute 'flymake-warning nil
			:underline '(:color "#f6e58d" :style wave))
    (set-face-attribute 'flymake-error nil
			:underline '(:color "#0c2461" :style line)
			:background "#eb2f06")
				  )
				))
(global-set-key (kbd "C-x e") 'flymake-show-project-diagnostics)
; nothing. add something.
(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/.local/bin") t)
(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/miniconda3/bin") t)
(add-to-list 'exec-path (concat
			 (getenv "HOME")
			 "/anaconda3/bin") t)
(add-to-list 'exec-path 
			 "/snap/bin" t)

;; (setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-threshold (* 50 1024 1024)) 

;; Improve lsp perf https://emacs-lsp.github.io/lsp-mode/page/performance/#increase-the-amount-of-data-which-emacs-reads-from-the-process
(setq read-process-output-max (* 3 1024 1024))

(set-frame-parameter nil 'alpha-background  0.799)
(setq default-frame-alist '((alpha-background . 88)))

;; (set-frame-parameter nil 'alpha 0.99999)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


;; ;; load eaf if necessary, bounding it into <F9>
;; (defun zl/load-eaf()
;;   (interactive)
;;   (if *is-gui*
;;       (require 'init-eaf))
;;   (message "do not need to load eaf! thanks sky.")
;;       )
;; (global-set-key (kbd "<f1>") 'zl/load-eaf)

;;remove warns for version up to emacs 27
(setq warning-suppress-log-types '((package reinitialization)))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/other-files")
;; (add-to-list 'load-path "~/.emacs.d/other-files/netease-cloud-music.el")

(defconst *is-server* t)


;;; functional configs.
(require 'init-self-config-function)
(require 'init-wsl)
(require 'init-elpa)
(require 'init-eshell)
;; (require 'init-docker)
(require 'init-proxy)
(require 'init-largefile)
(require 'init-dired)
(require 'init-clipboard)
(require 'init-yas)
(require 'init-git)
(require 'init-citre)
(require 'init-python)
;;(require 'init-haskell)
(require 'init-latex)
(require 'init-cl)
(require 'init-cpp)
(require 'init-rust)
(require 'init-cider)
(require 'init-blog)
(require 'init-web)
;;(require 'init-astaple)
(require 'init-path)
(require 'init-collection)
(require 'init-rss)
(require 'init-keybindings)
(require 'init-rg)
(require 'init-spell)
(require 'init-packages)
(require 'init-lsp) ;; language server protocol
(require 'init-evil)
;; (require 'init-meow)
(require 'init-undo)
(require 'init-keyfreq);;(require 'init-netease)
(require 'init-org)
(require 'init-ssh)

(require 'easy-surround)

;; (desktop-save-mode)
;; (desktop-read)
;; for computer custom application. cannot be used for any self-designing.
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

;;; UI configs.
(require 'init-modeline)
(require 'init-window)
(require 'init-chinese) ;; only have part of UI.
(require 'init-better-defaults)
(require 'init-ui)
;; (require 'init-dashboard)


(setq gc-cons-percentage 0.6)

;; toggle maximized screen
;; (maximize-window)
(toggle-frame-fullscreen)
(if (and *is-gui* (not (equal *is-gui* ":0")))
    (enable-150%-scale-big)
    )
(enable-150%-scale-big)


(setq debug-on-error nil)
(setq debug-on-signal nil)

(global-set-key (kbd "<f1>") 'restart-emacs)
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-c C-=") 'enable-150%-scale-big)
(global-set-key (kbd "C-c C--") 'enable-75%-scale-big)

(provide 'init)
(global-set-key (kbd "C-x n") 'flymake-goto-next-error)
(global-set-key (kbd "C-x N") 'flymake-goto-prev-error)

(if *is-linux*
    (set-face-attribute 'jinx-misspelled nil
		    :underline '(:color "#eb2f06" :style line)
		    ;; :background nil
		    )
    )

(setq light-themes '(
		    ;;; light
		    ;; kaolin-valley-light
		    ;; kaolin-breeze
		    ;; kaolin-light
		    ;; kaolin-mono-light
		    
		    ;; almost-mono-white
		    ;; modus-operandi
		    ;; gruvbox-light-medium
		    ;; gruvbox-light-hard
		    ;; tao-yang
	))
(setq dark-themes '(
		;;; Beautiful but cannot be used.
		;; doom-monokai-pro
		;; doom-dracula
		;; doom-feather-dark

		;;; dark
		kaolin-eclipse
		kaolin-dark
		kaolin-aurora
		kaolin-blossom
		kaolin-galaxy
		kaolin-valley-dark
		kaolin-mono-dark
		kaolin-shiva

		;; gruvbox-dark-medium
		;; gruvbox-dark-hard
		;; tao-yin
	))

;; (load-theme 'gruvbox-dark-hard t)
;; (my/install-package-if-not-found 'fantom-theme)
(my/install-package-if-not-found 'challenger-deep-theme)
(require 'challenger-deep-theme)
(load-theme 'challenger-deep t)
;; (load-theme 'gruvbox-dark-hard t)

(defun my/random-theme (my-prefer-themes)
  "Random load the theme from random theme list. I use it for random
load a beautiful theme."
  (let* (
	 (random-index (random (length my-prefer-themes)))
	 (selected-theme (nth random-index my-prefer-themes )))
    (message "theme name: %s" selected-theme)
    (load-theme selected-theme t)
    (if (version< emacs-version "29")
	(global-linum-mode t)
        (global-display-line-numbers-mode 1)
	)
    (window-divider-mode -1)
    (scroll-bar-mode -1)

    ;;;; hard coding of the themes
    ;; (set-face-attribute 'font-lock-keyword-face nil :weight 'light
		;; :slant 'italic :underline t)
    ;; (set-face-attribute 'font-lock-string-face nil :weight 'regular
		;; :slant 'italic)
    ;; (set-face-attribute 'font-lock-variable-name-face nil
    ;; 			:weight 'demibold
    ;; 			;; :background nil
    ;; 			)

    ;; (set-face-attribute 'border nil :weight 'black)
    ))

(defun _between-hours (a b)
  "After hours `a', and before the hours `b' is true"
  (let* ((current-time (decode-time))
	 (hour (nth 2 current-time))
	 )
    (or (> hour a) (< hour b)))
  )

;;; THEME RANDOMIZATION
;; (if *is-gui*
;;     (setq random-theme-timer
;; 	  (run-with-timer 0 (* 30 60)
;; 		    (lambda ()

;;                       (my/set-fonts font-ls)
;; 		      (if (_between-hours 18 9)
;; 			  (my/random-theme dark-themes)
;; 			(my/random-theme (append
;; 					  light-themes
;; 					  dark-themes)))
;; 		      )
;; 		    )
;;     )
;;     ;; (load-theme 'monokai t)
;; )

;; THEME

(if (version< emacs-version "29")
    (global-linum-mode t)
  (global-display-line-numbers-mode 1)
    )


;; (set-face-attribute 'font-lock-function-name-face nil
;;     :foreground "red"
;;     :italic nil
;;     :bold t
;;     :underline nil
;;     )


;; (load-theme 'monokai t)
(require 'rainbow-mode)
(require ' rainbow-delimiters)
(add-hook 'prog-mode-hook (rainbow-mode t))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode-enable)
(rainbow-mode t)
(rainbow-delimiters-mode t)
(set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
(set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
(set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
(set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
(set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
(set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
(set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
(set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
(set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray


;; 设置编码格式为UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8) 
(set-terminal-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8)

;; set coding
;; (reset-language-environment 'utf-8)
;; (set-buffer-file-coding-system 'utf-8-unix)
;; (setq default-buffer-file-coding-system 'utf-8-unix)
;;(prefer-coding-system 'utf-8)
;;(set-default-coding-systems 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(set-terminal-coding-system 'utf-8)
;;(setq buffer-file-coding-system 'utf-8)
;;(setq erc-server-coding-system '(utf-8 . utf-8))
;;(setq locale-coding-system 'utf-8)
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
;;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (set-fontset-font "fontset-default" 'han
;; 		  "KaiTi")
;; (set-fontset-font "fontset-default" 'han
;; 		  "SimHei")
;; (set-fontset-font "fontset-default" 'symbol
;; 		  "Cambria Math")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\

;; set icons
(if *is-gui*
    (progn
      (require 'all-the-icons)
      ;; now config all the icons completion
      (require 'all-the-icons-completion)
      (all-the-icons-completion-mode)
      ;; now config dired
      (load "all-the-icons-dired.el")
      (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)))



(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

(require 'ui-rdp-wsl)
(global-set-key (kbd "<f10>") 'enable-150%-scale-big)

;; adding the 80-char lines
(if *is-gui*
(global-display-fill-column-indicator-mode)
    )


;; setting three even split and binding to C-x 5
(defun split-3-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows)
)


(defun split-4-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows)
)

(defun split-5-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-4-windows-horizontally-evenly)
  (command-execute 'other-window)
  (command-execute 'other-window)
  (command-execute 'other-window)
  (command-execute 'delete-window)
  (command-execute 'split-window-vertically)
  (command-execute 'other-window)
  (command-execute 'split-window-horizontally)
)

(global-set-key (kbd "C-x 4") 'split-4-windows-horizontally-evenly)
(global-set-key (kbd "C-x 5") 'split-3-windows-horizontally-evenly)
(global-set-key (kbd "C-x 6") 'split-5-windows-horizontally-evenly)

(setq shift-selection-mode t)
;; (global-unset-key (vector (list 'shift 'left)))
;; (global-unset-key (vector (list 'shift 'right)))
;; (global-unset-key (vector (list 'shift 'up)))
;; (global-unset-key (vector (list 'shift 'down)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smartparens)
(require 'smartparens-config)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil) ;; 停止对单引号的smart补全
(sp-local-pair 'web-mode "<" nil :actions nil)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode) ;;smartparens
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; (require 'dangerous-ui)

(provide 'init-ui)
