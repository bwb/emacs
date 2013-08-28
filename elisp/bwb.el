;;; Brandon Barry's elisp library.

(require 'ispell)
(require 'thingatpt)

;;; Add named functions, rather than lambda functions, to hooks.

(defun bwb-activate-hl-line-mode ()
  (hl-line-mode t))

(defun bwb-activate-idle-highlight-mode ()
  (idle-highlight-mode))

(defun bwb-activate-save-place-mode ()
  (require 'saveplace)
  (setq save-place-file (concat user-emacs-directory "saved-places"))
  (setq save-place t))

;;; Use `prog-mode-hook' to customize programming modes in general.
(add-hook 'prog-mode-hook 'bwb-activate-hl-line-mode)
(add-hook 'prog-mode-hook 'bwb-activate-idle-highlight-mode)
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

(defun bwb-fix-mac-env ()
  (require 'exec-path-from-shell)
  (add-to-list 'exec-path-from-shell-variables "VIRTUAL_ENV")
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
  (bwb-fix-mac-env))

(defun bwb-init-linux ()
  "Tune Emacs for Linux.
Fix copy and paste: http://www.emacswiki.org/emacs/CopyAndPaste
Use .XResources:
  Emacs.font: Inconsolata-12
  Emacs.menuBar: off
  Emacs.toolBar: off
  Emacs.verticalScrollBars: off"
  (global-set-key (kbd "C-x x x") 'clipboard-kill-region)
  (global-set-key (kbd "C-x x c") 'clipboard-kill-ring-save)
  (global-set-key (kbd "C-x x v") 'clipboard-yank)
  (setq
   browse-url-generic-program (getenv "BROWSER")
   inhibit-splash-screen t))

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

;;; Functions from Tassilo Horn

(defun th-dired-up-directory ()
  "Display the parent directory in this dired buffer."
  (interactive)
  (find-alternate-file ".."))

(defun th-dired-find-file ()
  "Find directories using this dired buffer; use a new buffer for files."
  (interactive)
  (if (file-directory-p (dired-get-file-for-visit))
      (dired-find-alternate-file)
    (dired-find-file)))

;;; Bind keys

(global-set-key (kbd "C-x O") 'bwb-prev-window)
(global-set-key (kbd "C-c *") 'bwb-earmuff-symbol)
(global-set-key (kbd "C-c r") 'bwb-reformat-buffer)

(provide 'bwb)
