(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)

;;(setq-default cursor-type 'bar)

(setq  initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode t)

;; 解决显示Unicode字符的卡顿问题
(setq inhibit-compacting-font-caches t)

;; 汉字默认字体为Kaiti(楷体)，可改为其它字体
(set-fontset-font "fontset-default" 'han
		  "KaiTi")
;; 数学符号默认字体为Cambria Math
(set-fontset-font "fontset-default" 'symbol
 		  "Cambria Math")




(provide 'init-ui)
