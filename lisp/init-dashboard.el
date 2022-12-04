;;; INIT-DASHBOARD --- Configue my dashboards
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2022, ZiLiang, all rights reserved.
;; Created:  9 五月 2022
;;
;;; Commentary:
;;
;;  Give me a start page.
;;
;;; Code:

(my/install-package-if-not-found 'dashboard)

(require 'dashboard)
(setq dashboard-center-content t)
(setq dashboard-banner-logo-title "好好学习，天天向上！")
;; (setq dashboard-init-info "Rule of Configing Emacs:\n 1. Don't config it when you just open emacs.\n 2. Don't config it when there are somethings waiting to do.\n 3. Don't config it when your fail with something.")
(setq dashboard-banner-logo-title "Rule of Configing Emacs:\n 1. Don't config it when you just open emacs.\n 2. Don't config it when there are somethings waiting to do.\n 3. Don't config it when your fail with something.")
;; (setq dashboard-startup-banner "/path/to/my/logo")
(setq dashboard-show-shortcuts t)

(setq dashboard-items '((recents  . 15)
                        (bookmarks . 5)
                        (projects . 5)
                        ;; (agenda . 5)
                        (registers . 5)))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

(setq dashboard-set-init-info t)



(setq dashboard-set-footer t)

(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
(provide 'init-dashboard)

;;; init-dashboard.el ends here
