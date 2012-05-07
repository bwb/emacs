;;; Configure `python-mode'.
;;
;; TODO improve auto-completion.
;; TODO use TAGS and/or imenu regularly.
;; TODO restore pep8 and pylint checks.
;; TODO investigate buffer-local values of `python-command' when using
;; `python-shell' (C-c C-c in a `python-mode' buffer).
;; TODO Write many more snippets.

;;;###autoload
(add-hook 'python-mode-hook 'bwb-hack-mode-hook)

;;;###autoload
(defun bwb-python-update-command (command)
  "Set `python-command' to `command'.
The next shell command to run a Python interpreter will use
`command'."
  (require 'python)
  (setq python-python-command command
        python-command python-python-command
        ;; Broken by Emacs 24
        ))

;;; ~/.virtualenvs/postdeactivate:
;;; emacsclient -e "(bwb-python-virtualenv-postdeactivate)" > /dev/null
;;;###autoload
(defun bwb-python-virtualenv-postactivate (virtualenv)
  "Set `python-command' to use the newly activated virtualenv."
  (bwb-python-update-command (concat virtualenv "/bin/python")))

;;; ~/.virtualenvs/postdeactivate:
;;; emacsclient -e "(bwb-python-virtualenv-postdeactivate)" > /dev/null
;;;###autoload
(defun bwb-python-virtualenv-postdeactivate ()
  "Set `python-command' to use the default python command."
  (bwb-python-update-command "python"))
