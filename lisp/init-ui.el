;; 在进行这里的配置之前，我想告诉你，你曾经找到的这篇文章还没有阅读
;; 如果某一天你的配置很多且很慢了，我希望你阅读它。
;;                                      ------2020.04.20的梁子写给现在的梁子的话
;; https://zhuanlan.zhihu.com/p/59509596
(require 'use-package)
(my/install-package-if-not-found 'darcula-theme)
(my/install-package-if-not-found 'solarized-theme)
(my/install-package-if-not-found 'kaolin-themes)
(my/install-package-if-not-found 'nimbus-theme)
(my/install-package-if-not-found 'ample-theme)
(my/install-package-if-not-found 'inkpot-theme)
(my/install-package-if-not-found 'zenburn-theme)
(my/install-package-if-not-found 'doom-themes)
(my/install-package-if-not-found 'all-the-icons)
(my/install-package-if-not-found 'all-the-icons-completion)
(my/install-package-if-not-found 'all-the-icons-dired)

;; 取消自动断行功能
(global-visual-line-mode nil)

;; 激活高亮当前行的功能
(use-package hl-line
  :ensure t
  :hook (after-init . global-hl-line-mode))
(global-hl-line-mode)

;; 取消UI界面的多余展示
(tool-bar-mode 0)
(menu-bar-mode 0)
;; (scroll-bar-mode 1)
;; (setq inhibit-startup-message t)
;; (setq inhibit-startup-screen t)


(if *is-windows*
    (progn
      ;; 解决显示Unicode字符的卡顿问题
      (setq inhibit-compacting-font-caches t)
      (set-face-attribute 'default nil :font "微软雅黑 12")
      )
  (if *is-linux*
      (progn
	(message "you should reset the font.")
	;;(set-face-attribute 'default nil :font "文泉驿正黑 12")
	)))

;; (setq my-prefer-themes '(darcula monokai solarized-light solarized-dark))

(defun my/random-theme ()
  "Random load the theme from random theme list. I use it for random
load a beautiful theme."
  (interactive)
  (let* ((my-prefer-themes '(darcula monokai solarized-light
				     solarized-dark kaolin-dark kaolin-light
				     kaolin-aurora kaolin-bubblegum kaolin-eclipse
				     kaolin-eclipse kaolin-galaxy kaolin-ocean
				     kaolin-valley-dark nimbus ample
				     inkpot zenburn doom-tokyo-night
				     ))
	 (random-index (random (length my-prefer-themes)))
	 (selected-theme (nth random-index my-prefer-themes )))
    (load-theme selected-theme t)
    ))


;; theme
(if *is-gui*
    (my/random-theme)
    (load-theme 'monokai t)
)
;; (load-theme 'monokai t)
(add-hook 'prog-mode-hook (rainbow-mode t))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode-enable)

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

;;; 字体设置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; 汉字默认字体为Kaiti(楷体)，可改为其它字体
;; (set-fontset-font "fontset-default" 'han
;; 		  "KaiTi")
;; (set-fontset-font "fontset-default" 'han
;; 		  "SimHei")
;; ;; 数学符号默认字体为Cambria Math
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



;;字号切换，字号增大、减小、不变
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)



;; adding the 80-char lines
(if *is-gui*
(global-display-fill-column-indicator-mode)
    )

;; show time at modeline
(display-time-mode)

;; setting three even split and binding to C-x 5
(defun split-3-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows)
)

(global-set-key (kbd "C-x 5") 'split-3-windows-horizontally-evenly)

(setq shift-selection-mode t)
(global-unset-key (vector (list 'shift 'left)))
(global-unset-key (vector (list 'shift 'right)))
(global-unset-key (vector (list 'shift 'up)))
(global-unset-key (vector (list 'shift 'down)))


(provide 'init-ui)
