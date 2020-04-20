;; 不蜂鸣
(setq ring-bell-function 'ignore)

;; 自动还原模式
(global-auto-revert-mode t)


;; 显示行号
(global-linum-mode t)

;; 使用缩写，缩写表如下图所示。
(abbrev-mode t)
 (define-abbrev-table 'global-abbrev-table '(
                                              ("lz" "liangzi")
                                              ("lzd" "liangzid")
                                              ("zi" "Zi Liang")
                                              ("qq" "2273067585")
                                              ("qqmail" "2273067585@qq.com")
                                              ))


;; set coding
(prefer-coding-system 'utf-8)

(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")






;; 不进行文件备份
(setq make-backup-files nil)

;; 不进行自动保存
;;(setq auto-save-default nil)


;; 设置打开10个最近文件列表
(recentf-mode 1)			
(setq recentf-max-menu-items 10)

;; 自动括号补全？
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 可以通过键入字符代替被选中的对象，或者键入删除删除被选中的对象。
(delete-selection-mode t)


(provide 'init-better-defaults)
