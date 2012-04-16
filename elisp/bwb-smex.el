;;; Configure Smex, a "M-x enhancement for Emacs".

;;;###autoload
(progn
  (require 'smex)
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize)
  ;; Complete commands smexily.
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "C-x C-m") 'smex)
  (global-set-key (kbd "C-c C-m") 'smex)
  ;; Show "commands that are relevant to the active major mode".
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; Here's the old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  ;; Don't accidentally `compose-mail'.
  (global-set-key (kbd "C-x m") 'smex))
