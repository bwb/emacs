;;; Brandon Barry's Emacs.
;;
;; Thanks to all (direct and indirect) Emacs contributors.
;; If you're new to Emacs, start here:
;; http://www.gnu.org/software/emacs/tour/

;;; Layout

;; `~/emacs'
;; http://www.emacswiki.org/emacs/DotEmacsDotD
;;
;; Emacs doesn't need to hide from me.  Make the
;; `user-emacs-directory', `~/.emacs.d', a link to `~/emacs'.  Note
;; that some modes store files (e.g. caches, history) in the
;; `user-emacs-directory'.  Ignore them or customize their location.
;;
;; `~/emacs/init.el'
;; The init file (you are reading).  When text refers to `~/.emacs'
;; or just `.emacs', use this file instead.
;;
;; `~/emacs/backup'
;; http://www.emacswiki.org/emacs/BackupDirectory
;;
;; Store Emacs backup files in a single directory.  Otherwise you'll
;; someday find yourself running "find mumble '*~' mumble -delete".
;;
;; `~/emacs/elisp'
;; Brandon Barry's Emacs Lisp libraries (and related files) belong here.
;;
;; `~/emacs/vendor'
;; `~/emacs/vendor-git'
;; Emacs Lisp libraries (and related files) from third parties belong
;; here.  This includes libraries that are not part of GNU Emacs as well as
;; alternate versions of GNU Emacs libraries.
;;
;; `~/emacs/feature-fullscreen.patch'
;; Adds fullscreen support for Cocoa Emacs.
;;
;; `~/emacs/snippets'
;; Store custom YASnippet files.

;;; TODO

;; - Fix `multi-term' word boundaries, forward delete
;; - Add spell-checking with GNU aspell and `flyspell-mode' (which may
;;   break some modes, requiring extra work)
;; - Edit HTML 5.  An HTML 5 document, though parseable, need not be
;;   well-formed XML.  That rules out `nxml-mode'.  Also consider
;;   template syntax, CSS, and JavaScript.  Maybe `mumamo-mode'?
;; - Try `hippie-expand'
;; - Try Desktop, then finish del2pin.
;; - Continue incorporating ideas found in
;;   http://github.com/technomancy/emacs-starter-kit
;;     - imenu with ido completion and automatic rescan
;;     - byte compilation with byte-recompile-directory

;;; Load Path

(add-to-list 'load-path "~/emacs/elisp")
(add-to-list 'load-path "~/emacs/vendor")
(add-to-list 'load-path "~/emacs/vendor/bookmark+")
(add-to-list 'load-path "~/emacs/vendor/color-theme")
(add-to-list 'load-path "~/emacs/vendor/ess/lisp")
(add-to-list 'load-path "~/emacs/vendor/yasnippet")
;; Use the `vendor-git' subdirectory for Git submodules.
(add-to-list 'load-path "~/emacs/vendor-git/ac-slime")
(add-to-list 'load-path "~/emacs/vendor-git/auto-complete")
(add-to-list 'load-path "~/emacs/vendor-git/clojure-mode")
(add-to-list 'load-path "~/emacs/vendor-git/js2-mode")
(add-to-list 'load-path "~/emacs/vendor-git/smex")

;;; Mode-specific Configuration

;; Emacs will run for a long time once started.  Don't worry about
;; optimizing load time until it becomes a problem.  Keep
;; configuration details for each mode in a separate library.  Do not
;; rely on the order below.  Load the `bwb' library if necessary.
;;
;;   (require 'bwb) ; OK
;;   ...
;;   (provide 'bwb-MODE-FOO)
;;
;; Do not load one `bwb-MODE-LIBRARY' from another `bwb-MODE-LIBRARY'.
;; That way madness lies.  Use `eval-after-load' if necessary.
;;
;;   (require 'bwb-MODE-BAR) ; NO
;;   ...
;;   (provide 'bwb-MODE-FOO)

(require 'bwb)                  ; All `~/emacs' can use this
(require 'bwb-auto-complete)
;; (require 'bwb-bookmark)
(require 'bwb-bookmark+)        ; Enhanced bookmark list
(require 'bwb-buff-menu+)       ; Enhanced *Buffer List*
(require 'bwb-c)
(require 'bwb-chromium-browser) ; Run an edit server for Chromium
(require 'bwb-clojure)
;; Interacts poorly with several modes, including dired and multi-term
;; (require 'bwb-color-theme)
(require 'bwb-dired-x)          ; Extended directory "editing"
(require 'bwb-emacs-lisp)
;; Seems to load minor modes globally
;; (require 'bwb-erc)              ; IRC client
(require 'bwb-ess)              ; Emacs Speaks Statistics
(require 'bwb-find-dired)
(require 'bwb-flymake)          ; Check syntax on the fly
(require 'bwb-hippie-exp)
(require 'bwb-ido)              ; Interactively Do Things
(require 'bwb-js2)              ; Edit JavaScript
(require 'bwb-multi-term)
;;; FIXME problem with P4PORT
;;; FIXME C-x p prefix already used by bwb-prev-window
;; (require 'bwb-p4)               ; Perforce integration
(require 'bwb-paredit)          ; "Pseudostructural" Lisp code editing
(require 'bwb-perl)
(require 'bwb-python)
(require 'bwb-re-builder)
(require 'bwb-rnc)              ; Relax NG compact schema (`nxml-mode')
(require 'bwb-rst)              ; reStructuredText
(require 'bwb-sh)
(require 'bwb-show-paren)
(require 'bwb-slime)            ; The Superior Lisp Interaction Mode for Emacs
(require 'bwb-smex)             ; M-x enhancement
(require 'bwb-steve-yegge)
(require 'bwb-tassilo-horn)
(require 'bwb-woman)            ; Read manual pages without an external program
(require 'bwb-vc)               ; Interact with version control systems
(require 'bwb-yasnippet)        ; Expand abbreviations into text templates

;;; OS-specific Initialization

(cond
 ((string-match "darwin" system-configuration)
  (bwb-init-mac-os-x))
 ((string-match "linux" system-configuration)
  (bwb-init-linux))
 (t
  (message "unknown system - no system-specific settings applied")))

;;; Buffer Local Defaults

(setq-default
 indent-tabs-mode nil
 show-trailing-whitespace t)

;;; Global Variables

(setq
 backup-directory-alist '(("." . "~/emacs/backup")) ; *~ files go here
 ;; must set browse-url-generic-program in OS-specific setup
 browse-url-browser-function 'browse-url-generic
 column-number-mode t
 default-directory "~/"
 inhibit-startup-screen t
 require-final-newline "ask"
 transient-mark-mode t
 visible-bell 'top-bottom
 )

;;; Global Keybindings (some modes add their own)

;; Don't sleep Emacs accidentally.  Suggested by drhoades in a Hacker
;; News .emacs discussion
(global-set-key (kbd "C-z") nil)
;; Open the link at point in the url-generic-program.
(global-set-key (kbd "C-x ;") 'browse-url)

;;; Enable (default disabled) Commands

(put 'narrow-to-region 'disabled nil)

;;; Character Encoding

;; Prefer UTF-8.
(prefer-coding-system 'utf-8)

;;; Start Programs

;; Run an Emacs server.
(server-start)
;; Start a terminal.
(multi-term)
(save-excursion
  (set-buffer "*terminal<1>*")
  (rename-buffer "*terminal-main*" t))
;; Open the *Bookmark List*
;; (bookmark-bmenu-list)
;; (switch-to-buffer "*Bookmark List*")
