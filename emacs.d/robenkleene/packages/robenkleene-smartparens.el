;;; robenkleene-smartparens.el --- robenkleene-smartparens
;;; Commentary:
;;; Code:

(require 'use-package)
(use-package smartparens
  :ensure t
  :demand
  :bind (:map smartparens-strict-mode-map
              ("<M-backspace>" . sp-backward-kill-word))
  :init
  (progn
    ;; Enable smartparens-mode in `eval-expression'
    (add-hook 'minibuffer-setup-hook (lambda ()
                                       (if (eq this-command 'eval-expression)
                                           (smartparens-mode)))
              )
    )
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1)
  (sp-use-smartparens-bindings)
  (defvar sp-highlight-pair-overlay)
  (defvar sp-highlight-wrap-overlay)
  (defvar sp-highlight-wrap-tag-overlay)
  (setq sp-highlight-pair-overlay nil)
  (setq sp-highlight-wrap-overlay nil)
  (setq sp-highlight-wrap-tag-overlay nil)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
  )

(provide 'robenkleene-smartparens)
;;; robenkleene-smartparens.el ends here
