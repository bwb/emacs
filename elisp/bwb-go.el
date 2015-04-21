;;; Configure `go-mode'.
;;; http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/

;;;###autoload
(defun bwb-go-end-of-line-newline-and-indent ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

;;;###autoload
(defun bwb-go-insert-expanded-braces ()
  (interactive)
  (end-of-line)
  (insert " {}")
  (backward-char)
  (newline-and-indent))

;;;###autoload
(defun bwb-go-insert-colon-equals ()
  (interactive)
  (insert " := ")
  (indent-according-to-mode))

;;;###autoload
(defun bwb-go-insert-channel-operator ()
  (interactive)
  (insert " <- ")
  (indent-according-to-mode))

;;;###autoload
(defun bwb-go-bind-keys ()
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-<return>") 'bwb-go-end-of-line-newline-and-indent)
  (local-set-key (kbd "C-S-<return>") 'bwb-go-insert-expanded-braces)
  (local-set-key (kbd "C-'") 'bwb-go-insert-colon-equals)
  (local-set-key (kbd "C-,") 'bwb-go-insert-channel-operator)
  (local-set-key (kbd "C-<") 'bwb-go-insert-channel-operator))

;;;###autoload
(defun bwb-go-env-from (gocmd)
  "Set GOROOT and GOTOOLDIR to the values given by \"GOCMD env VAR\"."
  (interactive "sgo command: ")
  (let ((goroot (shell-command-to-string (concat gocmd " env GOROOT")))
        (gotooldir (shell-command-to-string (concat gocmd " env GOTOOLDIR"))))
    (setenv "GOROOT" (bwb-strip-trailing-newlines goroot))
    (setenv "GOTOOLDIR" (bwb-strip-trailing-newlines gotooldir))))

(defun bwb-go-company-backends ()
  (set (make-local-variable 'company-backends) '(company-go)))

;;;###autoload
(defun bwb-go-conf ()
  (bwb-go-bind-keys)
  (bwb-go-company-backends)
  (go-eldoc-setup))

;;;###autoload
(progn
  (add-hook 'go-mode-hook 'bwb-go-conf)
  (add-hook 'before-save-hook 'gofmt-before-save))
