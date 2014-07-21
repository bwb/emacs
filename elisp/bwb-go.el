;;; Configure `go-mode'.
;;; http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/

;;;###autoload
(defun bwb-go-bind-keys ()
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports))

;;;###autoload
(progn
  (require 'go-autocomplete)
  (add-hook 'go-mode-hook 'bwb-go-bind-keys)
  (add-hook 'go-mode-hook 'electric-pair-mode)
  (add-hook 'before-save-hook 'gofmt-before-save))
