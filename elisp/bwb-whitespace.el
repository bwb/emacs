;;; Configure `whitespace-mode'

;;;###autoload
(progn
  (require 'whitespace)
  (setq whitespace-line-column 80)
  (setq whitespace-style
        '(face trailing space-before-tab space-after-tab lines-tail))
  (setq whitespace-global-modes
        '(not calendar-mode
              dired-mode
              inferior-python-mode
              term-mode))
  (global-whitespace-mode))
