;;; Configure JavaScript and JSON modes.

;;;###autoload
(progn
  (with-eval-after-load "js-mode"
    (setq js-indent-level 2))
  (with-eval-after-load "json-mode"
    (setq
     js-indent-level 2
     json-reformat:indent-width 2)))
