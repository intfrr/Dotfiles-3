(provide 'rk-features-packages)

;; ido-ubiquitous
(rk-install-package-if-missing 'ido-ubiquitous)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; smex
(rk-install-package-if-missing 'smex)
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-<S-SPC>") 'smex)
(global-set-key (kbd "s-'") 'smex)

;; multiple-cursors
(rk-install-package-if-missing 'multiple-cursors)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; exec-path-from-shell
(rk-install-package-if-missing 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Auto-complete
(rk-install-package-if-missing 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(setq ac-auto-show-menu nil)
(setq ac-use-quick-help nil)

;; find-file-in-project
(rk-install-package-if-missing 'find-file-in-project)
(global-set-key (kbd "s-O") 'find-file-in-project)

;; Rainbow Mode
(rk-install-package-if-missing 'rainbow-mode)
