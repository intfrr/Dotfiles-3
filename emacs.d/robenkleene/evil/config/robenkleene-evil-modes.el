;;; robenkleene-evil-modes.el --- robenkleene-evil-modes
;;; Commentary:
;;; Code:

(require 'robenkleene-evil-integration)

;; Basic
(defvar evil-motion-state-modes)
(defvar evil-emacs-state-modes)
(defvar evil-insert-state-modes)
(setq evil-motion-state-modes '(magit-revision-mode))
(setq evil-emacs-state-modes '(magit-popup-mode))
(setq evil-insert-state-modes nil)
;; Don't do this because it is disorientating when just editing a snippet
;; (setq evil-insert-state-modes '(snippet-mode))

;; Debug
(robenkleene/evilify 'debug 'debugger-mode debugger-mode-map 'motion)
(add-to-list 'evil-motion-state-modes 'debugger-mode)

;; help
(robenkleene/evilify 'help 'help-mode help-mode-map 'motion)
(add-to-list 'evil-motion-state-modes 'help-mode)

;; help
(robenkleene/evilify 'man 'Man-mode man-mode-map 'motion)
(add-to-list 'evil-motion-state-modes 'Man-mode)

;; dired
(robenkleene/evilify 'dired 'dired-mode dired-mode-map 'motion)
(add-to-list 'evil-motion-state-modes 'dired-mode)

;; grep
(robenkleene/evilify 'grep 'grep-mode grep-mode-map 'motion)
(add-to-list 'evil-motion-state-modes 'grep-mode)
;; magit
;; This doesn't work because `evil-define-key` doesn't work with `magit-file-section-map'
;; (robenkleene/evilify 'magit 'magit-status-mode magit-file-section-map 'motion
;;                      "C-k" 'magit-discard
;;                      )
;; Start commits in insert mode
(add-hook 'with-editor-mode-hook 'evil-insert-state)
(defvar robenkleene/magit-unimpaired-next-map (make-keymap))
(defvar robenkleene/magit-unimpaired-previous-map (make-keymap))
(define-key robenkleene/magit-unimpaired-next-map (kbd "]") 'magit-section-forward-sibling)
(define-key robenkleene/magit-unimpaired-previous-map (kbd "[") 'magit-section-backward-sibling)
(robenkleene/evilify 'magit 'magit-status-mode magit-status-mode-map 'motion
                     "[" robenkleene/magit-unimpaired-previous-map
                     "]" robenkleene/magit-unimpaired-next-map
                     "TAB" 'magit-toggle-section
                     )
(with-eval-after-load 'magit
  (defvar magit-file-section-map)
  (define-key magit-file-section-map "\C-k" 'magit-discard)
  )
(add-to-list 'evil-motion-state-modes 'magit-status-mode)

(provide 'robenkleene-evil-modes)
;;; robenkleene-evil-modes.el ends here
