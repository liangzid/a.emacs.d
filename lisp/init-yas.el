(my/install-package-if-not-found 'yasnippet)
(my/install-package-if-not-found 'autoinsert)

;; config for yasnippet.
(setq yas-snippet-dirs              ;;设置模板存放的地址.
      '("~/.emacs.d/snippets/"))
(yas-global-mode 1)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'text-mode-hook 'yas-minor-mode)

;; definiting my auto init file for initilization files
(defun lz/autoinsert-yas-expand()
  "Replace text in yasnippet template."
  (message "loading expand for buffer")
  (evil-insert 1)
  ;; (message (concat "loading expand for buffer" (buffer-string)))
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))

;;
(require 'use-package)
(use-package autoinsert
  :init
  (setq auto-insert-query nil)
  (setq auto-inset-directory (locate-user-emacs-file "auto-insert"))
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode 1)

  :config
  (define-auto-insert "\\.el$"
    [
     (expand-file-name "~/.emacs.d/auto-insert/default-el.el")
     lz/autoinsert-yas-expand])
  (define-auto-insert "\\.sh$"
    [ (expand-file-name "~/.emacs.d/auto-insert/default-sh.sh") lz/autoinsert-yas-expand])
  (define-auto-insert "\\.html$"
    [
     (expand-file-name "~/.emacs.d/auto-insert/default-html.html") lz/autoinsert-yas-expand])
  (define-auto-insert "\\.py$" [(expand-file-name "~/.emacs.d/auto-insert/default-py.py") lz/autoinsert-yas-expand])
  (define-auto-insert "\\.org$" [(expand-file-name "~/.emacs.d/auto-insert/default-org.org") lz/autoinsert-yas-expand])
  (define-auto-insert "\\.txt$" ["~/.emacs.d/auto-insert/default-txt.txt" lz/autoinsert-yas-expand])
  ;; (define-auto-insert "\\.py$" ["default-py.py" lz/autoinsert-yas-expand])
  )


(provide 'init-yas)



