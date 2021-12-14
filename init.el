(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(require 'cl)

(add-to-list 'load-path "~/.emacs.d/lib")

(defun load-my (file)
  (load (concat "~/.emacs.d/my/" (symbol-name file))))

;; see https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; global
(load-my 'general)
(load-my 'auto-save)
(load-my 'keys)
(load-my 'scpaste)
(load-my 'hippie-expand)
(load-my 'browse-url)
(load-my 'smooth-scrolling)
(load-my 'anything)
(load-my 'printing)

;; modes
(load-my 'magit)
(load-my 'org)

;; ido
(load-my 'ido)
(load-my 'ido-goto-symbol)

;; lisp
(load-my 'paredit)
(load-my 'elisp)
(load-my 'clojure)
(load-my 'cider)

(load-my 'shortcuts)
(load-my 'ssh)
(load-my 'theme)
(load-my 'xml)
(load-my 'rgrep)

;; avoids "too long for Unix domain socket" on ssh over tramp (see
;; also
;; https://lists.gnu.org/archive/html/bug-gnu-emacs/2015-01/msg00890.html):
(setq tramp-use-ssh-controlmaster-options nil)

;; Emacs tends to get super slow, if there are very long text lines
;; (like Clojure REPL output of a long sequence). If you use
;; profiler-start move the text cursor on a long text line, you see
;; that line-move-visual needs the most computing power. See
;; https://groups.google.com/forum/#!topic/gnu.emacs.help/vZKrLfxPI7E
;; and http://ergoemacs.org/emacs/emacs_line_move_visual.html
;; (setq line-move-visual nil)
