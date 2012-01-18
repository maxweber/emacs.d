(setq
 hl-paren-colors '()
 hl-paren-background-colors (list "#4f4f4f" "#4f4f4f" "#4f4f4f" "#4f4f4f" "#4f4f4f" "#4f4f4f" "#4f4f4f"))

(add-hook 'scheme-mode-hook
          (lambda () 
            (highlight-parentheses-mode t)))

(add-hook 'emacs-lisp-mode-hook
          (lambda () 
            (highlight-parentheses-mode t)))
