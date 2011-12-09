;;; Configure `python-mode'.
;;
;; TODO use emacswiki.org instructions to add Python 2.7.x info docs.
;; TODO improve auto-completion.
;; TODO use TAGS and/or imenu regularly.
;; TODO restore pep8 and pylint checks.
;; TODO run commands in PROJECT/fabfile.py
;; TODO investigate buffer-local values of `python-command' when using
;; `python-shell' (C-c C-c in a `python-mode' buffer).

;;; Use virtualenvs.  Based on tecnniques used by David Reid, Jesse
;;; Legg, and Doug Hellmann.
;;;
;;; Use virtualenv hooks and emacsclient to call these functions.
;;; ~/.virtualenvs/postactivate:
;;;   emacsclient \
;;;       -e "(bwb-python-virtualenv-postactivate \"$VIRTUAL_ENV\")" > /dev/null
;;; ~/.virtualenvs/postdeactivate:
;;;   emacsclient \
;;;       -e "(bwb-python-virtualenv-postdeactivate)" > /dev/null

;;;###autoload
(add-hook 'python-mode-hook 'bwb-hack-mode-hook)

;;;###autoload
(defun bwb-python-update-command (command)
  "Set `python-command' to `command'.
The next shell command to run a Python interpreter will use
`command'."
  (require 'python)
  (setq python-python-command command)
  (setq python-command python-python-command)
  (python-toggle-shells 'cpython))

;;;###autoload
(defun bwb-python-virtualenv-postactivate (virtualenv)
  "Set `python-command' to use the newly activated virtualenv."
  (bwb-python-update-command (concat virtualenv "/bin/python")))

;;;###autoload
(defun bwb-python-virtualenv-postdeactivate ()
  "Set `python-command' to use the default python command."
  (bwb-python-update-command "python"))
