(autoload 'clojure-mode "clojure-mode" "Mode for editing Clojure source files")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

(add-hook 'clojure-mode-hook
          (lambda () 
            (show-paren-mode t)
            (paredit-mode t)))

(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (describe 'defun)
     (testing 'defun)
     (given 'defun)
     (using 'defun)
     (with 'defun)
     (it 'defun)
     (do-it 'defun)
     (let-uri-parts 'defun)
     (scenario 'defun)
     (feature 'defun)))
