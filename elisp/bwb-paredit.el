;;; Configure `paredit-mode'.

;;;###autoload
(progn
  (autoload 'enable-paredit-mode "paredit")
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode))
