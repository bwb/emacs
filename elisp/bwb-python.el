;;; Configure `python-mode'.

;;; TODO sort out `python-environment', `jedi', and toggling the major
;;; version.

;;;###autoload
;; (defun bwb-python-setup ()
;;   (setenv "VIRTUAL_ENV" "/Users/brbarry/py3.3")
;;   (setq jedi:server-command
;;         (list "/Users/brbarry/py3.3/bin/python3" jedi:server-script))
;;   (setq jedi:complete-on-dot t
;;         jedi:get-in-function-call-delay 100))

;;;###autoload
(add-hook 'python-mode-hook 'jedi:setup)
