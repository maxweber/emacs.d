(require 'nrepl)

(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'paredit-mode)

(set-variable 'nrepl-use-pretty-printing t)
(global-set-key (kbd "C-c M-p") 'nrepl-set-ns)

