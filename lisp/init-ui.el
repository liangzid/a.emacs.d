;; 在进行这里的配置之前，我想告诉你，你曾经找到的这篇文章还没有阅读
;; 如果某一天你的配置很多且很慢了，我希望你阅读它。
;;                                      ------2020.04.20的梁子写给现在的梁子的话
;; https://zhuanlan.zhihu.com/p/59509596


(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-splash-screen t)

;;(setq-default cursor-type 'bar)


;; 设置默认路径。


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
