(require 'scpaste)
(setq scpaste-scp-port "22")
(setq scpaste-scp-destination "some-host:path")
(setq scpaste-http-destination "http://some-host/path")

;; implement optional htmlization
(defun scpaste (original-name)
  "Paste the current buffer via `scp' to `scpaste-http-destination'."
  (interactive "MName (defaults to buffer name): ")
  (let* ((html? (y-or-n-p "htmlize buffer? "))
	 (b (if html? (htmlize-buffer) (current-buffer)))
         (name (url-hexify-string (if (equal "" original-name)
                                      (buffer-name)
                                    original-name)))
	 (full-url (concat scpaste-http-destination "/" name (if html? ".html" "")))
         (scp-destination (concat scpaste-scp-destination "/" name (if html? ".html" "")))
         (scp-original-destination (concat scpaste-scp-destination "/" name))
         (tmp-file (concat temporary-file-directory "/" name)))

    ;; Save the file (while adding footer)
    (save-excursion
      (when html?
	(switch-to-buffer b)
	(goto-char (point-min))
	(search-forward "</body>\n</html>")
	(insert (format scpaste-footer
			(current-time-string)
			(substring full-url 0 -5))))
      (write-file tmp-file)
      (when html?
	(kill-buffer b)))

    (shell-command (concat "scp -P " scpaste-scp-port
                           " " tmp-file
                           " " scp-destination))
    (shell-command (concat "scp -P " scpaste-scp-port
                           " " (buffer-file-name (current-buffer))
                           " " scp-original-destination))

    ;; Notify user and put the URL on the kill ring
    (let ((x-select-enable-primary t))
      (kill-new full-url))
    (message "Pasted to %s (on kill ring)" full-url)))

(define-key (current-global-map) (kbd "C-c C-p") 'scpaste)
(define-key (current-global-map) (kbd "C-c C-c C-p") 'scpaste)
