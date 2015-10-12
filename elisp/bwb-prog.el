;;; Configure `prog-mode'.

;;;###autoload
(defun bwb-prog-hl-line ()
  (require 'hl-line)
  (set-face-background hl-line-face "alice blue"))

;;;###autoload
(defun bwb-prog-reformat-buffer ()
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max)))

;;;###autoload
(defun bwb-prog-saveplace ()
  (require 'saveplace)
  (setq save-place-file (concat user-emacs-directory "saved-places")
        save-place t))

;;;###autoload
(defun bwb-prog-conf ()
  (bwb-prog-hl-line)
  (bwb-prog-saveplace)
  (eldoc-mode)
  (electric-pair-mode)
  (hl-line-mode)
  (paredit-everywhere-mode)
  (rainbow-delimiters-mode)
  (local-set-key (kbd "C-M-o") 'bwb-prog-reformat-buffer))

;;;###autoload
(add-hook 'prog-mode-hook 'bwb-prog-conf)
