;;; Configure "on-the" `flymake-mode'.

;; From Dave Love on gnu.emacs.help
;;
;; (defun bwb-flymake-show-help ()
;;   (require 'flymake)
;;    (when (get-char-property (point) 'flymake-overlay)
;;      (let ((help (get-char-property (point) 'help-echo)))
;;        (if help (message "%s" help)))))

;; (eval-after-load 'flymake
;;  (add-hook 'post-command-hook 'bwb-flymake-show-help))
