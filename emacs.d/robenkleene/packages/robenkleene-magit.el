;;; robenkleene-magit.el --- robenkleene-magit
;;; Commentary:
;;; Code:

(require 'use-package)

(use-package magit
  :ensure t
  :bind (
         ("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)
         )
  :config
  (progn
    (setq magit-push-always-verify nil)
    )
  )

(provide 'robenkleene-magit)
;;; robenkleene-magit.el ends here
