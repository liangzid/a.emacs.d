;;; ORG-TODO-RELATED --- 
;;
;; Author: Zi Liang <frost.liang@polyu.edu.hk>
;; Copyright © 2023, ZiLiang, all rights reserved.
;; Created: 17 November 2023
;;
;;; Commentary:
;;
;;  
;;
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      org - agenda
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(my/install-package-if-not-found 'org-pomodoro)
(my/install-package-if-not-found 'org-alert)

(setq org-todo-keywords
      '((sequence "TODO(t)"
		  "INPROGRESS(i)"
		  "WAITING(w)"
		  "REVIEW(r)"
		  "|"
		  "DONE(d)"
		  "CANCELED(c)")))

(setq-default org-enforce-todo-dependencies t)

(add-to-list
 'org-agenda-custom-commands
 '("w" "THIS WEEK"
   ((agenda ""
            ((org-agenda-overriding-header
              (concat "THIS WEEK (W" (format-time-string "%V") ")")))))))

(add-to-list
 'org-agenda-custom-commands
 '("d" "DAY'S AGENDA"
   ((agenda ""
            ((org-agenda-overriding-header
              (concat "TODAY (W" (format-time-string "%V") ")"))
             (org-agenda-span 'day)
             (org-agenda-sorting-strategy
              '((agenda time-up priority-down category-keep)))
             (org-agenda-show-log t)
             (org-agenda-log-mode-items '(clock)))))))



(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight "bold")
        ("INPROGRESS" :foreground "blue" :weight "bold")
        ("WAITING" . "purple")
        ("REVIEW" . "orange")
        ("DONE" . "forest green")
        ("CANCELED" .  "green")))

;;; org agenda
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "<f12>") 'org-agenda)

(setq org-agenda-files '("~/orgtodo/*.org"
			 "~/orgtodo/extracting_developers_data.org"
			 "~/orgtodo/2025-A.org"
			 ))


;; 设置 Org Agenda 的显示选项
(setq org-agenda-prefix-format
      '((agenda . " %i %-12:c%?-12t% s")
        (timeline . "  % s")
        (todo . " %i %-12:c")
        (tags . " %i %-12:c")
        (search . " %i %-12:c")))


;; 在 Org Agenda 视图中显示所有的 TODO 关键字
(setq org-agenda-todo-ignore-scheduled 'future)

;; 配置 Org Agenda 编程语言
(setq org-agenda-dim-blocked-tasks 'invisible)

;; 在 Org Agenda 视图中启用日程安排
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-timegrid-use-ampm t) ;; use 9:PM not 21:00

;; 设置 Org Agenda 时钟
(setq org-agenda-clockreport-parameter-plist
      '(:link t :maxlevel 3))

;; 启用 Org Agenda 动态块
(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "X" 'org-agenda-exit)))

;; 设置 Org Agenda 模块
(setq org-agenda-modules
      '(org-agenda-breadcrumbs
        org-agenda-current-time-string
        org-agenda-date-today
        org-agenda-date-weekend
        org-agenda-later
        org-agenda-restriction-lock
        org-agenda-compact-blocks
        org-agenda-undo
        org-agenda-clockreport-mode))

;; 自定义 Org Agenda 颜色
(setq org-agenda-deadline-faces
      '((1.0 . org-warning)
        (0.5 . org-upcoming-deadline)
        (0.0 . org-upcoming-distant-deadline)))

;; 设置 Org Agenda 时钟表
(setq org-agenda-tag-filter-preset
      '("-ignore"))

;; 启用 Org Agenda 缓存以提高性能
(setq org-agenda-use-tag-inheritance nil)
(setq org-agenda-inhibit-startup t)
(setq org-agenda-use-time-grid nil)

;; 配置 Org Agenda 文件搜索路径
(setq org-agenda-text-search-extra-files
      (quote (agenda-archives)))

;; 配置 Org Agenda 日程表 HTML 导出
(setq org-agenda-exporter-settings
      '((ps-number-of-columns 2)
        (ps-landscape-mode t)
        (org-agenda-add-entry-text-maxlines 5)
        (htmlize-output-type 'css)
        (htmlize-html-major-mode 'org-mode)
        (htmlize-css-name-prefix "org-")))

;; 启用 Org Agenda 超链接
(setq org-agenda-start-with-clockreport-mode nil)
(setq org-agenda-start-with-log-mode nil)

;; 在 Org Agenda 视图中启用顶级标签
(setq org-agenda-top-headlines nil)
(setq org-agenda-tags-todo-honor-ignore-options t)
(setq org-agenda-span 'week)

;; 在 Org Agenda 视图中启用优先级
(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-agenda-todo-ignore-deadlines 'far)
(setq org-agenda-todo-ignore-timestamp 'past)

;; 设置 Org Agenda 视图标题
(setq org-agenda-block-separator "")
(setq org-agenda-include-diary nil)
(setq org-agenda-show-inherited-tags nil)
(setq org-agenda-show-log t)

;; 在 Org Agenda 视图中启用标签
(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-agenda-todo-ignore-deadlines 'near)

;; 启用 Org Agenda 自动保存文件
(setq org-agenda-repeating-timestamp-show-all nil)

;; ;; 自定义 Org Agenda 颜色
;; (setq org-agenda-done-keywords '("DONE" "CANCELLED"))
;; (setq org-agenda-todo-keywords '("TODO" "WAIT" "LATER" "SOMEDAY" "|"
;;                                 "DONE" "CANCELLED"))

;; 在 Org Agenda 视图中启用日程表
(setq org-agenda-include-deadlines t)

;; 在 Org Agenda 视图中启用 Org 弹性块
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)


(setq org-deadline-warning-days 1)

(setq org-agenda-sticky t)
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-window-setup 'current-window-configuration)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 安装和加载 org-alert 插件
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-alert
  :ensure t
  :config
  (setq alert-default-style 'libnotify) ; 使用 libnotify 作为默认通知方式

  ;; 启用 org-alert
  (org-alert-enable)

  ;; 设置 Org 事件提醒的默认提前通知时间
  (setq org-alert-default-style 'alert) ; 使用 alert 作为默认提前通知方式
  (setq org-alert-notification-title "Org Alert")

  ;; 在 Org Agenda 视图中启用提醒
  (add-hook 'org-agenda-finalize-hook
            (lambda ()
              (org-agenda-to-appt)
              (org-alert-manage-appt)))

  )

;; 在 Org 事件创建时设置提醒
(defun org-alert-notify-task ()
  (interactive)
  (org-alert-notify
   (concat "任务: " (org-entry-get (point) "ITEM"))
   (concat "提醒: " (org-entry-get (point) "ALERT"))
   (concat "截止时间: " (org-entry-get (point) "DEADLINE"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 安装和加载 org-pomodoro 插件
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-pomodoro
  :ensure t
  :config
  ;; 设置番茄工作法时钟周期
  (setq org-pomodoro-length 25) ; 25 分钟的工作时间
  (setq org-pomodoro-short-break-length 5) ; 5 分钟的短休息
  (setq org-pomodoro-long-break-length 15) ; 15 分钟的长休息

  ;; 启用声音提醒
  (setq org-pomodoro-play-sounds t)

  ;; 自定义声音文件的路径（可选）
  ;; (setq org-pomodoro-sound-player "/usr/bin/mpg123")

  ;; 在完成番茄时自动开始短休息
  (add-hook 'org-pomodoro-finished-hook
            (lambda ()
              (org-pomodoro-start :short-break)))

  ;; 在完成短休息时自动开始新的番茄
  (add-hook 'org-pomodoro-short-break-finished-hook
            (lambda ()
              (org-pomodoro-start)))

  ;; 自定义状态变化的回调函数
  (setq org-pomodoro-start-sound-p t) ; 启用开始番茄时的声音提醒
  (setq org-pomodoro-tick-finished-sound-p t) ; 启用番茄结束时的声音提醒
  (setq org-pomodoro-killed-sound-p t) ; 启用取消番茄时的声音提醒

  ;; 设置番茄工作法时钟显示样式
  (setq org-pomodoro-format "Pomodoro: %s"))

;; 设置快捷键
(global-set-key (kbd "C-c p") 'org-pomodoro)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-capture configs
(setq org-capture-templates
      '(("t" "任务" entry (file "~/org/tasks.org")
         "* TODO %? \n  :PROPERTIES:\n  :DEADLINE: %^{提醒时间}t\n  :ALERT: %^{提醒方式}\n  :END:\n  %i\n  %a")
        ("n" "笔记" entry (file+headline "~/orgtodo/capture/notes.org" "笔记")
         "* %? \n  %i\n  %a")
        ("m" "信息" entry (file+headline "~/orgtodo/capture/misc.org" "杂项")
         "* %^{标题} %^T \n  %i\n  %a")))

(global-set-key (kbd "C-c c") 'org-capture)



(provide 'org-todo-related)
