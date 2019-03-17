;;; robenkleene-functions.el --- robenkleene-functions
;;; Commentary:
;;; Code:

(defun robenkleene/edit-init ()
  "Edit init."
  (interactive)
  (find-file "~/.emacs.d/robenkleene/robenkleene.el")
  )

(defun robenkleene/system-is-mac ()
  "Test if this is a Mac."
  (string-equal system-type "darwin"))

(defun robenkleene/open-terminal-window ()
  "Open a new Terminal window at the current path."
  (interactive)
  (shell-command "open -a Terminal .")
  )

(defun robenkleene/kill-region-or-backward-word ()
  "If the region is active and non-empty, call `kill-region'.
Otherwise, call `backward-kill-word'."
  (interactive)
  (call-interactively
   (if (use-region-p) 'kill-region 'backward-kill-word)))

(defun robenkleene/empty-frame ()
  "Open a new frame with a buffer named Untitled."
  (interactive)
  (switch-to-buffer-other-frame (generate-new-buffer "Untitled")))

(defun robenkleene/reveal-in-finder ()
  "Open a new Finder window at the current path."
  (interactive)
  (if (buffer-file-name)
      (shell-command (concat "open -R "
                             (shell-quote-argument buffer-file-name))
                     )
    (shell-command "open .")
    )
  )

(defun robenkleene/slug-project (title)
  "Create a new slug project with TITLE."
  (interactive (list (read-from-minibuffer "Title: ")))
  (find-file
   (shell-command-to-string (concat "~/.bin/slug_project "
                                    (shell-quote-argument title)
                                    " | tr -d '\n'")
                            )
   )
  )

(defun robenkleene/generate-tags ()
  "Generate tags."
  (interactive)
  (compile "~/.bin/generate_tags -e"))

(defun robenkleene/refresh-tags ()
  "Load the tags file relative to the current buffer."
  (interactive)
  (let ((tags-file (locate-dominating-file default-directory "TAGS")))
    (when tags-file
      (visit-tags-table tags-file)
      )
    )
  )

(defun robenkleene/external-editor ()
  "Open a region or buffer in external editor."
  (interactive)
  (if (use-region-p)
      (progn
        (shell-command-on-region (region-beginning) (region-end) "mate -a")
        (deactivate-mark)
        )
    (if (buffer-file-name)
        (shell-command (concat "mate -a "
                               (shell-quote-argument buffer-file-name))
                       )
      )
    )
  )

(defun robenkleene/go-to-project-root ()
  "Got to the project root."
  (interactive)
  (let ((dir (shell-command-to-string "git rev-parse --show-toplevel 2> /dev/null | tr -d '\n'")))
    (if dir
        (find-file dir)
      )
    )
  )

(defun robenkleene/ido-key-for-path (path strip)
  "Return a good key for ido based on PATH, remove STRIP."
  (let* (
         (short-path (replace-regexp-in-string strip "" path))
         (best-path (if short-path short-path path))
         (container-dir (file-name-directory best-path))
         (dirname (file-name-nondirectory best-path))
         )
    (if container-dir
        (concat dirname " " container-dir)
      dirname
      )
    )
  )

(defun robenkleene/ido-recursive-get-file (dir)
  "Find directory recursively in DIR."
  (let (project-files key-to-path)
    (setq project-files
          (split-string
           (shell-command-to-string
            (concat "fd "
                    " --type f --hidden --exclude .git --exclude .DS_Store . "
                    dir
                    )) "\n"))
    (setq key-to-path (make-hash-table :test 'equal))
    (let (ido-list)
      (mapc (lambda (path)
              (let ((key (robenkleene/ido-key-for-path path dir)))
                (puthash key path key-to-path)
                (push key ido-list)
                )
              )
            project-files)
      (gethash (ido-completing-read "Find file: " ido-list) key-to-path)
      )
    )
  )

(defun robenkleene/ido-recursive-get-dir (dir)
  "Find file recursively in DIR."
  (let (project-files key-to-path)
    (setq project-files
          (split-string
           (shell-command-to-string
            (concat "fd "
                    " --type d --hidden --exclude .git . "
                    dir
                    )) "\n"))
    (setq key-to-path (make-hash-table :test 'equal))
    (let (ido-list)
      (mapc (lambda (path)
              (let ((key (robenkleene/ido-key-for-path path dir)))
                (puthash key path key-to-path)
                (push key ido-list)
                )
              )
            project-files)
      (gethash (ido-completing-read "Find dir: " ido-list) key-to-path)
      )
    )
  )

(defun robenkleene/ido-recursive-find-dir (dir)
  "Find file recursively in DIR."
  (interactive
   (list
    (if current-prefix-arg
        (read-directory-name "Base directory: ")
      (expand-file-name default-directory)
      )
    )
   )
  (let ((current-prefix-arg nil))
    (find-file (robenkleene/ido-recursive-get-dir dir))
    )
  )

(defun robenkleene/ido-recursive-insert-dir (dir)
  "Find and insert file recursively in DIR."
  (interactive
   (list
    (if current-prefix-arg
        (read-directory-name "Base directory: ")
      (expand-file-name default-directory)
      )
    )
   )
  (let ((current-prefix-arg nil))
    (insert (robenkleene/ido-recursive-get-dir dir))
    )
  )

(defun robenkleene/ido-recursive-find-dir-other-window (dir)
  "Find file recursively in DIR."
  (interactive
   (list
    (if current-prefix-arg
        (read-directory-name "Base directory: ")
      (expand-file-name default-directory)
      )
    )
   )
  (let ((current-prefix-arg nil))
    (find-file-other-window (robenkleene/ido-recursive-get-dir dir))
    )
  )

(defun robenkleene/ido-recursive-insert-file (dir)
  "Find and insert directory recursively in DIR."
  (interactive
   (list
    (if current-prefix-arg
        (read-directory-name "Base directory: ")
      (expand-file-name default-directory)
      )
    )
   )
  (let ((current-prefix-arg nil))
    (insert (file-relative-name (robenkleene/ido-recursive-get-file dir)))
    )
  )

(defun robenkleene/ido-recursive-find-file (dir)
  "Find directory recursively in DIR."
  (interactive
   (list
    (if current-prefix-arg
        (read-directory-name "Base directory: ")
      (expand-file-name default-directory)
      )
    )
   )
  (let ((current-prefix-arg nil))
    (find-file (robenkleene/ido-recursive-get-file dir))
    )
  )

(defun robenkleene/ido-recursive-find-file-other-window (dir)
  "Find directory recursively in DIR."
  (interactive
   (list
    (if current-prefix-arg
        (read-directory-name "Base directory: ")
      (expand-file-name default-directory)
      )
    )
   )
  (let ((current-prefix-arg nil))
    (find-file-other-window (robenkleene/ido-recursive-get-file dir))
    )
  )

(defun robenkleene/ido-z ()
  "Find recent directory."
  (interactive)
  (let ((current-prefix-arg nil) project-files key-to-path)
    (setq project-files
          (split-string
           (shell-command-to-string "fasd -Rdl")
           "\n"))
    (setq key-to-path (make-hash-table :test 'equal))
    (let (ido-list)
      (mapc (lambda (path)
              (let ((key (robenkleene/ido-key-for-path path (getenv "HOME"))))
                (puthash key path key-to-path)
                (push key ido-list)
                )
              )
            project-files)
      (find-file (gethash (ido-completing-read
                           "Find z: "
                           ido-list) key-to-path))
      )
    )
  )

(defun robenkleene/open-in-xcode ()
  "Open file in Xcode."
  (interactive)
  (if (buffer-file-name)
      (shell-command (concat "open -a \"Xcode\" "
                             (shell-quote-argument buffer-file-name))
                     )
    )
  )

(defun robenkleene/other-window-shell ()
  "Open shell in other window."
  (interactive)
  (switch-to-buffer-other-window "*shell*")
  (shell))

(defun robenkleene/highlight-keywords ()
  "Highlight keywords."
  (interactive)
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t)))
  )

(defvar robenkleene/scratch-directory-path "~/Development/Scratch/Source/")
(defvar robenkleene/scratch-file-name "source")
(defun robenkleene/scratch-for-buffer ()
  "Open scratch file for current buffer."
  (interactive)
  (let ((extension (file-name-extension (buffer-file-name))))
    (if extension
        (let ((scratch-file-name
               (format "%s%s.%s"
                       robenkleene/scratch-directory-path
                       robenkleene/scratch-file-name
                       extension
                       )
               )
              )
          (find-file-other-window scratch-file-name)
          )
      )
    )
  )

(defvar
  robenkleene/documentation-directory-path
  "~/Documentation/")

(defun robenkleene/documentation ()
  "Open Emacs documentation directory."
  (interactive)
  (view-file-other-window
   (robenkleene/ido-recursive-get-file
    robenkleene/documentation-directory-path))
  )

(defvar robenkleene/org-directory-path "~/Development/Scratch/Org")
(defun robenkleene/emacs-org ()
  "Open Emacs documentation directory."
  (interactive)
  (find-file-other-window robenkleene/org-directory-path)
  )

(defun robenkleene/print-variable ()
  "Replace the current line with a variable print statement."
  (interactive)
  (let ((extension (file-name-extension (buffer-file-name))))
    (if extension
        (shell-command-on-region
         (line-beginning-position)
         (line-end-position)
         (format "variable-print -l %s" extension)
         nil
         t)
      )
    )
  )

(defun robenkleene/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))
        )
  )
(defalias 'kill-other-buffers 'robenkleene/kill-other-buffers)

(defun robenkleene/grep-parameters (&optional regexp files dir)
  "Get the parameters for grep.  REGEXP FILES DIR."
  (require 'grep)
  (if (equal current-prefix-arg nil)
      (list (or regexp (grep-read-regexp))
            files
            dir)
    ;; `grep-files-aliases' defaults to a version of `all' that's
    ;; incompatible with `rg'
    (let* ((grep-files-aliases '(("all" . "*.*")))
           (final-regexp (or regexp (grep-read-regexp)))
           (final-files (or files (grep-read-files final-regexp)))
           (final-dir (or dir
                          (read-directory-name "Base directory: "
                                               nil
                                               default-directory
                                               t)
                          )
                      )
           )
      (list final-regexp final-files final-dir)
      )
    )
  )

(defun robenkleene/bounds-of-selection-or-word ()
  "Get the bounds of the selection or word."
  (if (use-region-p)
      (list (region-beginning) (region-end))
    (let ((bounds (bounds-of-thing-at-point 'word)) )
      (list (car bounds) (cdr bounds))
      )
    )
  )

(defun robenkleene/selection-or-word ()
  "My function description."
  (let ((selection (apply 'buffer-substring-no-properties
                          (robenkleene/bounds-of-selection-or-word))))
    (if (= (length selection) 0) nil selection))
  )

(defun robenkleene/rg-selection ()
  "Run `rg' on the selection.  BEG END."
  (interactive)
  (apply 'robenkleene/rg
         (robenkleene/grep-parameters (robenkleene/selection-or-word))
         )
  )

