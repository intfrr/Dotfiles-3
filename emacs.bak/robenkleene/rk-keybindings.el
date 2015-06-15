
;; Basic
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;; OS X Window Management
(defvar rk-osx-window-minor-mode-map (make-keymap) "rk-osx-window-minor-mode-map.")
(define-key rk-osx-window-minor-mode-map (kbd "s-q") 'save-buffers-kill-terminal)
(define-key rk-osx-window-minor-mode-map (kbd "s-n") 'make-frame-command)
(define-key rk-osx-window-minor-mode-map (kbd "s-w") 'delete-frame)
(define-key rk-osx-window-minor-mode-map (kbd "s-s") 'save-buffer)
(define-minor-mode rk-osx-window-minor-mode
  "Window management like OS X."
  t
  nil
  'rk-osx-window-minor-mode-map)
(rk-osx-window-minor-mode 1)

;; OS X Cut and Paste
(define-key rk-osx-window-minor-mode-map (kbd "s-v") 'yank)
(define-key rk-osx-window-minor-mode-map (kbd "s-c") 'kill-ring-save)
(define-key rk-osx-window-minor-mode-map (kbd "s-x") 'kill-region)
(defvar rk-osx-cutpaste-minor-mode-map (make-keymap) "rk-osx-cutpaste-minor-mode-map.")
(define-minor-mode rk-osx-cutpaste-minor-mode
  "Cut & paste like OS X."
  t
  nil
  'rk-osx-cutpaste-minor-mode-map)
(rk-osx-cutpaste-minor-mode 1)

;; OS X Navigation 
(defvar rk-osx-navigation-minor-mode-map (make-keymap) "rk-osx-navigation-minor-mode map keymap.")
(define-key rk-osx-navigation-minor-mode-map (kbd "s-<left>") 'beginning-of-visual-line)
(define-key rk-osx-navigation-minor-mode-map (kbd "s-<right>") 'move-end-of-line)
(define-key rk-osx-navigation-minor-mode-map (kbd "s-<up>") 'beginning-of-buffer)
(define-key rk-osx-navigation-minor-mode-map (kbd "s-<down>") 'end-of-buffer)
(define-key rk-osx-navigation-minor-mode-map (kbd "M-<left>") 'left-word)
(define-key rk-osx-navigation-minor-mode-map (kbd "M-<right>") 'right-word)
(define-key rk-osx-navigation-minor-mode-map (kbd "M-S-<left>") nil)
(define-key rk-osx-navigation-minor-mode-map (kbd "M-S-<right>") nil)
(define-key rk-osx-navigation-minor-mode-map (kbd "C-w") 'backward-kill-word)
(define-key rk-osx-navigation-minor-mode-map (kbd "M-s-w") 'toggle-truncate-lines)
(define-minor-mode rk-osx-navigation-minor-mode
  "Navigation like OS X."
  t
  nil
  'rk-osx-navigation-minor-mode)
(rk-osx-navigation-minor-mode 1)

;; Windows & Buffers
;; (defvar rk-wm-minor-mode-map (make-keymap) "rk-wm-minor-mode map keymap.")
;; ;; (define-key rk-wm-minor-mode-map (kbd "C-`") 'other-window)
;; ;; (define-key rk-wm-minor-mode-map (kbd "C-~") (lambda () (interactive) (other-window -1)))
;; ;; (define-key rk-wm-minor-mode-map (kbd "C-'") 'other-window)
;; ;; (define-key rk-wm-minor-mode-map (kbd "C-\"") (lambda () (interactive) (other-window -1))) 
;; ;; (define-key rk-wm-minor-mode-map (kbd "C-w") 'delete-window)
;; ;; (define-key rk-wm-minor-mode-map (kbd "C-S-w") 'delete-other-windows)
;; (define-key rk-wm-minor-mode-map (kbd "s-{") 'previous-buffer) ; Tab-switching Style
;; (define-key rk-wm-minor-mode-map (kbd "s-}") 'next-buffer)
;; (define-key rk-wm-minor-mode-map (kbd "C-s-<left>") 'previous-buffer) ;; Xcode Style
;; (define-key rk-wm-minor-mode-map (kbd "C-s-<right>") 'next-buffer)
;; (define-minor-mode rk-wm-minor-mode
;;   "Window management minor mode."
;;   :global t)
;; (rk-wm-minor-mode 1)


;; Editing
;; (global-set-key (kbd "s-k") 'kill-line) 
;; (global-set-key (kbd "s-y") 'yank)
(global-set-key (kbd "RET") 'newline-and-indent)
;; (global-set-key (kbd "s-]") 'indent-for-tab-command)
;; (global-set-key (kbd "s-[") 'indent-for-tab-command)
;; (global-set-key (kbd "s-%") 'query-replace)
;; (global-set-key (kbd "<escape>") 'keyboard-quit)
;; (global-set-key (kbd "M-s-w") 'toggle-truncate-lines)
;; (global-set-key (kbd "M-s-Σ") 'toggle-truncate-lines) ;; This isn't working

;; Abort
(define-key minibuffer-local-map (kbd "<escape>") 'abort-recursive-edit) 

;; Custom Functions

;; Customizing Emacs
;; (global-set-key (kbd "s-E") 'rk-customize-emacs)
;; (global-set-key (kbd "<C-s-268632069>") 'rk-customize-emacs)
;; (defun rk-customize-emacs ()
;;   (interactive)
;;   (find-file "~/.emacs.d/robenkleene/robenkleene.el"))

;; Text Directory
;; (global-set-key (kbd "s-T") 'rk-text-directory)
;; (defun rk-text-directory ()
;;   (interactive)
;;   (find-file "~/Dropbox/Text/Scratch.md"))

;; Comments
;; (global-set-key (kbd "s-/") 'rk-comment-line-or-region)
;; (defun rk-comment-line-or-region ()
;;   (interactive)
;;   (if (use-region-p)
;;       (if (< (point) (mark))
;; 	  (comment-or-uncomment-region (point) (mark))
;; 	(comment-or-uncomment-region (mark) (point)))
;;     (comment-or-uncomment-region (line-beginning-position)
;; 				 (line-end-position))))

;; snpt
;; (global-set-key (kbd "C-s-s") 'rk-snpt)
;; (global-set-key (kbd "C-s-S") 'rk-open-snpt)
;; (global-set-key (kbd "<C-s-268632083>") 'rk-snpt)
;; (defun rk-snpt () 
;;   (interactive)
;;   (let ((command 
;; 	 (if (string-match "[.]"
;; 			   (buffer-substring
;; 			    (line-beginning-position)
;; 			    (line-end-position)))
;; 	     "snpt"
;; 	   (concat "snpt -l " (file-name-extension buffer-file-name))
;; 	   )
;; 	 ))
;;     (shell-command-on-region
;;      (line-beginning-position)
;;      (line-end-position)
;;      command t t)
;;     ))
;; (defun rk-open-snpt () 
;;   (interactive)
;;   (let ((command 
;; 	 (if (string-match "[.]"
;; 			   (buffer-substring
;; 			    (line-beginning-position)
;; 			    (line-end-position)))
;; 	     "snpt"
;; 	   (concat "snpt -o -l " (file-name-extension buffer-file-name))
;; 	   )
;; 	 ))
;;     (shell-command-on-region
;;      (line-beginning-position)
;;      (line-end-position)
;;      command)
;;     ))

;; Print Variable
;; (global-set-key (kbd "M-p") 'rk-print-variable)
;; (defun rk-print-variable () 
;;   (interactive)
;;    (shell-command-on-region
;;      (line-beginning-position)
;;      (line-end-position)
;;      (concat "printvariable -l " (file-name-extension buffer-file-name))
;;      t t
;;      ))

;; Window Management
;; (global-set-key (kbd "C-M-s-<left>") 'rk-set-frame-thin)
;; (global-set-key (kbd "C-M-s-<right>") 'rk-set-frame-wide)
;; (global-set-key (kbd "C-M-s-<up>") 'rk-set-frame-short)
;; (global-set-key (kbd "C-M-s-<down>") 'rk-set-frame-tall)
;; (defun rk-set-frame-short ()
;;   (interactive)
;;   (set-frame-height (selected-frame) 35))
;; (defun rk-set-frame-tall ()
;;   (interactive)
;;   (set-frame-height (selected-frame) 60))
;; (defun rk-set-frame-thin ()
;;   (interactive)
;;   (set-frame-width (selected-frame) 80))
;; (defun rk-set-frame-wide ()
;;   (interactive)
;;   (set-frame-width (selected-frame) 160))
;; (global-set-key (kbd "M-s-<down>") 'split-window-below)
;; (global-set-key (kbd "M-s-<right>") 'split-window-right)


;; rgrep
;; (global-set-key (kbd "s-F") 'rk-rgrep-project)
;; (defun rk-rgrep-project (regexp)
;;   "Search project for regexp"
;;   (interactive
;;    (progn
;;      (grep-compute-defaults)
;;      (list (read-regexp
;; 	    (concat "rgrep " (format "%s: " (rk-project-directory))) 
;; 	    ))))
;;   (rgrep regexp "*" (rk-project-directory)))
;; ;; Hide rgrep header
;; (defun rk-delete-grep-header ()
;;   (save-excursion
;;     (with-current-buffer grep-last-buffer
;;       (goto-line 5)
;;       (narrow-to-region (point) (point-max)))))
;; (defadvice rgrep (after rk-delete-grep-header activate)
;;   (rk-delete-grep-header))


(provide 'rk-keybindings)
