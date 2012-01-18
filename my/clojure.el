(autoload 'clojure-mode "clojure-mode" "Mode for editing Clojure source files")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

(add-hook 'clojure-mode-hook (lambda () 
                               (show-paren-mode t)
                               (paredit-mode t)
                               (highlight-parentheses-mode t)))


(add-to-list 'load-path "/usr/share/emacs/site-lisp/swank-clojure")
(require 'swank-clojure)

(setq swank-clojure-jar-path "/usr/share/clojure/clojure.jar"
      swank-clojure-extra-classpaths 
      '("/usr/share/emacs/site-lisp/swank-clojure/src/swank"
        "/usr/share/clojure/clojure-contrib.jar"))

(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (describe 'defun)
     (testing 'defun)
     (given 'defun)
     (using 'defun)
     (with 'defun)
     (it 'defun)
     (do-it 'defun)
     (let-uri-parts 'defun)))

;; slime
(eval-after-load "slime" 
  '(progn (slime-setup '(slime-repl))))
 
