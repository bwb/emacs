;;; Configure `go-mode'.
;;;###autoload

(progn
  (require 'go-mode-load)
  (require 'go-autocomplete)
  (add-hook 'before-save-hook 'gofmt-before-save))
