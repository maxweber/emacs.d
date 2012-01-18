;; store tempfiles a in central place, cf. http://amitp.blogspot.com/2007/03/emacs-move-autosave-and-backup-files.html
(defvar user-temporary-file-directory
  (concat (getenv "HOME") "/.emacs-tmp/"))

(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `((,tramp-file-name-regexp nil)
        ("." . ,user-temporary-file-directory)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-save-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
