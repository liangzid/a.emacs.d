(my/install-package-if-not-found 'evil)
(my/install-package-if-not-found 'evil-escape)
(my/install-package-if-not-found 'undo-fu)
(my/install-package-if-not-found 'evil-surround)
(my/install-package-if-not-found 'evil-visualstar)
(my/install-package-if-not-found 'evil-leader)

;; 开启evil 模式
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; Move back the cursor one position when exiting insert mode
(setq evil-move-cursor-back t)

;; (setq evil-default-state 'emacs)

;; ----------------------EVIL ESCAPE MODE---------------------------------
;; {{ https://github.com/syl20bnr/evil-escape
(setq-default evil-escape-delay 0.3)
(setq evil-escape-excluded-major-modes '(dired-mode))
(setq-default evil-escape-key-sequence "kj")
;; disable evil-escape when input method is on
(evil-escape-mode 1)
;; }}
;; ------------------------------------------------------------------------


;; -------------------EVIL style undo-redo---------------------------------
;; {{ replace undo-tree with undo-fu
;; @see https://github.com/emacs-evil/evil/issues/1074
;; copied from doom-emacs
;; 这一部分不需要看，只使用下面的撤销与反撤销按键就好了
(define-minor-mode undo-fu-mode
  "Enables `undo-fu' for the current session."
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map [remap undo] #'undo-fu-only-undo)
            (define-key map [remap redo] #'undo-fu-only-redo)
            ;; (define-key map (kbd "C-_")     #'undo-fu-only-undo)
            (define-key map (kbd "M-_")     #'undo-fu-only-redo)
            (define-key map (kbd "C-M-_")   #'undo-fu-only-redo-all)
            (define-key map (kbd "C-x r u") #'undo-fu-session-save)
            (define-key map (kbd "C-x r U") #'undo-fu-session-recover)
            map)
  :init-value nil
  :global t)
(undo-fu-mode 1)
(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map (kbd "C-r") 'undo-fu-only-redo)
;; }}

;; Store more undo history to prevent loss of data
(setq undo-limit 8000000
      undo-strong-limit 8000000
      undo-outer-limit 8000000)
;; -----------------------------------------------------------------------


;; ------------------------EVIL SURROUND----------------------------------

(use-package evil-surround
  :ensure t
  :config
  
  (defun evil-surround-prog-mode-hook-setup ()
    "Set up surround shortcuts."
    (cond
     ((memq major-mode '(sh-mode))
      (push '(?$ . ("$(" . ")")) evil-surround-pairs-alist))
     (t
      (push '(?$ . ("${" . "}")) evil-surround-pairs-alist)))

    (when (memq major-mode '(org-mode))
      (push '(?\[ . ("[[" . "]]")) evil-surround-pairs-alist) ; [
      (push '(?= . ("=" . "=")) evil-surround-pairs-alist))

    (when (memq major-mode '(emacs-lisp-mode))
      (push '(?\( . ("( " . ")")) evil-surround-pairs-alist)
      (push '(?` . ("`" . "'")) evil-surround-pairs-alist))

    ;; generic
    (push '(?/ . ("/" . "/")) evil-surround-pairs-alist))
  (add-hook 'prog-mode-hook 'evil-surround-prog-mode-hook-setup)
  (global-evil-surround-mode 1))

;; ---------------------------------------------------------------------

;; ----------------EVIL VISUALSTAR--------------------------------------
(global-evil-visualstar-mode)
;; ---------------------------------------------------------------------



;; ---------------evil leader key---------------------------------------
;; set evil key mode.
(require 'evil-leader)

;; ;; {{ use `,` as leader key
;; (general-create-definer my-comma-leader-def
;;   :prefix ","
;;   :states '(normal visual))


;; {{ Use `SPC` as leader key
;; all keywords arguments are still supported
(general-create-definer my-space-leader-def
  :prefix "SPC"
  :states '(normal visual))


;; (general-create-definer my-semicolon-leader-def
;;   :prefix ";"
;;   :states '(normal visual))

(defun save-and-exit ()
  (interactive)
  (save-buffer)
  (save-buffers-kill-terminal))

;; (defcustom my-new-gud-pdb-commad-name
;;   (if (executable-find "pdb") ("pdb python3 -m pdb " (buffer-file-name)))
;;   "Command that executes the Python debugger."
;;   :version "27.1"
;;   :type 'string
;;   :group 'gud)

(my-space-leader-def

 ;; manager for file and buffer.
 "xs" 'save-buffer
 "xf" 'find-file
 "xr" 'recentf-open-files
 "xb" 'switch-to-buffer
 "xk" 'kill-buffer
 "xc" 'save-buffers-kill-terminal
 "bb" (lambda () (interactive) (switch-to-buffer nil)) ;; switch to last buffer.
 "jj" 'scroll-other-window
 "kk" 'scroll-other-window-up
 "x0" 'delete-window
 "x1" 'delete-other-windows
 "x2" 'split-window-below
 "x3" 'split-window-right

 "hf" 'counsel-describe-function
 "hv" 'counsel-describe-variable
 "hk" 'describe-key
 "hm" 'describe-mode
 
 ;; code navigation.
 "sh" 'highlight-symbol
 "sr" 'highlight-symbol-query-replace
 "sn" 'highlight-symbol-nav-mode ;; 使用M-n,p进行上下导航
 
 "sy" 'wsl-copy-region-to-clipboard ;; 将wsl中emacs的选中区域复制到系统clipboard中 
 "sd" 'wsl-cut-region-to-clipboard ;; 同上，不过是剪切

 "si" 'my-yank-image-from-win-clipboard-through-powershell ;; image 级别的yank

 ;; shell relevant
 "sh" 'shell
 "sc" 'shell-command
 
 ;; "gd" 'evil-goto-definition
 "gd" 'xref-find-definitions-other-window

 ;; python debug
 "dd" 'pdb 
 "db" 'gud-break
 "dr" 'gud-remove
 "dc" 'gud-cont
 "dn" 'gud-next
 "ds" 'gud-step
 "di" 'gud-stepi
 "dp" 'gud-print
 "de" 'gud-finish

 ;; git relevant
 "gs" 'git-add-commit-push-lz ;; git synroize.


 
 ;; ssh connect
 "41" 'ssh-connect-41
 "42" 'ssh-connect-42
 "45" 'ssh-connect-45
 
 ;; manager for english query.
 "cy" 'youdao-dictionary
 "te" 'toggle-company-english-helper

 ;; manager for other frequency.
 "ac" 'ispell-buffer
 "fs" 'flyspell-mode

 ;; for orgmode application
 "ii" 'my-screen-capture
 "ih" 'fastinsert-org-head
 "ic" 'org-insert-src-block

 )

(evil-leader-mode 1)


;; ----------------color designment: 为了更加醒目-----------------------
;; {{ change mode-line color by evil state
(defconst my-default-color (cons (face-background 'mode-line)
                                 (face-foreground 'mode-line)))
(defun my-show-evil-state ()
  "Change mode line color to notify user evil current state."
  (let* ((color (cond ((minibufferp) my-default-color)
                      ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                      ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                      ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                      (t my-default-color))))
    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))

(add-hook 'post-command-hook #'my-show-evil-state)
;; }}
;; -----------------------------------------------------------------------



(provide 'init-evil)