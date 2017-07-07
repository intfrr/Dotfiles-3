;;; robenkleene.el --- robenkleene
;;; Commentary:
;;; Code:

(defvar use-package-verbose t)

(setq-default flycheck-emacs-lisp-load-path 'inherit)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/robenkleene/config"))
(require 'robenkleene-config)
(require 'robenkleene-functions)
(require 'robenkleene-dired)
(if window-system
    (require 'robenkleene-gui)
  (require 'robenkleene-terminal))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/robenkleene/packages"))
(require 'robenkleene-aggressive-indent)
(require 'robenkleene-better-defaults)
;; Temporarily removing this because it's annoying
;; (require 'robenkleene-company)
(require 'robenkleene-bind-map)
(require 'robenkleene-editorconfig)
(require 'robenkleene-flycheck)
;; Disabling this for now because I don't like how the window moves to add and remove the frame
;; (require 'robenkleene-git-gutter)
(require 'robenkleene-ido-completing-read)
(require 'robenkleene-magit)
(require 'robenkleene-pbcopy)
(require 'robenkleene-projectile)
(require 'robenkleene-rainbow-delimiters)
(require 'robenkleene-rainbow-mode)
(require 'robenkleene-smartparens)
(require 'robenkleene-smex)
(require 'robenkleene-helm-ag)
(require 'robenkleene-helm-swoop)
(require 'robenkleene-helm)
(require 'robenkleene-buffer-move)
(require 'robenkleene-wgrep)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/robenkleene/evil"))
(require 'robenkleene-evil)


;; `fill-column-indicator' is not compatible with `show-trailing-whitespace'
;; Font lock errors on startup are from `fill-column-indicator'
(require 'robenkleene-fill-column-indicator)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/robenkleene/languages"))
(require 'robenkleene-common-lisp)
(require 'robenkleene-emacs-lisp)
(require 'robenkleene-jade)
(require 'robenkleene-javascript)
(require 'robenkleene-ruby)
(require 'robenkleene-swift)
(require 'robenkleene-markdown)
(require 'robenkleene-fish)

;;; robenkleene.el ends here
