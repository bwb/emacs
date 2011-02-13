;;; Configure `rnc-mode'.
(require 'rnc-mode)

(add-to-list 'auto-mode-alist '("\\.rnc$" . rnc-mode))
(add-hook 'rnc-mode-hook
          (lambda ()
            (setq rnc-indent-level 2)))

(defun bwb-rnc-trang-current-buffer (buffer lang)
  "Run trang on BUFFER (default `current-buffer').
Takes a LANG: \"xsd\", \"dtd\", or \"both\" (default \"XSD\").
Writes a FILENAME (default s/.rnc$/.FORMAT/ on name of BUFFER)."
  ;; Consider: `current-buffer', `mark-whole-buffer', `save-excursion'.
  ;; Use multiple input arguments to interactive.
  (interactive
   (list (read-buffer "Run Trang on buffer: " (current-buffer))
         (ido-completing-read "schema language: " '("XSD" "DTD" "BOTH") nil t)))
  ;; TODO run Trang.
  (message "Trang %s %s" buffer lang))
	    
(define-key rnc-mode-map (kbd "C-c C-c") 'bwb-rnc-trang-current-buffer)	    

(provide 'bwb-rnc)
