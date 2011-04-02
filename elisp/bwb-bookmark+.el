;;; Configure the `bookmark' enhancement `bookmark+'.
(require 'bookmark+)

(setq bookmark-default-file "~/emacs/bookmark/main.bmk"
      bookmark-save-flag 1)
(global-set-key (kbd "C-x m") 'bookmark-map)
;; TODO Add to `bmkp-default-handler-associations'

(provide 'bwb-bookmark+)
