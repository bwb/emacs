;;; Configure `yasnippet'.

;;;###autoload
(progn
  (require 'yasnippet)
  (yas/initialize)
  (setq yas/root-directory
        (list (concat user-emacs-directory "snippets")
              (concat user-emacs-directory "vendor/yasnippet/snippets")))
  (mapc 'yas/load-directory yas/root-directory)
  (add-to-list 'ac-sources 'ac-complete-yasnippet))
