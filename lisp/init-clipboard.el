;; to enable xclip from system, you should install xsel in following commands:
;; sudo apt install xsel

(setq x-select-enable-clipboard t)

;; ;; only used in linux system.
;; (if *is-linux*
;;     (when (getenv "DISPLAY")
;;       (defun xsel-cut-function (text &optional push)
;; 	(with-temp-buffer
;; 	 (insert text)
;; 	 (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))

;;       (defun xsel-paste-function ()
;; 	(let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
;; 	  (unless (string= (car kill-ring) xsel-output)
;; 	    xsel-output)))

;;       ;; attach callbacks to hookds
;;       (setq interprogram-cut-function 'xsel-cut-function)
;;       (setq interprogram-paste-function 'xsel-paste-function)
;;       ))


(provide 'init-clipboard)
