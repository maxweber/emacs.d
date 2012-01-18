(require 'anything-config)

(defun my-anything ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-buffers+
     anything-c-source-files-in-current-dir+
     anything-c-source-recentf)
   " *my-anything*"))

(global-set-key (kbd "C-c C-a") 'my-anything)
