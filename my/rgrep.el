(defun current-word-rgrep ()
  "setting up grep-command using current word under cursor as a search string"
  (interactive)
  (let* ((cur-word (symbol-name (symbol-at-point)))
         (src-dir (replace-regexp-in-string "src/.*" "src/" (buffer-file-name)))
         (cmd (concat "grep -nH -r --include='*.clj' --include='*.cljs' --include='*.cljc' -e '" cur-word "' " src-dir))
         )
    (grep-apply-setting 'grep-command cmd)
    (grep cmd)
    ))

(global-set-key (kbd "\C-c w") 'current-word-rgrep)
