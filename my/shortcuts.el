(defun cljs-repl ()
  (interactive)
  (insert
   "(do
     (require 'figwheel-sidecar.repl-api)
     (figwheel-sidecar.repl-api/cljs-repl))"))

;; (defun pp ()
;;   (interactive)
;;   (nrepl-request:eval
;;    "(do
;;      (require 'clojure.pprint)
;;      (def p clojure.pprint/pprint))"
;;    (lambda (_response) nil)))

(defun pprint ()
  (interactive)
  (insert
   "(do
     (require 'clojure.pprint)
     (def p clojure.pprint/pprint))"))

(defun set-print-length ()
  (interactive)
  (insert
   "(do
     (set! *print-length* 20))"))

(defun app-reset ()
  (interactive)
  (insert
   "(nosnapshots.system/restart)"))

(global-set-key (kbd "C-c M-r") 'app-reset)