;; (defun robenkleene/rg-selection-in-directory (dir)
;;   "Call `rg' in the current directory or with prefix specify a directory."
;;   (interactive
;;    (list
;;     (if current-prefix-arg
;;         (read-directory-name "Base directory: ")
;;       default-directory)))
;;   (let ((current-prefix-arg nil))
;;     (apply 'robenkleene/rg
;;            (robenkleene/grep-parameters (robenkleene/selection-or-word)
;;                                         nil
;;                                         dir)
;;            )
;;     )
;;   )

(defvar robenkleene/rg-command-files)
(setq robenkleene/rg-command-files
      "rg --smart-case --no-heading --glob \"<F>\" <R> <D>")
(defvar robenkleene/rg-command)
(setq robenkleene/rg-command "rg --smart-case --no-heading <R> <D>")

(defun robenkleene/source-control-directory ()
  "Return the source control directory or nil."
  (locate-dominating-file default-directory
                          ".git")
  )

(defun robenkleene/rg-source-control ()
  "Run `rg' in source control directory."
  (interactive)
  (cd (robenkleene/source-control-directory))
  (call-interactively 'robenkleene/rg)
  )

(defun robenkleene/source-control-open-web (&optional arg)
  "Open a new Finder window at the current path with ARG."
  (interactive)
  (shell-command-to-string (concat "~/.bin/source_control_open_site "
                                   arg)
                           )
  )

(defun robenkleene/rg (regexp &optional files dir)
  "Search for REGEXP with optional FILES and DIR."
  (interactive (robenkleene/grep-parameters))
  (require 'grep)
  (let ((default-directory (or dir default-directory))
        (command (grep-expand-template
                  (if (equal files nil)
                      robenkleene/rg-command
                    robenkleene/rg-command-files)
                  regexp
                  files))
        )
    (compilation-start command 'grep-mode)
    )
  )

(defun robenkleene/forward-block (&optional n)
  "Move to next text block N."
  (interactive "p")
  (let ((n (if (null n) 1 n)))
    (re-search-forward "\n[\t\n ]*\n+" nil "NOERROR" n)
    (forward-line -1)
    )
  )

(defun robenkleene/backward-block (&optional n)
  "Move cursor to previous text block N."
  (interactive "p")
  (let ((n (if (null n) 1 n))
        ($i 1))
    (while (<= $i n)
      (if (re-search-backward "\n[\t\n ]*\n+" nil "NOERROR")
          (progn (skip-chars-backward "\n\t "))
        (progn (goto-char (point-min))
               (setq $i n)))
      (setq $i (1+ $i))))
  (forward-line)
  )

(defvar-local robenkleene/format-program nil)
(defvar-local robenkleene/format-function nil)
(defun robenkleene/format ()
  "Run buffer or region through format program."
  (interactive)
  (if (bound-and-true-p robenkleene/format-function)
      (call-interactively robenkleene/format-function)
    (if (bound-and-true-p robenkleene/format-program)
        (robenkleene/shell-command-on-buffer-or-region
         robenkleene/format-program)
      (message "No format program defined.")
      )
    )
  )

(defvar-local robenkleene/evaluate-buffer-or-region-function nil)
(defun robenkleene/evaluate-buffer-or-region ()
  "Evaluate the buffer or region."
  (interactive)
  (if (bound-and-true-p robenkleene/evaluate-buffer-or-region-function)
      (call-interactively robenkleene/evaluate-buffer-or-region-function)
    (message "No evaluate function defined.")
    )
  )

(defvar-local robenkleene/run-compile-program nil)
(defun robenkleene/run ()
  "Run buffer or region through format program."
  (interactive)
  (compile (concat robenkleene/run-compile-program
                   " "
                   (shell-quote-argument buffer-file-name)))
  )

(defun robenkleene/shell-command-on-buffer-or-region (command)
  "Pipe the current buffer or region through COMMAND."
  (interactive "r")
  (if (use-region-p)
      (progn
        (shell-command-on-region (region-beginning) (region-end) command t t)
        (deactivate-mark)
        )
    (let ((p (point)))
      (save-excursion
        (shell-command-on-region (point-min) (point-max) command t t)
        )
      (goto-char p)
      )
    )
  )

(defun robenkleene/open-scratch-other-window ()
  "Open scratch for current buffer in other window."
  (interactive)
  (let ((file (robenkleene/scratch-for-file (buffer-file-name))))
    (if (bound-and-true-p file)
        (find-file-other-window file)
      (message "No file found.")
      )
    )
  )

(defun robenkleene/open-scratch ()
  "Open scratch file for current buffer."
  (interactive)
  (let ((file (robenkleene/scratch-for-file (buffer-file-name))))
    (if (bound-and-true-p file)
        (find-file file)
      (message "No file found.")
      )
    )
  )

(defun robenkleene/scratch-for-file (file)
  "Return the path to the scratch file for FILE."
  (let ((extension (file-name-extension file))
        (scratch-directory "~/Development/Scratch/Untitled/")
        directories
        file)
    (if (bound-and-true-p extension)
        (setq directories
              (directory-files scratch-directory
                               nil
                               (concat "^[^.].*\." extension)))
      (message "No valid extension found.")
      )
    (expand-file-name (car directories) scratch-directory)
    )
  )

(provide 'robenkleene-functions)
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
;;; robenkleene-functions.el ends here
