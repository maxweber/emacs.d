(require 'nrepl)

(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)

(set-variable 'nrepl-use-pretty-printing t)
(global-set-key (kbd "C-c M-p") 'nrepl-set-ns)

(defun nrepl-current-connection-infos ()
  (with-current-buffer (get-buffer (nrepl-current-connection-buffer))
    nrepl-endpoint))

(defun nrepl-switch-to-next-connection ()
  (interactive)
  (setq nrepl-connection-list
        (append (rest nrepl-connection-list)
                (list (first nrepl-connection-list))))
  (message (apply 'format "Active nrepl connection: Host=%s Port=%s"
                  (nrepl-current-connection-infos))))

(global-set-key (kbd "C-c C-x n") 'nrepl-switch-to-next-connection)
