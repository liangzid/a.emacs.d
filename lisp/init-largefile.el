;;; INIT-LARGEFILE --- 
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 16 四月 2023
;;
;;; Commentary:
;;
;;  for reading large log files
;;
;;; Code:

;; ===================================================================
;;    VLF is bad. I don't want to use it anymore.k
;; ===================================================================

;; (my/install-package-if-not-found 'vlf)

;; (require 'vlf-setup)

;; ;; cannot be used. might be confict to the commands in evil-normal.
;; ;(define-key vlf-mode-map (kbd "C-n") 'vlf-next-batch)
;; ;(define-key vlf-mode-map (kbd "C-p") 'vlf-prev-batch)
;; ;(define-key vlf-mode-map (kbd "C-s") 'vlf-re-search-forward)


;; (defun popout-keyboard-tips()
;;   (interactive)
;;   (let ((tips "This is VLF (Very Large File) mode, type =C-c C-v= to see the prefix commands. Type =q= to quit.")
;; 	(tips-cn "这是VLF模式，使用=C-c C-v=前缀来查看怎么使用VLF里的命令，一般which keys会给你显示结果。使用q键退出。"))
;;     (with-output-to-temp-buffer "*LZ Tips of VLF Buffer*"
;;       (princ (concat tips "\n" tips-cn))
;;       )
;;     (let ((buf (get-buffer "*LZ Tips of VLF Buffer*")))
;;       (define-key evil-normal-state-local-map (kbd "q")
;; 		      `(lambda ()
;; 			 (interactive)
;; 			 (quit-window t ,(buffer-name buf))))
;; 	  (display-buffer buf)))
;;   )

;; (add-hook 'vlf-mode-hook 'popout-keyboard-tips)


(provide 'init-largefile)
;;; init-largefile.el ends here
