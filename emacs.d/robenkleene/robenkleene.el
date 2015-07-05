;;; robenkleene.el --- robenkleene
;;; Commentary:
;;; Code:

(defvar use-package-verbose t)

(setq-default flycheck-emacs-lisp-load-path 'inherit)

(add-to-list 'custom-theme-load-path "~/.emacs.d/robenkleene/themes/")
(load-theme 'robenkleene-dark t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/robenkleene/config"))
(require 'robenkleene-emacs)
(require 'robenkleene-functions)
(require 'robenkleene-dired)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/robenkleene/packages"))
(require 'robenkleene-better-defaults)
(require 'robenkleene-editorconfig)
(require 'robenkleene-evil)
(require 'robenkleene-evil-commentary)
(require 'robenkleene-flycheck)
(require 'robenkleene-smartparens)
(require 'robenkleene-helm)
(require 'robenkleene-helm-ag)
(require 'robenkleene-helm-swoop)
(require 'robenkleene-projectile)
(require 'robenkleene-company)
(require 'robenkleene-pbcopy)
(require 'robenkleene-magit)
(require 'robenkleene-rainbow-mode)

;;; robenkleene.el ends here


