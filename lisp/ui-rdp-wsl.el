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
	;; (message "you should reset the font.")
    (set-face-attribute
     'default nil :font
     (nth
      (random (length font-ls))
      font-ls)
     :weight 'normal)
	;; (set-face-attribute 'default nil :font "DejaVu Sans Mono 10")
	;; (set-face-attribute 'default nil :font "Fira Code 10")
	;; (set-face-attribute 'default nil :font "Source Code Pro 10"
			    ;; :weight 'demibold)
	;; (set-face-attribute 'default nil :font "Cascadia Code 10"
			    ;; :weight 'demibold)
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
			  charset
			  (font-spec :family "LXGW WenKai Mono" :font 14
				     :weight 'normal)))
	;; (set-face-attribute 'default nil :font "FiraCode 10")
	;;(set-face-attribute 'default nil :font "文泉驿正黑 10")

	(set-face-attribute 'font-lock-comment-face nil :slant
		    'italic :weight 'light)
	;; (set-face-attribute 'font-lock-keyword-face nil :weight 'light
		    ;; :slant 'italic :underline t)
	;; (set-face-attribute 'font-lock-string-face nil :weight 'regular
		    ;; :slant 'italic)
	(set-face-attribute 'font-lock-variable-name-face nil
		    :weight 'demibold :background "#372E40")
	(set-face-attribute 'border nil :weight 'black)
	(set-face-attribute 'mode-line nil :height 250)
	)
  
  )


(provide 'ui-rdp-wsl)

;;; ui-rdp-wsl.el ends here
