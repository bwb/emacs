;;; Configure `dired' and related functions.

;;;###autoload
(progn
  (require 'dired-x)
  (require 'find-dired)
  (require 'tassilo-horn)
  ;; Omit dotfiles when in `dired-omit-mode'.  Use M-o to toggle
  ;; `dired-omit-mode'
  (setq dired-omit-files "^\\..*")
  (define-key dired-mode-map (kbd "^") 'th-dired-up-directory)
  (define-key dired-mode-map (kbd "RET") 'th-dired-find-file)
  ;; http://www.masteringemacs.org/articles/2011/03/25/working-multiple-files-dired/
  (setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld")))
