;;;; Brandon Barry's Emacs.

;;; Thanks to all (direct and indirect) Emacs contributors.
;;; If you're new to Emacs, start here:
;;; http://www.gnu.org/software/emacs/tour/

;;;; Basic Layout

;;; `~/emacs'
;;; http://www.emacswiki.org/emacs/DotEmacsDotD
;;;
;;; Make the `user-emacs-directory', `~/.emacs.d', a link to
;;; `~/emacs'.  Note that some modes store files (e.g. caches,
;;; history) in the `user-emacs-directory'.  Ignore them or customize
;;; their location.

;;; `~/emacs/init.el'
;;; http://www.emacswiki.org/emacs/InitFile
;;;
;;; You are reading the init file.  When text refers to `~/.emacs' or
;;; just `.emacs', use this file instead.

;;; `~/emacs/elisp'
;;;
;;; First and second party Emacs Lisp libraries (and related files)
;;; belong here.

;;; `~/emacs/vendor'
;;; `~/emacs/vendor-git'
;;;
;;; Third party Emacs Lisp libraries (and related files) belong here.
;;; This includes libraries that are not part of GNU Emacs as well as
;;; alternate versions of GNU Emacs libraries.
;;;
;;; See https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial for
;;; submodule removal instructions.

;;; `~/emacs/auto-save-list'
;;;
;;; Emacs stores the files used to track auto-save files here.

;;; `~/emacs/backup'
;;; http://www.emacswiki.org/emacs/BackupDirectory
;;; http://www.emacswiki.org/emacs/AutoSave
;;;
;;; Store Emacs backup and auto-save files in a single directory.
;;; Otherwise you'll someday find yourself running "find mumble mumble
;;; -delete".  You should probably "chmod go=" this directory.

;;;; TODO

;;; Find a better way to update submodules to later commits.
;;;
;;; Consider using ELPA.
;;;
;;; Add more snippets.  Add `bwb-auto-complete-yasnippet' to more mode
;;; hooks.
;;;
;;; Fix `multi-term': missing word boundaries, broken forward-delete,
;;; broken C-DEL (see C-backspace), and the lack of support for Bash
;;; M-. and M-*.
;;;
;;; Work on `bwb'.
;;;
;;; Work on `bwb-js2-mode'.
;;;
;;; Work on `bwb-python-mode'.
;;;
;;; Add spell checking with `flyspell-mode' and `flyspell-prog-mode'
;;; where appropriate.
;;;
;;; Perform (periodic?) byte compilation with
;;; `byte-recompile-directory'.
;;;
;;; Enable `imenu' with `ido-completing-read' and automatic rescans.
;;;
;;; Finish `bwb-rnc-trang-current-buffer'.


;;;; Load Path

(add-to-list 'load-path "~/emacs/elisp")
(add-to-list 'load-path "~/emacs/vendor")
(add-to-list 'load-path "~/emacs/vendor/ess/lisp")
(add-to-list 'load-path "~/emacs/vendor/yasnippet")
;; Use the `vendor-git' subdirectory for Git submodules.
(add-to-list 'load-path "~/emacs/vendor-git/ac-slime")
(add-to-list 'load-path "~/emacs/vendor-git/auto-complete")
(add-to-list 'load-path "~/emacs/vendor-git/clojure-mode")
(add-to-list 'load-path "~/emacs/vendor-git/js2-mode")
(add-to-list 'load-path "~/emacs/vendor-git/markdown-mode")
(add-to-list 'load-path "~/emacs/vendor-git/smex")

;;;; Mode-specific Configuration

;;; Emacs will run for a long time once started.  Don't worry about
;;; optimizing load time until it becomes a problem.  Keep
;;; configuration details for each mode in a separate library.  Do not
;;; rely on the order below.  Load the `bwb' library if necessary.
;;;
;;;   (require 'bwb) ; OK
;;;   ...
;;;   (provide 'bwb-MODE-FOO)
;;;
;;; Do not load one `bwb-MODE-LIBRARY' from another
;;; `bwb-MODE-LIBRARY'.  That way madness lies.  Maybe use
;;; `eval-after-load', but only if necessary.
;;;
;;;   (require 'bwb-MODE-BAR) ; NO
;;;   ...
;;;   (provide 'bwb-MODE-FOO)

(require 'bwb)                  ; All files in `~/emacs/elisp' can use this
(require 'bwb-auto-complete)
(require 'bwb-bookmark)
(require 'bwb-buff-menu+)       ; Enhanced *Buffer List*
(require 'bwb-c)
(require 'bwb-clojure)
(require 'bwb-dired-x)          ; Extended directory "editing"
(require 'bwb-ediff)
(require 'bwb-emacs-lisp)
;; Seems to load minor modes globally
;; (require 'bwb-erc)              ; IRC client
(require 'bwb-ess)              ; Emacs Speaks Statistics
(require 'bwb-find-dired)
(require 'bwb-flymake)          ; Check syntax on the fly
(require 'bwb-ido)              ; Interactively Do Things
(require 'bwb-js2)              ; Edit JavaScript
(require 'bwb-markdown-mode)    ; Simpler than reStructuredText
(require 'bwb-multi-term)
;;; FIXME problem with P4PORT
;;(require 'bwb-p4)               ; Perforce integration
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

;;;; OS-specific Initialization

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

;;; Backup Files

(setq
 bwb-backup-directory "~/emacs/backup"
 auto-save-file-name-transforms `((".*" ,bwb-backup-directory t))
 backup-directory-alist `((".*" . ,bwb-backup-directory))
 tramp-auto-save-directory bwb-backup-directory)

;;; Miscellaneous Global Variables

(setq
 ;; must set browse-url-generic-program in OS-specific setup
 browse-url-browser-function 'browse-url-generic
 column-number-mode t
 default-directory "~/"
 inhibit-startup-screen t
 require-final-newline "ask"
 ;; Use C-<SPC> C-<SPC> to set the mark at point and enable transient
 ;; mark until the mark is deactivated.  Use C-u C-x C-x to activate
 ;; the mark and enable transient mark until the mark is next
 ;; deactivated.
 transient-mark-mode nil
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

(prefer-coding-system 'utf-8)

;;; Start Programs

;; Run an Emacs server.
(server-start)

;; Start a terminal.
(multi-term)
(save-excursion
  (set-buffer "*terminal<1>*")
  (rename-buffer "*terminal-main*" t))
