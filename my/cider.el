(unless (package-installed-p 'cider)
  (package-install 'cider))

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq nrepl-hide-special-buffers t)

(setq nrepl-buffer-name-show-port t)

(global-set-key (kbd "C-c M-p") 'cider-repl-set-ns)

(global-set-key (kbd "C-c C-x n") 'cider-rotate-connection)

(defun cider-define-connect-keys ()
  (dolist (n (number-sequence 1 9))
    (let ((k (concat "C-c " (number-to-string n))))
      (define-key (current-global-map)
        (read-kbd-macro k)
        (lexical-let ((port (+ 4004 n)))
          (lambda (arg)
            (interactive "P")
            (process-buffer (cider-connect "127.0.0.1" port))))))))

(cider-define-connect-keys)
