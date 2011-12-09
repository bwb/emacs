;;; Configure `clojure-mode'.

;;;###autoload
(add-hook 'clojure-mode-hook 'bwb-hack-mode-hook)

;;;###autoload
(defun bwb-clojure-save-buffers ()
  (save-some-buffers t (lambda () (equal major-mode 'clojure-mode))))

;;;###autoload
(eval-after-load 'clojure-mode
  (defadvice clojure-test-run-tests (before bwb-clojure-test-run-tests-advice)
    "Always save `clojure-mode' buffers before running tests."
    (bwb-clojure-save-buffers)))
