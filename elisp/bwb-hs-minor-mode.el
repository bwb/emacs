;;; Configure `hs-minor-mode'.
(require 'hideshow)

;; "C-c @" is the Prefix Command?  Really?  Regardless, there's
;; probably a better way to do this.  Maybe define another prefix
;; command?
(define-key hs-minor-mode-map (kbd "C-c C-h C-h") 'hs-toggle-hiding)
(define-key hs-minor-mode-map (kbd "C-c C-h h") 'hs-hide-block)
(define-key hs-minor-mode-map (kbd "C-c C-h l") 'hs-hide-level)
(define-key hs-minor-mode-map (kbd "C-c C-h H") 'hs-hide-all)
(define-key hs-minor-mode-map (kbd "C-c C-h s") 'hs-show-block)
(define-key hs-minor-mode-map (kbd "C-c C-h S") 'hs-show-all)

(provide 'bwb-hs-minor-mode)
