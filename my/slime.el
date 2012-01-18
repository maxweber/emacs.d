(eval-after-load 'slime
  '(progn
     (let ((keys
            '(("M-n"     . forward-paragraph)
              ("M-p"     . backward-paragraph))))

       (dolist (key keys)
         (define-key slime-mode-map
           (read-kbd-macro (car key))
           (cdr key))))

     ;; Avoids that some unicode characters blow up the Slime connection
     ;; to the swank server
     (setq slime-net-coding-system 'utf-8-unix)))
