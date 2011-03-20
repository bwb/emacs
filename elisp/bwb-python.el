;;; Configure `python-mode'.
(require 'bwb)
(require 'python)

(add-hook 'python-mode-hook
          (lambda ()
            (setq fill-column 78)
            (bwb-80-column-warning)))
(add-hook 'inferior-python-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

;; Use virtualenvs.  Based on tecnniques used by David Reid, Jesse
;; Legg, and Doug Hellmann.
;;
;; TODO investigate buffer-local values of `python-command' when using
;; `python-shell' (C-c C-c in a `python-mode' buffer).
;;
;; Use virtualenv hooks and emacsclient to call these functions.
;; ~/.virtualenvs/postactivate:
;;   emacsclient \
;;       -e "(bwb-python-virtualenv-postactivate \"$VIRTUAL_ENV\")" > /dev/null
;; ~/.virtualenvs/postdeactivate:
;;   emacsclient \
;;       -e "(bwb-python-virtualenv-postdeactivate)" > /dev/null
(defun bwb-python-update-command (command)
  "Set `python-command' to `command'.
The next shell command to run a Python interpreter will use
`command'."
  (setq python-python-command command)
  (setq python-command python-python-command)
  (python-toggle-shells 'cpython))

(defun bwb-python-virtualenv-postactivate (virtualenv)
  "Set `python-command' to use the newly activated virtualenv."
  (bwb-python-update-command (concat virtualenv "/bin/python")))

(defun bwb-python-virtualenv-postdeactivate ()
  "Set `python-command' to use the default python command."
  (bwb-python-update-command "python"))

(provide 'bwb-python)
