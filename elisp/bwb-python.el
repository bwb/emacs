;;; Configure `python-mode'.

;;;###autoload
(progn
  (setq jedi:complete-on-dot t)
  (add-hook 'python-mode-hook 'jedi:setup))
