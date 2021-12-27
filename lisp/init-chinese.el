;; -*- coding: utf-8; lexical-binding: t; -*-

 ;; load IME when needed, less memory footprint
(my/install-package-if-not-found 'pyim)
(my/install-package-if-not-found 'posframe)
(my/install-package-if-not-found 'pyim-basedict)
(my/install-package-if-not-found 'rime)

(require 'use-package)

(use-package rime
  :init
  (setq rime-posframe-properties
	(list :background-color "#333333"
            :foreground-color "#dcdccc"
            :internal-border-width 10))
  (setq default-input-method "rime"
	rime-show-candidate 'posframe)
  :custom
  (default-input-method "rime"))



(add-hook 'emacs-startup-hook
	  (lambda () (pyim-restart-1 t)))

(setq pyim-dicts
      '((:name "bigdict" :file "~/.emacs.d/imdict/pyim-bigdict.pyim")
      '(:name "aidict" :file "~/.emacs.d/imdict/ai.pyim")
      '(:name "progdict" :file "~/.emacs.d/imdict/prog.pyim"))
      )


;; {{ make IME compatible with evil-mode
(defun evil-toggle-input-method ()
  "When input method is on, goto `evil-insert-state'."
  (interactive)


  ;; some guys don't use evil-mode at all
  (cond
   ((and (boundp 'evil-mode) evil-mode)
    ;; evil-mode
    (cond
     ((eq evil-state 'insert)
      (toggle-input-method))
     (t
      (evil-insert-state)
      (unless current-input-method
        (toggle-input-method))))
    (cond
     (current-input-method
      ;; evil-escape and pyim may conflict
      ;; @see https://github.com/redguardtoo/emacs.d/issues/629
      (evil-escape-mode -1)
      (message "拼音已经打开!"))
     (t
      (evil-escape-mode 1)
      (message "拼音已经关闭!"))))
   (t
    ;; NOT evil-mode
    (toggle-input-method))))

(defun my-evil-insert-state-hack (orig-func &rest args)
  "Notify user IME status."
  (apply orig-func args)
  (if current-input-method (message "拼音已经打开!")))
(advice-add 'evil-insert-state :around #'my-evil-insert-state-hack)

;; (global-set-key (kbd "M-\\") 'evil-toggle-input-method)

(global-set-key (kbd "M-\\") 'toggle-input-method)

;; (global-set-key (kbd "S") 'toggle-input-method)




;; }}

;; {{ pyim
(defvar my-pyim-directory "~/.emacs.d/imdict"
  "The directory containing pyim dictionaries.")

(defvar my-pyim-enable-wubi-dict nil
  "Use Pinyin dictionary for Pyim IME.")

(with-eval-after-load 'pyim
  ;; use western punctuation
  (setq pyim-punctuation-dict nil)

  (setq default-input-method "pyim")
  (setq pyim-default-scheme "pyim-shuangpin")
  
  (cond
   ;; (my-pyim-enable-wubi-dict
   ;;  ;; load wubi dictionary
   ;;  (let* ((dir (file-name-directory
   ;;               (locate-library "pyim-wbdict.el")))
   ;;         (file (concat dir "pyim-wbdict-v98.pyim")))
   ;;    (when (and (file-exists-p file) (featurep 'pyim))
   ;;      (setq pyim-dicts
   ;;            (list (list :name "wbdict-v98-elpa" :file file :elpa t))))))
   (t
    ;; (setq pyim-fuzzy-pinyin-alist
    ;;       '(("en" "eng")
    ;;         ("in" "ing")))

    ;;  pyim-bigdict is recommended (20M). There are many useless words in pyim-greatdict which also slows
    ;;  down pyim performance
    ;; `curl -L http://tumashu.github.io/pyim-bigdict/pyim-bigdict.pyim.gz | zcat > ~/.eim/pyim-bigdict.pyim`

    ;; don's use shortcode2word
    (setq pyim-enable-shortcode nil)

    ;; use memory efficient pyim engine for pinyin ime
    (setq pyim-dcache-backend 'pyim-dregcache)

    ;; automatically load pinyin dictionaries "*.pyim" under "~/.eim/"
    (let* ((files (and (file-exists-p my-pyim-directory)
                       (directory-files-recursively my-pyim-directory "\\.pyim$")))
           disable-basedict)
      (when (and files (> (length files) 0))
        (setq pyim-dicts
              (mapcar (lambda (f)
                        (list :name (file-name-base f) :file f))
                      files))
        ;; disable "basedict" if "pyim-bigdict" or "pyim-greatdict" or "pyim-another-dict" is used
        (dolist (f files)
          (when (or (string= "pyim-another-dict" (file-name-base f))
                    (string= "pyim-bigdict" (file-name-base f))
                    (string= "pyim-greatdict" (file-name-base f)))
            (setq disable-basedict t))))
      (unless disable-basedict (pyim-basedict-enable)))))

  (setq pyim-indicator-list (list #'pyim-indicator-with-cursor-color #'pyim-indicator-with-modeline))
  (setq pyim-page-length 15)
  ;; don't use tooltip
  (setq pyim-use-tooltip 'posframe)
  ;; (setq pyim-use-tooltip 'popup)
  )
;; }}



(provide 'init-chinese)

