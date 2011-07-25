;;; Brandon Barry's elisp library.

(require 'ispell)
(require 'thingatpt)

(defun bwb-init-mac-os-x ()
  "Tune Emacs for Mac OS X."
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (global-set-key [(meta return)] 'ns-toggle-fullscreen)
  (add-to-list 'default-frame-alist '(font . "Inconsolata-14"))
  (add-to-list 'exec-path "/usr/local/bin")
  (setq
   browse-url-generic-program "open"
   mac-command-modifier 'meta)
  ;; http://cocoaspell.leuski.net/
  ;; http://www.emacswiki.org/emacs/CocoAspell
  (add-to-list 'ispell-dictionary-alist
        '("english"
          "[A-Za-z]"
          "[^A-Za-z]"
          "'"
          nil
          ("-B" "-d" "english" "--dict-dir"
           "/Library/Application Support/cocoAspell/aspell6-en-6.0-0")
          nil iso-8859-1))
  (setq ispell-program-name "aspell"
        ispell-dictionary "english")
  (setenv "PATH" (concat (getenv "PATH") ":" (getenv "HOME") "/bin")))

(defun bwb-init-linux ()
  "Tune Emacs for Linux.
Fix copy and paste: http://www.emacswiki.org/emacs/CopyAndPaste
Use .XResources:
  Emacs.font: Inconsolata-12
  Emacs.menuBar: off
  Emacs.toolBar: off
  Emacs.verticalScrollBars: off"
  (global-set-key (kbd "C-x x x") 'clipboard-kill-region)
  (global-set-key (kbd "C-x x c") 'clipboard-kill-ring-save)
  (global-set-key (kbd "C-x x v") 'clipboard-yank)
  (setq
   browse-url-generic-program (getenv "BROWSER")
   inhibit-splash-screen t))

(defun bwb-toggle-fullscreen ()
  "Switch in and out of fullscreen (e.g. when running Max OS X).
http://groups.google.com/group/carbon-emacs/browse_thread/thread/1945355952b13c5d"
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))

;; From http://emacs-fu.blogspot.com/2008/12/highlighting-lines-that-are-too-long.html
;; TODO use whitespace-mode instead.
(defun bwb-80-column-warning ()
  "Highlight lines that are too long.
http://emacs-fu.blogspot.com/2008/12/highlighting-lines-that-are-too-long.html"
  (font-lock-add-keywords
   nil
   '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t))))

(defun bwb-earmuff-symbol ()
  "Insert earmuffs at `point' or wrap `symbol-at-point' with earmuffs.
SYMBOL becomes *SYMBOL*, with point after the right *.  Otherwise
** is inserted, with point in the middle."
  (interactive)
  (if (symbol-at-point)
      (progn
        (beginning-of-thing 'symbol)
        (insert "*")
        (forward-thing 'symbol)
        (insert "*"))
    (progn
      (insert "**")
      (backward-char))))

(defun bwb-prev-window ()
  "Use `other-window' to select the previous window in the cycle."
  (interactive)
  (other-window -1))

(defun bwb-transpose-windows ()
  "TODO implement.

Use http://www.emacswiki.org/emacs/TransposeWindows as a
starting point.  If less than two windows exist do nothing.  If
exactly two windows exist transpose them.  Otherwise present a
Fmenu of swaps to choose from.  For example:

    swap with
    ==== ====
[1] Foo  bar
[2] fOo  baz
[3] Bar  baz
")

(global-set-key (kbd "C-x O") 'bwb-prev-window)
(global-set-key (kbd "C-c *") 'bwb-earmuff-symbol)

(provide 'bwb)
