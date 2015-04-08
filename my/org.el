(add-to-list 'load-path "/usr/share/emacs/site-lisp/org_contrib/lisp")

(require 'org-protocol)

(setq
 org-hide-leading-stars t
 org-odd-levels-only t)

(setq
 org-directory "~/org"
 org-default-notes-file "notes.org"
 org-remember-templates
 '(("Todo" ?t "* TODO %?\n  %i\n  %a" "todo.org" "Tasks")
   ("URL" ?w "* %^{Title}\n\n  Source: %u, %c\n\n  %i" nil "URLs")
   ("Note" ?n "* %^{Title}\n  %i\n  %a" nil "Notes")
   ("Quote" ?q "* %t  %^g\n\n%c" "quotes.org"  "Quotes")
   ("Fitness" ?f "* %T %^{Reps} %^g" "fitness.org" "Stats")))


(define-key global-map "\C-cr" 'org-remember)


;; http://tsdh.wordpress.com/2008/11/14/calling-org-remember-from-inside-conkeror/
;; (defun th-org-remember-conkeror (url)
;;   (interactive "s")
;;   (org-remember nil ?u)
;;   (save-excursion
;;     (insert "\n\n  [[" url "]]")))
;;   ;; (local-set-key (kbd "C-c C-c")
;;   ;; 		 (lambda ()
;;   ;; 		   (interactive)
;;   ;; 		   (org-ctrl-c-ctrl-c)
;;   ;; 		   (delete-frame nil t))))
