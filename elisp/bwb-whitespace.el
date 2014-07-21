;;; Configure `whitespace-mode'

;;;###autoload
(progn
  (require 'whitespace)
  (setq whitespace-style
        '(face trailing space-before-tab space-after-tab tabs))
  (setq whitespace-global-modes
        '(not calendar-mode
              dired-mode
              go-mode
              inferior-python-mode
              markdown-mode
              term-mode))
  (global-whitespace-mode))
