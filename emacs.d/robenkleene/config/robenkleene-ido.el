;;; robenkleene-ido.el --- robenkleene-ido
;;; Commentary:
;;; Code:

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
    ;; The `default-directory' means inserted file is always relative to the current directory.
    (insert (file-relative-name (robenkleene/ido-recursive-get-file dir)
                                default-directory))
    )
  )

(defun robenkleene/ido-source-control-recursive-find-file ()
  "Find directory recursively in DIR."
  (interactive)
  (find-file (robenkleene/ido-recursive-get-file (locate-dominating-file default-directory
                                                                         ".git")))
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
      (find-file (gethash (ido-completing-read "Find z: " ido-list) key-to-path))
      )
    )
  )

(provide 'robenkleene-ido)
;;; robenkleene-ido.el ends here
