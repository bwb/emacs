;;; Configure `go-mode'.
;;; http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/

;;;###autoload
(defun bwb-go-end-of-line-newline-and-indent ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

;;;###autoload
(defun bwb-go-open-braces ()
  (interactive)
  (newline-and-indent)
  (previous-line)
  (end-of-line)
  (newline-and-indent))

;;;###autoload
(defun bwb-go-bind-keys ()
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-<return>") 'bwb-go-end-of-line-newline-and-indent)
  (local-set-key (kbd "C-S-<return>") 'bwb-go-open-braces))

;;;###autoload
(progn
  (require 'go-autocomplete)
  (add-hook 'go-mode-hook 'bwb-go-bind-keys)
  (add-hook 'go-mode-hook 'electric-pair-mode)
  (add-hook 'before-save-hook 'gofmt-before-save))
