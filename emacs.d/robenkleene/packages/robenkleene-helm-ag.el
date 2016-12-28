;;; robenkleene-helm-ag.el --- robenkleene-helm-ag
;;; Commentary:
;;; Code:

(require 'use-package)

(use-package helm-ag
  :ensure t
  :commands helm-do-ag
  :init
  (bind-key "C-c a" (lambda () (interactive)
                      (helm-do-ag default-directory)))
  :config
  ;; Enable grep mode after saving `helm-ag' results
  ;; To use: Trigger `C-x C-s' after performing a search to save the results
  ;; Then use `next-error' to cycle through matches
  (defadvice helm-ag--save-results
      (after robenkleene/helm-ag-grep-mode (args) activate)
    (with-current-buffer (get-buffer-create "*helm ag results*")
      (grep-mode)
      )
    )
  ;; Use ripgrep
  (custom-set-variables
   '(helm-ag-base-command "rg --vimgrep --no-heading"))
  )

(provide 'robenkleene-helm-ag)
;;; robenkleene-helm-ag.el ends here
