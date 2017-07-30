;;; robenkleene-evil-emacs-lisp.el --- robenkleene-evil-emacs-lisp
;;; Commentary:
;;; Code:

(with-eval-after-load "lisp-mode"
  ;; Eval
  (defvar robenkleene/emacs-lisp-eval-leader-map (make-keymap))
  (define-key robenkleene/emacs-lisp-eval-leader-map (kbd "b") (lambda ()
                                                                 (interactive)
                                                                 (eval-buffer)
                                                                 (message "Evaluated buffer")
                                                                 )
    )
  (define-key robenkleene/emacs-lisp-eval-leader-map (kbd "r") (lambda (begin end)
                                                                 (interactive "r")
                                                                 (eval-region begin end)
                                                                 (message "Evaluated region")
                                                                 (deactivate-mark)
                                                                 )
    )
  (define-key robenkleene/emacs-lisp-eval-leader-map (kbd "s") 'eval-last-sexp)

  ;; Linter
  (defvar robenkleene/emacs-lisp-linter-leader-map (make-keymap))
  (define-key robenkleene/emacs-lisp-linter-leader-map (kbd "l") 'flycheck-list-errors)

  ;; Maps
  (defvar robenkleene/emacs-lisp-leader-map (make-keymap))
  (define-key robenkleene/emacs-lisp-leader-map (kbd "e") robenkleene/emacs-lisp-eval-leader-map)
  (define-key robenkleene/emacs-lisp-leader-map (kbd "l") robenkleene/emacs-lisp-linter-leader-map)
  (define-key robenkleene/emacs-lisp-leader-map (kbd "p") 'robenkleene/print-variable)

  ;; Make `-' part of words
  (add-hook 'emacs-lisp-mode-hook (lambda ()
                                    (let ((table (copy-syntax-table (syntax-table))))
                                      (modify-syntax-entry ?- "w" table)
                                      (set-syntax-table table)
                                      )
                                    )
            )
  )
(provide 'robenkleene-evil-emacs-lisp)
;;; robenkleene-evil-emacs-lisp.el ends here
