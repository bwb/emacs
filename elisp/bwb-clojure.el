;;; Configure `clojure-mode'.

;;;###autoload
(progn
  (add-hook 'clojure-mode-hook 'bwb-hack-mode-hook)
  (defun bwb-clojure-save-buffers ()
    (save-some-buffers t (lambda () (equal major-mode 'clojure-mode))))
  (defadvice clojure-test-run-test (before bwb-clojure-test-run-test-advice)
    "Always save `clojure-mode' buffers before running a test."
    (bwb-clojure-save-buffers))
  (defadvice clojure-test-run-tests (before bwb-clojure-test-run-tests-advice)
    "Always save `clojure-mode' buffers before running tests."
    (bwb-clojure-save-buffers)))
