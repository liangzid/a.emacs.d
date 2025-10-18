;; modeline configuration

(my/install-package-if-not-found 'doom-modeline)
(my/install-package-if-not-found 'nerd-icons)
(if (and *is-gui* (not (equal ":0" *is-gui*)))
    (progn
    (require 'nerd-icons)
    ;; (doom-modeline-time-icon)
    )
  ) 

(require 'doom-modeline)
(doom-modeline-mode 1)

(setq doom-modeline-height 50)
(setq doom-modeline-bar-width 1)
(setq doom-modeline-hud nil)
(setq doom-modeline-time-live-icon nil)
(setq doom-modeline-time t)
(setq doom-modeline-modal-icon nil)
(setq doom-modeline-modal nil)

(setq doom-modeline-buffer-name nil)
(setq doom-modeline-buffer-state-icon nil)
(setq doom-modeline-env-enable-python nil)
(setq doom-modeline-env-python-executable nil)
(setq doom-modeline-buffer-encoding nil)
(setq doom-modeline- nil)

(with-eval-after-load 'doom-modeline
  (set-face-attribute 'mode-line nil
		      :font "Maple Mono 12"
		      :font "18"
		    :weight 'normal
		    :slant 'italic)
  )

;; show time at modeline
(setq display-time-mode t)
(display-time)

(setq-default header-line-format
	      (list
    ;; buffer name
    "[%b] <%f> Just One Last Dance"

    ;; ;; buffer file encoding
    ;; '(:eval (let ((sys (coding-system-plist buffer-file-coding-system)))
    ;;           (if (memq (plist-get sys :category)
    ;;                     '(coding-category-undecided coding-category-utf-8))
    ;;               "utf"
    ;;             (upcase (symbol-name (plist-get sys :name))))))

    ;; is this buffer read-only?
    ;; '(:eval (and buffer-read-only
    ;;              (propertize "R" 'face nil 'help-echo "Buffer is read-only")))
    ;; " "

	       ))

;; (setq-default mode-line-format
;;   (list
;;     ;; the buffer name
;;    "%b"
;;     ;; line and column
;;     ;; '%02' to set to 2 chars at least; prevents flickering
;;     "(%02l,%01c)"
;;     "["
;;     "%m" ; major mode name
;;     "]["
;;     ;; buffer file encoding
;;     '(:eval (let ((sys (coding-system-plist buffer-file-coding-system)))
;;               (if (memq (plist-get sys :category)
;;                         '(coding-category-undecided coding-category-utf-8))
;;                   "UTF-8"
;;                 (upcase (symbol-name (plist-get sys :name))))))
;;     "]["
;;     ;; insert vs overwrite mode
;;     '(:eval (propertize (if overwrite-mode "O" "I")
;;               'face nil
;;               'help-echo (concat "Buffer is in "
;; 				 (if overwrite-mode "overwrite" "insert") " mode")))
    
;;     ;; was this buffer modified since the last save?
;;     '(:eval (and (buffer-modified-p)
;;                  (propertize "M"
;;                              'face nil
;;                              'help-echo "Buffer has been modified")))

;;     ;; is this buffer read-only?
;;     '(:eval (and buffer-read-only
;;                  (propertize "R" 'face nil 'help-echo "Buffer is read-only")))
;;     "] "

;;     ;; `global-mode-string' is useufl because `org-timer-set-timer' uses it
;;     "%M"

;;     ;; '(:eval my-extra-mode-line-info)

;;     ;; how percentage
;;     "(" "%p" ")"
;;     ;; " %-" ;; fill with '-'
;;     ))

(provide 'init-modeline)
