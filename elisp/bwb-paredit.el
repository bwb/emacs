;;; Configure `paredit-mode'.

;;;###autoload
(defun bwb-paredit-enable ()
  (paredit-mode t))

;;;###autoload
(progn
  (add-hook 'clojure-mode-hook 'bwb-paredit-enable)
  (add-hook 'emacs-lisp-mode-hook 'bwb-paredit-enable))
