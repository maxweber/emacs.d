;; necessary since Emacs 27, see: https://emacs.stackexchange.com/a/52804
(setq custom--inhibit-theme-enable nil)

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(if (display-graphic-p)
    (load-file "~/.emacs.d/themes/spacegray-theme.el")
  ;; use different theme for emacs -nw
  (load-theme 'nord t)
  )
