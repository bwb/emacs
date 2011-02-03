;;; Configure `python-mode'.
(require 'bwb)

(add-hook 'python-mode-hook
          'bwb-80-column-warning)
(add-hook 'python-mode-hook
          (lambda ()
            (setq fill-column 78)))
(add-hook 'inferior-python-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

;;; FIXME
;;; virtualenv, virtualenvwrapper integration
;;
;; Based on tecnniques used by David Reid, Jesse Legg, and Doug
;; Hellmann.
;;
;; More elaborate techniques failed.  This will have to do for now.
;; run-python seems to work, but python-shell (via C-c C-c) seems to
;; doesn't respond to changes in python-command (until the source
;; buffer is closed).
;;
;; FIXME python-toggle-shells isn't working.  Explicitly setting
;; python-command.
;(defun bwb-virtualenv-postactivate (virtualenv)
;  (setq python-python-command (concat virtualenv "/bin/python"))
;  ;; (python-toggle-shells 'cpython)
;  (setq python-command python-python-command)
;  )
;(defun bwb-virtualenv-postdeactivate ()
;  (setq python-python-command "python")
;  ;; (python-toggle-shells 'cpython)
;  (setq python-command python-python-command)
;  )
;; Don't forget to add these
;; ~/.virtualenvs/postactivate:
;;   emacsclient -e "(bwb-virtualenv-postactivate \"$VIRTUAL_ENV\")" > /dev/null
;; ~/.virtualenvs/postdeactivate:
;;   emacsclient -e "(bwb-virtualenv-postdeactivate)" > /dev/null
;; FIXME kludge until virtualenvwrapper works with aliased "rm -i" command
;(setq python-python-command "/home/bbarry/.virtualenvs/bw3/bin/python")
;(setq python-command "/home/bbarry/.virtualenvs/bw3/bin/python")

(provide 'bwb-python)
