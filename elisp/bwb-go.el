;;; Configure `go-mode'.
;;; http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/
;;;
;;; TODO update Emacs' environment using "go env" in current project.
;;; TODO push and pop godef-jump locations.

;;;###autoload
(defun bwb-go-bind-keys ()
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports))

;;;###autoload
(progn
  (require 'go-mode-load)
  (require 'go-autocomplete)
  (add-hook 'go-mode-hook 'bwb-go-bind-keys)
  (add-hook 'before-save-hook 'gofmt-before-save))
