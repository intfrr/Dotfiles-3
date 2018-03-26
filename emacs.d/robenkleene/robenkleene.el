;;; robenkleene.el --- robenkleene
;;; Commentary:
;;; Code:

;; Build a `.terminfo' that will support colors and underline at the same time
;; in `tmux':
;; `{ infocmp -x screen-256color; printf '\t%s\n' 'ncv@,'; } > /tmp/t && tic -x /tmp/t'

(setq-default flycheck-emacs-lisp-load-path 'inherit)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/robenkleene/config"))
(require 'robenkleene-config)
(require 'robenkleene-functions)
(require 'robenkleene-bindings)
(require 'robenkleene-alias)
(require 'robenkleene-dired)
(if window-system
    (require 'robenkleene-gui)
  (require 'robenkleene-terminal))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/robenkleene/packages"))
;; Packages
;; `git-gutter' moves the frame in an annoying way
;; `show-trailing-whitespace' isn't compatible with `fill-column-indicator'
(require 'robenkleene-aggressive-indent)
(require 'robenkleene-better-defaults)
(require 'robenkleene-editorconfig)
(require 'robenkleene-flycheck)
(require 'robenkleene-ido-completing-read)
(require 'robenkleene-yasnippet)
(require 'robenkleene-magit)
(require 'robenkleene-pbcopy)
(require 'robenkleene-projectile)
(require 'robenkleene-rainbow-delimiters)
(require 'robenkleene-rainbow-mode)
;; Interfering with `shift-select-mode`
(require 'robenkleene-smartparens)
(require 'robenkleene-smex)
(require 'robenkleene-macrostep)
(require 'robenkleene-helm)
;; Interfering with `shift-select-mode`
;; (require 'robenkleene-buffer-move)
(require 'robenkleene-wgrep)
(require 'robenkleene-fill-column-indicator)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/robenkleene/languages"))
(require 'robenkleene-languages)
(require 'robenkleene-common-lisp)
(require 'robenkleene-emacs-lisp)
(require 'robenkleene-jade)
(require 'robenkleene-javascript)
(require 'robenkleene-ruby)
(require 'robenkleene-swift)
(require 'robenkleene-markdown)
(require 'robenkleene-fish)
(require 'robenkleene-page-break-lines)

;;; robenkleene.el ends here
