;; 在进行这里的配置之前，我想告诉你，你曾经找到的这篇文章还没有阅读
;; 如果某一天你的配置很多且很慢了，我希望你阅读它。
;;                                      ------2020.04.20的梁子写给现在的梁子的话
;; https://zhuanlan.zhihu.com/p/59509596
(require 'use-package)

;; 取消自动断行功能
(global-visual-line-mode 1)

;; 激活高亮当前行的功能
(use-package hl-line
  :ensure t
  :hook (after-init . global-hl-line-mode))
(global-hl-line-mode)

;; 取消UI界面的多余展示
;; (tool-bar-mode 0)
;; (scroll-bar-mode 1)
;; (setq inhibit-startup-message t)
;; (setq inhibit-startup-screen t)


;; theme
(load-theme 'monokai t)
(add-hook 'prog-mode-hook (rainbow-mode t))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode-enable)

;; 设置编码格式为UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8) 
(set-terminal-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8)


;;; 字体设置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 解决显示Unicode字符的卡顿问题
;(setq inhibit-compacting-font-caches t)
;; ;; 汉字默认字体为Kaiti(楷体)，可改为其它字体
;; (set-fontset-font "fontset-default" 'han
;; 		  "KaiTi")
;(set-fontset-font "fontset-default" 'han
;		  "SimHei")

;; 数学符号默认字体为Cambria Math
;(set-fontset-font "fontset-default" 'symbol
; 		  "Cambria Math")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\


;;字号切换，字号增大、减小、不变
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)



(provide 'init-ui)
