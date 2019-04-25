;;; robenkleene-terminal.el --- robenkleene-terminal
;;; Commentary:
;;; Code:

(add-to-list 'custom-theme-load-path "~/.emacs.d/robenkleene/themes/")
(load-theme 'kleene-dark t)

(xterm-mouse-mode 1)
(global-set-key [mouse-4] (lambda ()
                            (interactive)
                            (scroll-down 1)))
(global-set-key [mouse-5] (lambda ()
                            (interactive)
                            (scroll-up 1)))

(menu-bar-mode -1)

;; A proper `<M-tab>' key is more important than `C-M-Tab`
(define-key key-translation-map  (kbd "C-M-i") (kbd "<M-tab>"))
;; Hack used along with binding `COMMAND-S' to `M-~' in terminal emulator to get
;; an easy save key
(define-key key-translation-map  (kbd "M-~") (kbd "s-s"))
(provide 'robenkleene-terminal)
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
;;; robenkleene-terminal.el ends here
