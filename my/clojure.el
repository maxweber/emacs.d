(autoload 'clojure-mode "clojure-mode" "Mode for editing Clojure source files")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljx$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

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

;; from http://stackoverflow.com/questions/9288181/converting-from-camelcase-to-in-emacs#answer-25886353
(defun toggle-camelcase-dashes ()
  "Toggle between camcelcase and dash notation for the symbol at point."
  (interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'symbol))
           (start (car bounds))
           (end (cdr bounds))
           (currently-using-underscores-p (progn (goto-char start)
                                                 (re-search-forward "-" end t))))
      (if currently-using-underscores-p
          (progn
            (upcase-initials-region start end)
            (replace-string "-" "" nil start end)
            (downcase-region start (1+ start)))
        (replace-regexp "\\([A-Z]\\)" "-\\1" nil (1+ start) end)
        (downcase-region start end)))))

(global-unset-key (kbd "C-q"))
(global-set-key (kbd "C-q C-d") 'toggle-camelcase-dashes)
