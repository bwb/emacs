;;; Configure `python-mode'.

;;;###autoload
(defun bwb-python-setup ()
  ;; https://github.com/tkf/emacs-jedi/issues/120
  (set (make-local-variable 'ac-max-width) 0.5)
  (setq jedi:complete-on-dot t
        jedi:get-in-function-call-delay 100))

;;;###autoload
(defun bwb-set-virtualenv (new-venv)
  (interactive "DSet VIRTUAL_ENV: ")
  (setq old-venv (getenv "VIRTUAL_ENV"))
  (setenv "VIRTUAL_ENV" new-venv)
  (message "VIRTUAL_ENV was %s, now %s" old-venv new-venv))

;;;###autoload
(progn
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'bwb-python-setup))
