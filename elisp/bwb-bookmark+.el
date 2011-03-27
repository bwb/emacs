;;; Configure the `bookmark' enhancement `bookmark+'.
(require 'bookmark+)

(setq bookmark-default-file "~/emacs/bookmark/main.bmk")
(global-set-key (kbd "C-x m") 'bookmark-map)
;; TODO Add to `bmkp-default-handler-associations'

(provide 'bwb-bookmark+)
