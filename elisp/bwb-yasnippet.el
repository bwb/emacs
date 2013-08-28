;;; Configure `yasnippet'.

;;;###autoload
(progn
;;   (require 'yasnippet)
;;   (yas--initialize)
;;   (setq yas/root-directory
;;         (list (concat user-emacs-directory "snippets")
;;               (car (file-expand-wildcards
;;                     (concat user-emacs-directory "elpa/yasnippet*/snippets")))))
;;   (mapc 'yas/load-directory yas/root-directory)
  ;; (add-to-list 'ac-sources 'ac-complete-yasnippet)
  (require 'yasnippet)
  (yas-global-mode 1))
