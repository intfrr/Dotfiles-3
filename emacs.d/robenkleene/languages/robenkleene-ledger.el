;;; robenkleene-ledger.el --- robenkleene-ledger
;;; Commentary:
;;; code:

(eval-when-compile (require 'use-package))
(use-package ledger-mode
  :ensure t
  :mode "\\.dat\\'")

(provide 'robenkleene-ledger)
;;; robenkleene-ledger.el ends here
