;;; Configure `python-mode'.

;;;###autoload
(progn
  (setq jedi:complete-on-dot t
        jedi:get-in-function-call-delay 100)
  (add-hook 'python-mode-hook 'jedi:setup))
