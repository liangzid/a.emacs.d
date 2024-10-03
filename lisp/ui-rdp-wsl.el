;;; UI-RDP-WSL --- 
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created:  1 November 2023
;;
;;; Commentary:
;;
;; this code is about how to refact the UI for RDP-WSL Settings  
;;
;;; Code:


(defun enable-150%-scale-big()
  (interactive)
  ;; first show larger texts
  (progn
    ;; (set-face-attribute
    ;;  'default nil :font
    ;;  (nth
    ;;   (random (length font-ls))
    ;;   font-ls)
    ;;  :weight 'normal)

    (set-face-attribute 'default nil :font "Iosevka 17"
			:weight 'normal)

    (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
			charset
			(font-spec :family "LXGW WenKai Mono" :font 14
				    :weight 'normal)))
	)
  
  )


(provide 'ui-rdp-wsl)

;;; ui-rdp-wsl.el ends here
