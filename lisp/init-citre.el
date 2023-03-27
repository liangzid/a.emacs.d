;;; INIT-CITRE --- this file is for automatically completion and references.
;;
;; Author: Zi Liang <liangzid@stu.xjtu.edu.cn>
;; Copyright © 2022, ZiLiang, all rights reserved.
;; Created: 21 January 2022
;;
;;; Commentary:
;;
;;  nothing.
;;
;;; Code:

(my/install-package-if-not-found 'citre)

(add-hook 'find-file-hook #'citre-auto-enable-citre-mode)

(use-package citre
  :defer t
  :init
  ;; This is needed in `:init' block for lazy load to work.
  (require 'citre-config)
  ;; Bind your frequently used commands.  Alternatively, you can define them
  ;; in `citre-mode-map' so you can only use them when `citre-mode' is enabled.
  (global-set-key (kbd "C-x c j") 'citre-jump)
  (global-set-key (kbd "C-x c J") 'citre-jump-back)
  (global-set-key (kbd "C-x c p") 'citre-ace-peek)
  (global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)
  :config

  (setq
   ;; Set these if readtags/ctags is not in your path.
   
   ;; citre-readtags-program "/home/liangzi/software/ctags/bin/readtags"
   ;; citre-ctags-program "/home/liangzi/software/ctags/bin/ctags"

   ;; citre-readtags-program "/usr/local/bin/readtags"
   ;; citre-ctags-program "/usr/local/bin/ctags"

   ;; ;; Set this if you use project management plugin like projectile.  It's
   ;; ;; used for things like displaying paths relatively, see its docstring.
   ;; citre-project-root-function #'projectile-project-root

   ;; ;; Set this if you want to always use one location to create a tags file.
   ;; citre-default-create-tags-file-location 'global-cache

   ;; See the "Create tags file" section above to know these options
   citre-use-project-root-when-creating-tags t
   citre-prompt-language-for-ctags-command t
   ;; By default, when you open any file, and a tags file can be found for it,
   ;; `citre-mode' is automatically enabled.  If you only want this to work for
   ;; certain modes (like `prog-mode'), set it like this.
   citre-auto-enable-citre-mode-modes '(prog-mode)))

(provide 'init-citre)

;;; init-citre.el ends here
