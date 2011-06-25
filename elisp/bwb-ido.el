;;;; Configure "Interactively Do Things" mode.

;;; This site offers good advice:
;;; http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/

(require 'ido)

(setq
 ido-enable-flex-matching t
 ido-everywhere t
 ido-create-new-buffer 'always)
(ido-mode t)

(provide 'bwb-ido)
