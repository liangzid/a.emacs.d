;;; INIT-OPENAI --- 
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 16 四月 2023
;;
;;; Commentary:
;;
;;  For OpenAI related API operations.
;;
;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(use-package aider
  :straight (:host github :repo "tninja/aider.el" :files ("aider.el"))
  :config
  ;; Use claude-3-5-sonnet cause it is best in aider benchmark 

  ;; (setq aider-args '("--model"
  ;; 		     "anthropic/claude-3-5-sonnet-20241022"))
  ;; (setenv "ANTHROPIC_API_KEY" anthropic-api-key)

  ;; Or use chatgpt model since it is most well known
  ;; (setq aider-args '("--model" "gpt-4o-mini"))
  (setq aider-args '("--deepseek -no-auto-commits"))

  ;; Or use gemini v2 model since it is very good and free
  ;; (setq aider-args '("--model" "gemini/gemini-exp-1206"))
  ;; (setenv "GEMINI_API_KEY" <your-gemini-api-key>)
  ;; ;; Optional: Set a key binding for the transient menu
  (global-set-key (kbd "C-c A") 'aider-transient-menu)
  )


(provide 'init-openai)
;;; init-openai.el ends here
