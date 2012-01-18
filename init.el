(require 'package)

(add-to-list
 'package-archives
 '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(require 'cl)

(add-to-list 'load-path "~/.emacs.d/lib")

(defun load-my (file)
  (load (concat "~/.emacs.d/my/" (symbol-name file))))

;; global
(load-my 'theme)
(load-my 'general)
(load-my 'auto-save)
(load-my 'keys)
(load-my 'scpaste)
(load-my 'hippie-expand)
(load-my 'browse-url)
(load-my 'smooth-scrolling)
(load-my 'anything)
(load-my 'printing)

;; modes
(load-my 'highlight-parentheses)
(load-my 'highlight-symbol)
(load-my 'magit)
(load-my 'org)
;;(load-my 'ruby)
;;(load-my 'highline)

;; ido
(load-my 'ido)
(load-my 'ido-goto-symbol)

;; lisp
(load-my 'paredit)
(load-my 'elisp)
;;(load-my 'scheme)
;;(load-my 'chicken)
(load-my 'clojure)
(load-my 'slime)
