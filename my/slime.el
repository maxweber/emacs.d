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

(defun slime-connecting (port)
  (lexical-let ((port port))
      (lambda ()
        (interactive)
        (slime-connect "localhost" port))))

(define-key (current-global-map)
  (kbd "C-c 1")
  (slime-connecting 4005))

(define-key (current-global-map)
  (kbd "C-c 2")
  (slime-connecting 4006))
