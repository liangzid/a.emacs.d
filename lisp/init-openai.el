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

(my/install-package-if-not-found 'gptai)

(message "not ready to use.")

;; (setq gptai-model "<MODEL-HERE>") 
(setq gptai-username "KindMan")
(setq gptai-api-key (getenv "OPENAI_KEY"))

;; set keybindings optionally
(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c o") 'gptai-send-query)

(gptai-turbo-query)



(provide 'init-openai)
;;; init-openai.el ends here
