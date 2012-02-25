(setq-default kill-read-only-ok t)
(setq-default indent-tabs-mode nil)
(setq confirm-kill-emacs 'y-or-n-p)
(setq transient-mark-mode t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(setq custom-file "~/.emacs.d/custom")
(load custom-file 'noerror)

(fset 'yes-or-no-p 'y-or-n-p)

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defun copy-sexp (&optional arg)
  "Copy a s-expression instead of killing it."
  (interactive "P")
  (save-excursion
    (toggle-read-only 1)
    (kill-sexp arg)
    (toggle-read-only 0)))

(setq frame-title-format
      (list '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
