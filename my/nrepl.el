(require 'nrepl)

(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)

(set-variable 'nrepl-use-pretty-printing nil)
(global-set-key (kbd "C-c M-p") 'nrepl-set-ns)

(defun nrepl-current-connection-infos ()
  (with-current-buffer (get-buffer (nrepl-current-connection-buffer))
    nrepl-endpoint))

(defun nrepl-rotate-connection-list (connection-list)
  (append (rest connection-list)
          (list (first connection-list))))

(defun nrepl-switch-to-next-connection ()
  (interactive)
  (setq nrepl-connection-list
        (nrepl-rotate-connection-list nrepl-connection-list))
  (message (apply 'format "Active nrepl connection: Host=%s Port=%s"
                  (nrepl-current-connection-infos))))

(global-set-key (kbd "C-c C-x n") 'nrepl-switch-to-next-connection)

(defun nrepl-define-connect-keys ()
  (dolist (n (number-sequence 1 5))
    (let ((k (concat "C-c " (number-to-string n))))
      (define-key (current-global-map)
        (read-kbd-macro k)
        (lexical-let ((port (+ 4004 n)))
          (lambda ()
            (interactive)
            (nrepl-connect "127.0.0.1" port)))))))

(nrepl-define-connect-keys)
