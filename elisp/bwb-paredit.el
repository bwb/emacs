;;; Configure `paredit-mode' and `paredit-everywhere'.

;;;###autoload
(progn
  (autoload 'enable-paredit-mode "paredit")
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'scheme-mode-hook 'enable-paredit-mode)
  (add-hook 'prog-mode-hook 'paredit-everywhere-mode))
