;;; Brandon Barry's elisp library.

(require 'ispell)
(require 'thingatpt)

;;; Add named functions, rather than lambda functions, to hooks.

(defun bwb-activate-hl-line-mode ()
  (hl-line-mode t))

(defun bwb-activate-save-place-mode ()
  (require 'saveplace)
  (setq save-place-file (concat user-emacs-directory "saved-places"))
  (setq save-place t))

;;; Use `prog-mode-hook' to customize programming modes in general.
(add-hook 'prog-mode-hook 'bwb-activate-hl-line-mode)
(add-hook 'prog-mode-hook 'bwb-activate-save-place-mode)

(defun bwb-indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun bwb-untabify-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun bwb-reformat-buffer ()
  (interactive)
  (delete-trailing-whitespace)
  (bwb-untabify-buffer)
  (bwb-indent-buffer))

(defun bwb-earmuff-symbol ()
  "Insert earmuffs at `point' or wrap `symbol-at-point' with earmuffs.
SYMBOL becomes *SYMBOL*, with point after the right *.  Otherwise
** is inserted, with point in the middle."
  (interactive)
  (if (symbol-at-point)
      (progn
        (beginning-of-thing 'symbol)
        (insert "*")
        (forward-thing 'symbol)
        (insert "*"))
    (progn
      (insert "**")
      (backward-char))))

(defun bwb-prev-window ()
  "Use `other-window' to select the previous window in the cycle."
  (interactive)
  (other-window -1))

(defun bwb-regen-autoloads (autoload-file dir &optional force)
  "Use the Emacs Starter Kit's technique for (re)generating the
`generated-autoload-file'."
  (when (or force
            (not (file-exists-p autoload-file))
            (some (lambda (f) (file-newer-than-file-p f autoload-file))
                  (directory-files dir t "\\.el$")))
    (message "Updating autoloads...")
    (let ((generated-autoload-file autoload-file))
      (update-directory-autoloads dir))))

;;; Bind keys

(global-set-key (kbd "C-x O") 'bwb-prev-window)
(global-set-key (kbd "C-c *") 'bwb-earmuff-symbol)
(global-set-key (kbd "C-c r") 'bwb-reformat-buffer)

;;; Conditional configuration

(defun bwb-init-linux ()
  "Tune Emacs for Linux."
  (setq
   browse-url-generic-program (getenv "BROWSER")))

(defun bwb-fix-mac-os-x-env ()
  (require 'exec-path-from-shell)
  (add-to-list 'exec-path-from-shell-variables "VIRTUAL_ENV")
  (add-to-list 'exec-path-from-shell-variables "GOPATH")
  (exec-path-from-shell-initialize))

(defun bwb-init-mac-os-x ()
  "Tune Emacs for Mac OS X."
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (add-to-list 'default-frame-alist '(font . "Inconsolata-14"))
  (setq
   mac-command-modifier 'meta
   browse-url-generic-program "open"
   ispell-program-name "aspell")
  (bwb-fix-mac-os-x-env))

(defun bwb-init-work ()
  "Tune Emacs for work (personal workstation)")

(defun bwb-init-bos-mpndw ()
  "Tune Emacs for bos-mpndw (business notebook)")

(defun bwb-strip-trailing-newlines (s)
  "Remove the trailing newlines (if any) from string s."
  (replace-regexp-in-string (rx (one-or-more "\n") line-end) "" s))

(provide 'bwb)
