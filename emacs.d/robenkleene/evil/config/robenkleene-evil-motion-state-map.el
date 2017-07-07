;;; robenkleene-evil-motion-state-map.el --- robenkleene-motion-state-map
;;; Commentary:
;;; Code:

;; Window Switching
(define-key evil-motion-state-map (kbd "M-h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "M-k") 'evil-window-up)
(define-key evil-motion-state-map (kbd "M-j") 'evil-window-down)
(define-key evil-motion-state-map (kbd "M-l") 'evil-window-right)
(define-key evil-motion-state-map (kbd "M-e") 'projectile-find-file-in-directory)
;; (define-key evil-motion-state-map (kbd "M-e") '(lambda () (interactive)
;;                                                  (projectile-find-file-in-directory default-directory)))
(define-key evil-motion-state-map (kbd "M-c") 'projectile-find-dir)
(define-key evil-normal-state-map (kbd "C-w t") 'make-frame-command)
(define-key evil-motion-state-map (kbd "M-n") 'other-frame)
(define-key evil-motion-state-map (kbd "M-p") 'previous-multiframe-window)
(define-key evil-motion-state-map (kbd "C-w q") 'delete-frame)

;; Dired
(define-key evil-motion-state-map "-" 'dired-jump)

(provide 'robenkleene-evil-motion-state-map)

;;; robenkleene-evil-motion-state-map.el ends here
