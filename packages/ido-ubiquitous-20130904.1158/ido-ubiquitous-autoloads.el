;;; ido-ubiquitous-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ido-ubiquitous-restore-default-overrides ido-ubiquitous-function-overrides
;;;;;;  ido-ubiquitous-command-overrides ido-ubiquitous-enable-old-style-default
;;;;;;  ido-ubiquitous-fallback-completing-read-function ido-ubiquitous-mode
;;;;;;  ido-ubiquitous) "ido-ubiquitous" "ido-ubiquitous.el" (21031
;;;;;;  56721 0 0))
;;; Generated autoloads from ido-ubiquitous.el

(let ((loads (get 'ido-ubiquitous 'custom-loads))) (if (member '"ido-ubiquitous" loads) nil (put 'ido-ubiquitous 'custom-loads (cons '"ido-ubiquitous" loads))))

(defvar ido-ubiquitous-mode nil "\
Non-nil if Ido-Ubiquitous mode is enabled.
See the command `ido-ubiquitous-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ido-ubiquitous-mode'.")

(custom-autoload 'ido-ubiquitous-mode "ido-ubiquitous" nil)

(autoload 'ido-ubiquitous-mode "ido-ubiquitous" "\
Use `ido-completing-read' instead of `completing-read' almost everywhere.

  This mode has no effect unles `ido-mode' is also enabled.

  If this mode causes problems for a function, you can customize
  when ido completion is or is not used by customizing
  `ido-ubiquitous-command-overrides' or
  `ido-ubiquitous-function-overrides'.

\(fn &optional ARG)" t nil)

(defvar ido-ubiquitous-fallback-completing-read-function (if (eq completing-read-function 'completing-read-ido) 'completing-read-default completing-read-function) "\
Alternate completing-read function to use when ido is not wanted.

This will be used for functions that are incompatibile with ido
or if ido cannot handle the completion arguments.

If you turn off ido-ubiquitous mode, `completing-read-function'
will be set back to this.")

(custom-autoload 'ido-ubiquitous-fallback-completing-read-function "ido-ubiquitous" t)

(defvar ido-ubiquitous-enable-old-style-default t "\
Allow ido to emulate a quirk of `completing-read'.

From the `completing-read' docstring:

> If the input is null, `completing-read' returns DEF, or the
> first element of the list of default values, or an empty string
> if DEF is nil, regardless of the value of REQUIRE-MATCH.

If this variable is non-nil, then ido-ubiquitous will attempt to
emulate this behavior. Specifically, if RET is pressed
immediately upon entering completion, an empty string will be
returned instead of the first element in the list. This behavior
is only enabled when ido is being used as a substitute for
`completing-read', and not when it is used directly.

This odd behavior is required for compatibility with an old-style
usage pattern whereby the default was requested by returning an
empty string. In this mode, the caller receives the empty string
and handles the default case manually, while `completing-read'
never has any knowledge of the default. This is a problem for
ido, which always returns the first element in the list when the
input is empty. Without knowledge of the default, it cannot
ensure that the default is first on the list, so returning the
first item is not the correct behavior. Instead, it must return
an empty string like `completing-read'.

You can termporarily invert this behavior by prefixing \"RET\"
with \"C-u\".

If you want to enable old-style default selection selectively for
specific commands or functions, set appropriate overrides in
`ido-ubiquitous-command-overrides' or
`ido-ubiquitous-function-overrides'.")

(custom-autoload 'ido-ubiquitous-enable-old-style-default "ido-ubiquitous" t)

(defconst ido-ubiquitous-default-command-overrides '((disable exact "execute-extended-command") (enable prefix "wl-") (enable-old prefix "Info-") (enable exact "webjump")) "\
Default value of `ido-ubiquitous-command-overrides'.

You can restore these using the command `ido-ubiquitous-restore-default-overrides'.")

(defconst ido-ubiquitous-default-function-overrides '((disable exact "read-file-name") (disable exact "read-file-name-internal") (disable exact "read-buffer") (disable exact "gnus-emacs-completing-read") (disable exact "gnus-iswitchb-completing-read") (disable exact "man") (disable exact "grep-read-files") (enable exact "bookmark-completing-read") (enable-old exact "webjump-read-choice") (enable-old exact "webjump-read-url-choice") (disable exact "isearchp-read-unicode-char")) "\
Default value of `ido-ubiquitous-function-overrides'.

You can restore these using the command `ido-ubiquitous-restore-default-overrides'.")

(defvar ido-ubiquitous-command-overrides ido-ubiquitous-default-command-overrides "\
List of command override specifications for ido-ubiquitous

Each override specification describes how ido-ubiquitous should
behave one or many commands. A specification has the
form `(BEHAVIOR MATCH-TYPE MATCH-TEXT)'. BEHAVIOR is one of the
following:

  * `disable': ido-ubiquitous should not be used at all for the
    specified commands;
  * `enable': ido-ubiquitous may be used with the specified
    commands, without emulating the old-style default selection
    of `completing-read';
  * `enable-old': ido-ubiquitous may be used with the specified
    commands, and should emulate the old-style default selection
    of `completing-read'.

MATCH-TYPE affects how MATCH-TEXT is interpreted, as follows:

  * `exact': the specification only affects the one command
    whose name is MATCH-TEXT;
  * `prefix': the specification affects any command whose name
    starts with MATCH-TEXT (This is useful for specifying a
    certain behavior for an entire package);
  * `regexp': the specification affects any command whose name
    matches MATCH-TEXT (with MATCH-TEXT being interpreted as a
    regular expression)

MATCH-TEXT should be a string.

Since this variable's has a somewhat complex structure, it is
recommended that you set this variable through Customize.

Note that this variable only affects *commands*, which are
functions marked as interactive. See
`ido-ubiquitous-function-overrides' for how to modify the
behavior of ido-ubiquitous for arbitrary functions.

If you need to add a new specification to this list, please also
file a bug report at https://github.com/DarwinAwardWinner/ido-ubiquitous/issues")

(custom-autoload 'ido-ubiquitous-command-overrides "ido-ubiquitous" t)

(defvar ido-ubiquitous-function-overrides ido-ubiquitous-default-function-overrides "\
List of function override specifications for ido-ubiquitous

Function override specifications have a similar structure to
command override specifications (see
`ido-ubiquitous-command-overrides'). A function override
specification has the form `(BEHAVIOR MATCH-TYPE MATCH-TEXT)'.
However, `MATCH-TYPE' may ONLY be `exact'; No other match type is
supported.

If you need to add a new specification to this list, please also file a
bug report at https://github.com/DarwinAwardWinner/ido-ubiquitous/issues

Setting this variable directly has no effect. You must set it
through Customize.")

(custom-autoload 'ido-ubiquitous-function-overrides "ido-ubiquitous" nil)

(autoload 'ido-ubiquitous-restore-default-overrides "ido-ubiquitous" "\
Re-add the default overrides for ido-ubiquitous.

This will ensure that the default overrides are all present and
at the head of the list in `ido-ubiquitous-command-overrides' and
`ido-ubiquitous-function-overrides'. User-added overrides will
not be removed, but they may be masked if one of the default
overrides affects the same functions.

With a prefix arg, also save the above variables' new values for
future sessions.

\(fn &optional SAVE)" t nil)

;;;***

;;;### (autoloads nil nil ("ido-ubiquitous-pkg.el") (21031 56721
;;;;;;  837251 0))

;;;***

(provide 'ido-ubiquitous-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ido-ubiquitous-autoloads.el ends here
