;;; Configure "Interactively Do Things" mode.
;;
;; This site offers good advice:
;; http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/

;;;###autoload
(progn
  (ido-mode t)
  (ido-ubiquitous t)
  (setq ido-enable-flex-matching t
        ido-everywhere t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-use-virtual-buffers t))
