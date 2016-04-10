;;; robenkleene-swiper.el --- robenkleene-swiper
;;; Commentary:
;;; Code:

(require 'use-package)

(use-package swiper
  :ensure t
  :bind (
         ("C-c l" . swiper)
         ("C-c a" . counsel-ag)
         )
  :config
  (progn
    ;; Use `C-w' to insert word at point
    (define-key ivy-minibuffer-map (kbd "C-w") 'ivy-yank-word)
    )
  )

(provide 'robenkleene-swiper)
;;; robenkleene-swiper.el ends here
