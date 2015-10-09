;;; Configure `rich-minority', which claims to "Clean-up and Beautify
;;; the list of minor-modes".

;;;###autoload
(progn
  (rich-minority-mode 1)
  (setq rm-blacklist
        '(" $"
          " company"
          " MRev"
          " Paredit"
          " WS"
          " yas")))
