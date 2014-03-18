;;; Configure `dired' and related functions.

;;; Functions from Tassilo Horn (maybe `dired-single' can do this?)
;;;###autoload
(defun th-dired-up-directory ()
  "Display the parent directory in this dired buffer."
  (interactive)
  (find-alternate-file ".."))
;;;###autoload
(defun th-dired-find-file ()
  "Find directories using this dired buffer; use a new buffer for files."
  (interactive)
  (if (file-directory-p (dired-get-file-for-visit))
      (dired-find-alternate-file)
    (dired-find-file)))

;;;###autoload
(progn
  (require 'dired-x)
  (require 'find-dired)
  ;; Omit dotfiles when in `dired-omit-mode'.  Use M-o to toggle
  ;; `dired-omit-mode'
  (setq dired-omit-files "^\\..*")
  (define-key dired-mode-map (kbd "^") 'th-dired-up-directory)
  ;; Hides `dired-tree-up'.
  (define-key dired-mode-map (kbd "C-M-u") 'th-dired-up-directory)
  (define-key dired-mode-map (kbd "RET") 'th-dired-find-file)
  ;; http://www.masteringemacs.org/articles/2011/03/25/working-multiple-files-dired/
  (setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld")))
