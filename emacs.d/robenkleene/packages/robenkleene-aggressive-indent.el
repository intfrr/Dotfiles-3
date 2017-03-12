;;; robenkleene-aggressive-indent.el --- robenkleene-aggressive-indent
;;; Commentary:
;;; Code:

(require 'use-package)
(use-package aggressive-indent
  :ensure t
  :init
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'swift-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'markdown-mode)
  )

(provide 'robenkleene-aggressive-indent)
;;; robenkleene-aggressive-indent.el ends here
