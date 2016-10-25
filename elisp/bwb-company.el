;;; Configure `company-mode'.

;;; TODO custom faces
;; (custom-set-faces
;;  '(company-preview
;;    ((t (:foreground "darkgray" :underline t))))
;;  '(company-preview-common
;;    ((t (:inherit company-preview))))
;;  '(company-tooltip
;;    ((t (:background "lightgray" :foreground "black"))))
;;  '(company-tooltip-selection
;;    ((t (:background "steelblue" :foreground "white"))))
;;  '(company-tooltip-common
;;    ((((type x)) (:inherit company-tooltip :weight bold))
;;     (t (:inherit company-tooltip))))
;;  '(company-tooltip-common-selection
;;    ((((type x)) (:inherit company-tooltip-selection :weight bold))
;;     (t (:inherit company-tooltip-selection)))))

;;;###autoload
(defun bwb-company-conf ()
  (with-eval-after-load 'company
    (company-flx-mode +1))
  (company-mode t)
  (local-set-key (kbd "M-SPC") 'company-complete)
  (setq company-tooltip-limit 20
        company-idle-delay nil))
;;;###autoload
(add-hook 'prog-mode-hook 'bwb-company-conf)
