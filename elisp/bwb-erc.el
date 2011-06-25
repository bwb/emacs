;;;; Configure the Emacs IRC client.

;;; 1. M-x erc
;;; 2. Input server
;;; 3. Input port
;;; 4. Choose nickname
;;; 5. Switch to server:port buffer if necessary
;;; /join #CHANNEL
;;; (refer to info docs for details)

(require 'erc)

(setq erc-modules (remove 'autojoin erc-modules))
(erc-update-modules)

(provide 'bwb-erc)
