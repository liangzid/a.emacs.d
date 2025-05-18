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

(my/install-package-if-not-found 'aidermacs)

(use-package aidermacs
  :bind (("C-c a" . aidermacs-transient-menu))
  :config
  ; Set API_KEY in .bashrc, that will automatically picked up by aider or in elisp
  ; defun my-get-openrouter-api-key yourself elsewhere for security reasons
  :custom
  ; See the Configuration section below
  (aidermacs-use-architect-mode nil)
  (aidermacs-default-model "deepseek")
  (aidermacs-architect-model "deepseek/deepseek-reasoner")
  ;; Optional: Set specific model for code generation
  (aidermacs-editor-model "deepseek/deepseek-chat")
  ;; default to nil
  (aidermacs-weak-model "deepseek/deepseek-chat")
  ;; Use vterm backend (default is comint)
  (aidermacs-backend 'vterm)
  ;; Enable file watching
  (aidermacs-watch-files t)
  ;; Enable/disable showing diffs after changes (default: t)
  (setq aidermacs-show-diff-after-change t)
  )


(provide 'init-openai)
;;; init-openai.el ends here
