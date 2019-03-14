;;; robenkleene-dired.el --- robenkleene-dired
;;; Commentary:
;;; Code:

;; Load `C-x C-j' command for `dired-jump'
(require 'dired-x)

(with-eval-after-load 'dired
  (defun robenkleene/dired-toggle-hidden ()
    "Show/hide hidden files except . and .."
    (interactive)
    (setq dired-omit-mode (not dired-omit-mode))
    (revert-buffer)
    )
  (define-key dired-mode-map (kbd "C-c g h") 'robenkleene/dired-toggle-hidden)
  (define-key dired-mode-map (kbd "<mouse-2>") 'dired-find-file)
  ;; Suppress error message
  (defvar dired-use-ls-dired)
  (setq dired-use-ls-dired nil)

  ;; Omit hidden files
  (setq-default dired-omit-mode t)
  (setq-default dired-omit-files
                (concat dired-omit-files "\\|^\\..+$"))
  )
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Hide details (showthem with "\("
            (dired-hide-details-mode)
            ;; Auto-refresh on file system change
            (auto-revert-mode)
            ))

(provide 'robenkleene-dired)
;;; robenkleene-dired.el ends here
