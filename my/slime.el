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

(defun make-slime-connector (port)
  (lexical-let ((port port))
    (lambda ()
      (interactive)
      (let ((conn (find port
                        slime-net-processes
                        :test (lambda (port conn)
                                (= port (slime-connection-port conn))))))
        (if conn
            (progn
              (slime-select-connection conn)
              (pop-to-buffer (slime-repl-buffer))
              (message "Lisp: %s %s"
                       (slime-connection-name conn)
                       (process-contact conn)))
          (slime-connect "localhost" port))))))

(dolist (num (number-sequence 1 5))
  (define-key (current-global-map)
    (read-kbd-macro (concat "C-c " (number-to-string num)))
    (make-slime-connector (+ 4004 num))))
