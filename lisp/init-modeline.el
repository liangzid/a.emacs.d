;; modeline configuration


(setq-default mode-line-format
  (list
    ;; the buffer name
   "%b"
    ;; line and column
    ;; '%02' to set to 2 chars at least; prevents flickering
    "(%02l,%01c)"
    "["
    "%m" ; major mode name
    "]["
    ;; buffer file encoding
    '(:eval (let ((sys (coding-system-plist buffer-file-coding-system)))
              (if (memq (plist-get sys :category)
                        '(coding-category-undecided coding-category-utf-8))
                  "UTF-8"
                (upcase (symbol-name (plist-get sys :name))))))
    "]["
    ;; insert vs overwrite mode
    '(:eval (propertize (if overwrite-mode "O" "I")
              'face nil
              'help-echo (concat "Buffer is in "
				 (if overwrite-mode "overwrite" "insert") " mode")))
    
    ;; was this buffer modified since the last save?
    '(:eval (and (buffer-modified-p)
                 (propertize "M"
                             'face nil
                             'help-echo "Buffer has been modified")))

    ;; is this buffer read-only?
    '(:eval (and buffer-read-only
                 (propertize "R" 'face nil 'help-echo "Buffer is read-only")))
    "] "

    ;; `global-mode-string' is useufl because `org-timer-set-timer' uses it
    "%M"

    ;; '(:eval my-extra-mode-line-info)

    ;; how percentage
    "(" "%p" ")"
    ;; " %-" ;; fill with '-'
    ))

(provide 'init-modeline)
