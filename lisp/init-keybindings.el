;; 关于快捷键绑定的一些东西。

(global-set-key "\C-s" 'swiper) ;; 在进行C-s时提供一个candidate
(global-set-key (kbd "C-c C-r") 'ivy-resume)  ;; 不知道是干什么的。
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "<f2>") 'open-my-init-file)


(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c p f") 'counsel-git)  ;;似乎是关于git的，有待核实。

;; i have moved this to init-org.el
;; (global-set-key (kbd "C-c a") 'org-agenda)

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode) ;;smartparens


(global-set-key (kbd "C-\\") 'comment-line) ;;用来注释的

;;(global-set-key (kbd "<f3>") 'helm-recentf)

;; some thing makes me comment it.
;; (global-set-key (kbd "<f4>") 'fiplr-find-file)
;; (global-set-key (kbd "<f5>") 'grep-find)
;; (global-set-key (kbd "<f10>") 'helm-M-x)

(global-set-key (kbd "M-0") 'next-multiframe-window)
(global-set-key (kbd "M-9") 'previous-multiframe-window)



(provide 'init-keybindings)
