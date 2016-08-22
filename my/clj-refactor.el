(unless (package-installed-p 'clj-refactor)
  (package-install 'clj-refactor))

(require 'clj-refactor)
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            (cljr-add-keybindings-with-prefix "C-c C-b")
            ))

(yas/global-mode 1)


