(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("/Gemfile$" . ruby-mode))

(defun ruby-end-return ()
  "Called when RET-key is pressed."
  (interactive)
  (when (ruby-end-expand-p)
    (ruby-end-insert-end))
  (insert "\n")
  (ruby-indent-line))

(add-hook 'ruby-mode-hook
          (lambda ()
            (define-key ruby-mode-map
              (kbd "TAB")
              'indent-and-hippie-expand)

            (setq-default ruby-end-insert-newline nil)
            (ruby-end-mode t)

            (define-key ruby-end-mode-map
              (kbd "RET")
              'ruby-end-return)))
