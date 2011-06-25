;;;; Configure `dired-x'.

(require 'dired-x)

;; Omit dotfiles when in `dired-omit-mode'.  Use M-o to toggle
;; `dired-omit-mode'
(setq dired-omit-files "^\\..*")

(provide 'bwb-dired-x)
