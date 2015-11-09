;;; Configure `python-mode'.

;;;###autoload
(defun bwb-python-setup ()
  (add-to-list 'company-backends 'company-jedi))

;;;###autoload
(defun bwb-python-set-virtualenv (new-venv)
  (interactive "DSet VIRTUAL_ENV: ")
  (setq old-venv (getenv "VIRTUAL_ENV"))
  (setenv "VIRTUAL_ENV" new-venv)
  (message "VIRTUAL_ENV was %s, now %s" old-venv new-venv))

;;;###autoload
(add-hook 'python-mode-hook 'bwb-python-setup)
