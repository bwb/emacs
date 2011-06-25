;;;; Configure "without man" (WoMan) to view manual pages.

(require 'woman)

;; Work around issues with launchd and MANPATH
(add-to-list 'woman-manpath "/usr/local/git/share/man")

(provide 'bwb-woman)
