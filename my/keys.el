(let ((keys
       '(("C-x j"   . join-line)
	 ("M-n"     . forward-paragraph)
	 ("M-p"     . backward-paragraph)
	 ("C-z"     . ignore)
	 ("C-x C-z" . ignore)
	 ("C-M-w"   . copy-sexp))))

  (dolist (key keys)
    (define-key (current-global-map)
      (read-kbd-macro (car key))
      (cdr key))))
