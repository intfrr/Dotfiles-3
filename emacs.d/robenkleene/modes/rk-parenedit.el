(provide 'rk-parenedit)

(rk-install-package-if-missing 'paredit)

;; Parenedit
(show-paren-mode 1) ;; Built-in, highlights matching parentheses
;; (setq show-paren-style 'expression) ;; Highlights whole expression
;; Load Parenedit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "s-)") 'mark-sexp)
     ))
