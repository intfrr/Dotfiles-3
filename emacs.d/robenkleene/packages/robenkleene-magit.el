;;; robenkleene-magit.el --- robenkleene-magit
;;; Commentary:
;;; Code:

(require 'use-package)
(defvar magit)
(use-package magit
  :ensure t
  :init
  (progn
    (global-set-key (kbd "C-x g") 'magit-status)
    (global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
    )
  )

(provide 'robenkleene-magit)
;;; robenkleene-magit.el ends here
