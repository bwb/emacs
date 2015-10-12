;;; Configure `cider'.

;;;###autoload
(progn
  (require 'cider)
  (add-hook 'cider-repl-mode-hook 'paredit-mode))
