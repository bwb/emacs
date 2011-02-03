;;; Configure "on-the" `flymake-mode'.
(require 'flymake)

(add-hook 'c-mode-hook 'flymake-find-file-hook)
(add-hook 'c++-mode-hook 'flymake-find-file-hook)

;; From Dave Love on gnu.emacs.help
(defun my-flymake-show-help ()
   (when (get-char-property (point) 'flymake-overlay)
     (let ((help (get-char-property (point) 'help-echo)))
       (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)

(provide 'bwb-flymake)
