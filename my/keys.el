(let ((keys
       '(("C-x j"   . join-line)
	 ("M-n"     . forward-paragraph)
	 ("M-p"     . backward-paragraph)
	 ("C-z"     . ignore)
	 ("C-x C-z" . ignore)
	 ("C-M-w"   . copy-sexp)
         ("S-<up>" . windmove-up)
         ("S-<down>" . windmove-down)
         ("S-<right>" . windmove-right)
         ("S-<left>" . windmove-left))))

  (dolist (key keys)
    (define-key (current-global-map)
      (read-kbd-macro (car key))
      (cdr key))))

;; Set command-key as M on MacOS
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)

