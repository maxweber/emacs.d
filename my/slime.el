(eval-after-load 'slime
  '(let ((keys
          '(("M-n"     . forward-paragraph)
            ("M-p"     . backward-paragraph))))

     (dolist (key keys)
       (define-key slime-mode-map
         (read-kbd-macro (car key))
         (cdr key)))))
