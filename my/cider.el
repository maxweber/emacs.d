(unless (package-installed-p 'cider)
  (package-install 'cider))

(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(setq nrepl-hide-special-buffers t)

(setq nrepl-buffer-name-show-port t)

(setq cider-repl-display-in-current-window nil)

(global-set-key (kbd "C-c M-p") 'cider-repl-set-ns)

(global-set-key (kbd "M-ö") 'cider-repl-previous-matching-input)

(global-set-key (kbd "C-.") 'cider-rotate-connection)

(global-set-key (kbd "C-x p") 'cider-repl-toggle-pretty-printing)

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

(set-variable 'cider-stacktrace-frames-background-color "#232830")

;; prefer the code navigation of lsp-mode
(eval-after-load "cider-mode"
  '(define-key cider-mode-map (kbd "M-.") nil))
;; method found here: https://emacsredux.com/blog/2013/09/25/removing-key-bindings-from-minor-mode-keymaps/

