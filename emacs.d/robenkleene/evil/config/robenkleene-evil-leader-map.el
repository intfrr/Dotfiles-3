;;; robenkleene-evil-leader-map.el --- robenkleene-evil-leader-map
;;; Commentary:
;;; Code:

;; Open Map
(defvar robenkleene/open-map (make-keymap))
(define-key robenkleene/open-map (kbd "i") (lambda() (interactive) (find-file "~/.emacs.d/robenkleene/robenkleene.el")))

;; Leader Map
(defvar robenkleene/leader-map (make-keymap))
(define-key robenkleene/leader-map (kbd "w") 'toggle-truncate-lines)
(define-key robenkleene/leader-map (kbd "t") 'robenkleene/open-terminal-window)
(define-key robenkleene/leader-map (kbd "r") 'robenkleene/reveal-in-finder)
(define-key robenkleene/leader-map (kbd "e") 'robenkleene/external-editor)
(define-key robenkleene/leader-map (kbd "o") robenkleene/open-map)
(define-key robenkleene/leader-map (kbd "b") 'helm-buffers-list)
(define-key robenkleene/leader-map (kbd "f") 'projectile-find-file-in-directory)
;; (define-key robenkleene/leader-map (kbd "f") '(lambda () (interactive)
;;                                                 (projectile-find-file-in-directory default-directory)))
(define-key robenkleene/leader-map (kbd "c") 'projectile-find-dir)
(define-key robenkleene/leader-map (kbd "a") 'helm-do-ag)
;; (define-key robenkleene/leader-map (kbd "a") '(lambda () (interactive)
;;                                                 (helm-do-ag default-directory)))

;; Leader Key
(define-key evil-motion-state-map (kbd "SPC") robenkleene/leader-map)

(provide 'robenkleene-evil-leader-map)

;;; robenkleene-evil-leader-map.el ends here
