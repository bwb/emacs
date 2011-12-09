;;; Configure "without man" (WoMan) to view manual pages.

;; Work around issues with launchd and MANPATH
;;;###autoload
(progn
  (require 'woman)
  (add-to-list 'woman-manpath "/usr/local/git/share/man"))
