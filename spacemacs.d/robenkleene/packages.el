;;; packages.el --- robenkleene Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq robenkleene-packages
    '(
      ;; package robenkleenes go here
      ))

;; List of packages to exclude.
(setq robenkleene-excluded-packages '(
                                      powerline
                                      ))

;; Like tpope vinegar
(define-key evil-normal-state-map "-" 'dired-jump)
(define-key dired-mode-map (kbd "-") 'dired-up-directory) 
(define-key helm-swoop-map (kbd "C-w") 'backward-kill-word)


;; For each package, define a function robenkleene/init-<package-robenkleene>
;;
;; (defun robenkleene/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
