(eval-after-load 'scheme
  '(progn
     (defun chicken-doc ()
       (interactive)
       (let ((func (current-word)))
	 (when func
	   (process-send-string "*scheme*"
				(format "(require-library chicken-doc) ,doc %S\n" func))
	   (save-selected-window
	     (select-window (display-buffer "*scheme*" t))
	     (goto-char (point-max))))))
     (define-key scheme-mode-map (kbd "C-c C-d") 'chicken-doc)))
