;;; Brandon Barry's elisp library.

(require 'ispell)
(require 'thingatpt)

;;; Add named functions, rather than lambda functions, to hooks.

(defun bwb-activate-auto-fill-mode ()
  (auto-fill-mode))

(defun bwb-activate-flyspell-mode ()
  (flyspell-mode))

(defun bwb-activate-hl-line-mode ()
  (hl-line-mode t))

(defun bwb-activate-idle-highlight-mode ()
  (idle-highlight-mode))

(defun bwb-activate-save-place-mode ()
  (require 'saveplace)
  (setq save-place t))

;;; TODO use prog-mode-hook instead?
;;; Use `hack-mode-hook' to customize programming modes in general.

(add-hook 'hack-mode-hook 'bwb-activate-hl-line-mode)
(add-hook 'hack-mode-hook 'bwb-activate-idle-highlight-mode)
(add-hook 'hack-mode-hook 'bwb-activate-save-place-mode)

(defun bwb-hack-mode-hook ()
  (run-hooks 'hack-mode-hook))

(defun bwb-indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun bwb-untabify-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun bwb-reformat-buffer ()
  (interactive)
  (bwb-indent-buffer)
  (bwb-untabify-buffer)
  (delete-trailing-whitespace))

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

(defun bwb-prev-window ()
  "Use `other-window' to select the previous window in the cycle."
  (interactive)
  (other-window -1))

(defun bwb-regen-autoloads (autoload-file dir &optional force)
  "Use the Emacs Starter Kit's technique for (re)generating the
`generated-autoload-file'."
  (when (or force
            (not (file-exists-p autoload-file))
            (some (lambda (f) (file-newer-than-file-p f autoload-file))
                  (directory-files dir t "\\.el$")))
    (message "Updating autoloads...")
    (let ((generated-autoload-file autoload-file))
      (update-directory-autoloads dir))))

(defun bwb-toggle-fullscreen ()
  "Switch in and out of fullscreen (e.g. when running Max OS X).
http://groups.google.com/group/carbon-emacs/browse_thread/thread/1945355952b13c5d"
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))

(global-set-key (kbd "C-x O") 'bwb-prev-window)
(global-set-key (kbd "C-c *") 'bwb-earmuff-symbol)
(global-set-key (kbd "C-c r") 'bwb-reformat-buffer)

(provide 'bwb)
