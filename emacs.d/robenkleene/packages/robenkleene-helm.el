;;; robenkleene-helm.el --- robenkleene-helm
;;; Commentary:
;;; Code:

(require 'use-package)
(use-package helm
  :ensure t
  :defer t
  :config
  (setq helm-truncate-lines t)
  (setq helm-candidate-number-limit 1000)
  )

(provide 'robenkleene-helm)
;;; robenkleene-helm.el ends here
