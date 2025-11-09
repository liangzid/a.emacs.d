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

    (set-face-attribute 'default nil
			    :font "JetbrainsMono 17"
			    :weight 'normal
			    ;; :foreground "#A9F16C"
			    ;; :foreground "#badc58"
			    )
        (set-face-attribute 'font-lock-comment-face nil
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

    (setq doom-modeline-height 50)

  (set-face-attribute 'mode-line nil
		      :font "Maple Mono 12"
		      :font "18"
		    :weight 'normal
		    :slant 'italic)
	)
  
  )

(defun enable-75%-scale-big()
  (interactive)
  ;; first show larger texts
  (progn
    ;; (set-face-attribute
    ;;  'default nil :font
    ;;  (nth
    ;;   (random (length font-ls))
    ;;   font-ls)
    ;;  :weight 'normal)

    (set-face-attribute 'default nil :font "Iosevka 13"
			;; :weight 'normal
			:foreground "#96a0aa"
			)
    (set-face-attribute 'font-lock-comment-face nil
		    ;; :slant 'italic
		    ;; :font "DejaVu Sans Mono 15"
		    ;; :weight 'normal
		    :foreground "#96a0aa"
		    )
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
			charset
			(font-spec :family "LXGW WenKai Mono" :font 13
				   ;; :weight 'normal
				   )))

    (setq doom-modeline-height 20)
	)
  )


(provide 'ui-rdp-wsl)

;;; ui-rdp-wsl.el ends here
