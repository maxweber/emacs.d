(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (show-paren-mode t)
				  (paredit-mode t)))