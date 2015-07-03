;;; robenkleene-dark-theme.el --- An eye-candy theme for Emacser

;; Author: kuanyui<azazabc123@gmail.com>
;; Based on "tango-dark-theme"
;;; Commentary:
;;; Code:

(deftheme robenkleene-dark
  "Face colors for 256 colors terminal (dark background).
Moe, moe, kyun!")

(let* (
       (class '((class color) (min-colors 89)))

      ;;; Basic
      (transparent-background "unspecified-bg")
      (solid-background "#444444")
      ;; Text Colors
      (light-text-foreground "#b2b2b2")
      (dark-text-foreground solid-background)
      (inactive-text "#303030")
      (metadata-text "#ff8700")
      ;; Errors
      (error-background "brightred")
      (error-text-foreground solid-background)
      (error-text "brightred")

      ;; Highlight
      (highlight-background "#005f87")
      (highlight-foreground "brightwhite")

      ;; Prompt
      (prompt-background "#87d787")
      (prompt-foreground "#303030")

      ;; Selection or Region
      (region-background "#585858")
      (region-foreground "brightwhite")

      ;; Highlight with foreground syntax
      (subtle-highlight-background "#1c1c1c")

      ;; Headers
      (header-text "#B0D8FD")

      ;; Diff
      (diff-added-foreground "brightgreen")
      (diff-removed-foreground "brightred")
      (diff-changed-foreground "brightcyan")

      ;; Search
      (search-background region-background)
      (search-foreground region-foreground)

      ;; Modeline & Windows
      (modeline-active-background header-text)
      (modeline-active-foreground dark-text-foreground)
      (modeline-inactive-background solid-background)
      (modeline-inactive-foreground light-text-foreground)

      ;; Link Text
      (link-text "#5EAFD7")

      ;; File lists
      (directory-text link-text)
      (file-text light-text-foreground)
      (line-number metadata-text)
)
  (custom-theme-set-faces
   'robenkleene-dark
   ;; General
   `(default ((,class (:foreground ,light-text-foreground :background ,transparent-background))))
   `(fringe ((,class (:foreground ,light-text-foreground :background ,transparent-background))))
   `(linum ((,class (:foreground ,light-text-foreground :background ,solid-background))))

   ;; Diff: Magit and Git Gutter inheret
   `(diff-added ((,class (:foreground ,diff-added-foreground :background nil :bold nil))))
   `(diff-changed ((,class (:foreground ,diff-changed-foreground :background nil :bold nil))))
   `(diff-removed ((,class (:foreground ,diff-removed-foreground :background nil :bold nil))))

   ;; Highlight
   `(hl-line ((,class (:foreground ,highlight-foreground :background ,highlight-background))))
   `(highlight ((,class (:inherit region))))

   ;; Region
   `(region ((,class (:foreground ,region-foreground :background ,region-background))))

   ;; Evil
   `(evil-ex-substitute-replacement ((,class (:foreground ,diff-changed-foreground :background nil :underline nil))))

   ;; Paren Match
   `(show-paren-match ((,class (:underline t :foreground ,region-foreground :background ,region-background))))
   ;; Does `rainbow-delimiter-mismatched-face' and `rainbow-delimiters-unmatched-face' interfere with this?
   `(show-paren-mismatch ((,class (:background ,error-background :foreground ,error-text-foreground))))

   ;; Search
   `(isearch ((,class (:foreground ,search-foreground :background ,search-background))))
   `(isearch-fail ((,class (:foreground ,error-text :background nil))))
   ;; Matches other then the current one
   `(lazy-highlight ((,class (:foreground ,search-foreground :background ,search-background))))

   ;; Mode line & Windows
   `(mode-line ((,class (:box nil :background ,modeline-active-background :foreground ,modeline-active-foreground))))
   `(mode-line-inactive ((,class (:box nil :background ,modeline-inactive-background :foreground ,modeline-inactive-foreground))))
   `(vertical-border ((,class (:foreground ,solid-background :background ,solid-background))))

   ;; Syntax Highlighting
   `(font-lock-builtin-face ((t (:foreground, "#FFFFB6"))))
   `(font-lock-comment-delimiter-face ((t (:foreground, "#7C7C7C"))))
   `(font-lock-comment-face ((t (:foreground, "#7C7C7C"))))
   `(font-lock-constant-face ((t (:foreground, "#99CC99"))))
   `(font-lock-doc-face ((t (:foreground, "#A8FF60"))))
   `(font-lock-doc-string-face ((t (:foreground, "#A8FF60"))))
   `(font-lock-function-name-face ((t (:foreground, "#FFD2A7"))))
   `(font-lock-keyword-face ((t (:foreground, "#96CBFE"))))
   `(font-lock-negation-char-face ((t (:foreground, "#FF6C60"))))
   `(font-lock-number-face ((t (:foreground, "#FF73FD"))))
   `(font-lock-preprocessor-face ((t (:foreground, "#96CBFE"))))
   `(font-lock-reference-face ((t (:foreground, "#99CC99"))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground, "#E9C"))))
   `(font-lock-regexp-grouping-construct ((t (:foreground, "#E9C"))))
   `(font-lock-string-face ((t (:foreground, "#A8FF60"))))
   `(font-lock-type-face ((t (:foreground, "#FFFFB6"))))
   `(font-lock-variable-name-face ((t (:foreground, "#C6C5FE"))))
   `(font-lock-warning-face ((t (:foreground, "#FF6C60"))))

   ;; Rainbow Delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:bold nil :foreground "#AFD7D7"))))
   `(rainbow-delimiters-depth-2-face ((,class (:bold nil :foreground "#01A6B2"))))
   `(rainbow-delimiters-depth-3-face ((,class (:bold nil :foreground "#B0FFD7"))))
   `(rainbow-delimiters-depth-4-face ((,class (:bold nil :foreground "#D7AFFF"))))
   `(rainbow-delimiters-depth-5-face ((,class (:bold nil :foreground "#00D900"))))
   `(rainbow-delimiters-depth-6-face ((,class (:bold nil :foreground "#D0D0D0"))))
   `(rainbow-delimiters-depth-7-face ((,class (:bold nil :foreground "#999900"))))
   `(rainbow-delimiters-depth-8-face ((,class (:bold nil :foreground "#AFD7FF"))))
   `(rainbow-delimiters-depth-9-face ((,class (:bold nil :foreground "#01A6B2"))))

   ;; TODO: Magit
   ;; `(magit-item-highlight ((,class (:background ,subtle-highlight-background :foreground ,highlight-foreground))))
   `(magit-item-highlight ((,class (:background nil :foreground nil))))
   `(magit-section-title ((,class (:foreground ,header-text :background nil :underline t :bold ,t))))
   `(magit-log-sha1 ((,class (:foreground ,highlight-foreground :background nil :bold t))))
   `(magit-branch ((,class (:foreground ,header-text :background nil :bold t))))
   ;; `(magit-diff-file-header ((,class (:foreground "#ffffff" :background "#8a8a8a" :bold t))))
   ;; `(magit-diff-hunk-header ((,class (:foreground "#c6c6c6" :background "#6c6c6c" :bold t))))
   `(magit-diff-file-header ((,class (:foreground ,highlight-foreground :background nil :underline t :bold t))))
   `(magit-diff-hunk-header ((,class (:foreground ,light-text-foreground :background nil :bold t))))
   `(magit-diff-none ((,class (:foreground ,inactive-text))))
   ;; Unchanged
   `(magit-diff-merge-current ((,class (:foreground "#d18aff"))))
   `(magit-diff-merge-diff3-separator ((,class (:foreground "#d18aff"))))
   `(magit-diff-merge-proposed ((,class (:foreground "#d18aff"))))
   `(magit-diff-merge-separator ((,class (:foreground "#d18aff"))))
   `(magit-header ((,class (:foreground "#1f5bff" :background "#ffffff" :underline "#1f5bff"))))
   `(magit-item-mark ((,class (:foreground "#ffffff" :background ,highlight-background))))
   `(magit-log-author ((,class (:foreground ,prompt-background :background "#3a3a3a"))))
   `(magit-log-author-date-cutoff ((,class (:foreground "#ef2929" :bold t))))
   `(magit-log-date ((,class (:foreground "#c6c6c6" :background "#3a3a3a"))))
   `(magit-log-graph ((,class (:foreground "#c6c6c6" :background "#3a3a3a"))))
   `(magit-log-head-label-bisect-bad ((,class (:foreground "#a40000" :background "#ffafaf"))))
   `(magit-log-head-label-bisect-good ((,class (:foreground ,prompt-foreground :background ,prompt-background))))
   `(magit-log-head-label-bisect-skip ((,class (:foreground "#c4a000" :background "#ffd787"))))
   `(magit-log-head-label-default ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t :underline t))))
   `(magit-log-head-label-head ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t :underline t))))
   `(magit-log-head-label-local ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t :underline t))))
   `(magit-log-head-label-patches ((,class (:foreground "#d75f00" :background "#ffaf87" :bold t :underline t))))
   `(magit-log-head-label-remote ((,class (:foreground "#005faf" :background "#afd7ff" :bold t :underline t))))
   `(magit-log-head-label-tags ((,class (:foreground "#875f00" :background "#ffffaf" :bold t :underline t))))
   `(magit-log-head-label-wip ((,class (:foreground "#c6c6c6" :background "#8a8a8a"))))
   `(magit-log-message ((,class (:foreground "#c6c6c6" :background nil))))
   `(magit-log-reflog-label-amend ((,class (:foreground "#ff1f8b" :background "#ffafd7"))))
   `(magit-log-reflog-label-checkout ((,class (:foreground ,prompt-foreground :background ,prompt-background))))
   `(magit-log-reflog-label-cherry-pick ((,class (:foreground "#d75f00" :background "#ffd787"))))
   `(magit-log-reflog-label-commit ((,class (:foreground "#875f00" :background "#ffff87"))))
   `(magit-log-reflog-label-merge ((,class (:foreground "#6c0099" :background "#af87ff"))))
   `(magit-log-reflog-label-other ((,class (:foreground "#ffffff" :background "#4e4e4e"))))
   `(magit-log-reflog-label-rebase ((,class (:foreground "#005f5f" :background "#87d7af"))))
   `(magit-log-reflog-label-remote ((,class (:foreground "#005faf" :background "#afd7ff"))))
   `(magit-log-reflog-label-reset ((,class (:foreground "#a40000" :background "#ffafaf"))))
   `(magit-process-ng ((,class (:foreground "#a40000" :background "#ffafaf" :underline t :bold t))))
   `(magit-process-ok ((,class (:foreground ,prompt-foreground :background ,prompt-background :underline t :bold t))))
   `(magit-signature-bad ((,class (:foreground "#ef2929"))))
   `(magit-signature-good ((,class (:foreground ,prompt-background))))
   `(magit-signature-none ((,class (:foreground "#c6c6c6"))))
   `(magit-signature-untrusted ((,class (:foreground "#00d7af"))))
   `(magit-tag ((,class (:foreground ,highlight-background :background "#afd7ff"))))
   `(magit-valid-signature ((,class (:foreground "#00d7af" :background "#303030" :bold t))))
   `(magit-whitespace-warning-face ((,class (:foreground "#ffffff" :background "#a40000" :bold t))))

   ;; Helm
   `(helm-source-header ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t))))
   ;; Uncustomized
   ;; `(helm-bookmark-directory ((,class (:foreground ,link-text :background "#303030" :bold t))))
   `(helm-bookmark-file ((,class (:foreground "#875f00" :background "#ffff87"))))
   `(helm-bookmark-info ((,class (:foreground ,prompt-foreground :background ,prompt-background))))
   `(helm-buffer-directory ((,class (:foreground ,link-text :bold t))))
   `(helm-buffer-process ((,class (:foreground "#ff4ea3"))))
   `(helm-buffer-saved-out ((,class (:foreground "#dd0000" :background "#303030"))))
   `(helm-buffer-size ((,class (:foreground ,line-number))))
   `(helm-candidate-number ((,class (:foreground ,highlight-background :background "#ffffff"))))
   ;; `(helm-ff-directory ((,class (:foreground ,link-text :background "#303030" :bold t))))
   `(helm-ff-excutable ((,class (:foreground ,prompt-background :background "#303030" :bold t))))
   `(helm-ff-file ((,class (:foreground "#c6c6c6" :background "#303030"))))
   `(helm-ff-invalid-symlink ((,class (:foreground "#c6c6c6" :background "#dd0000"))))
   `(helm-ff-prefix ((,class (:foreground "#c6c6c6" :background ,line-number))))
   `(helm-grep-cmd-line ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t))))
   `(helm-grep-file ((,class (:foreground "#d18aff"))))
   `(helm-grep-finish ((,class (:foreground ,prompt-background))))
   `(helm-grep-lineno ((,class (:foreground ,line-number))))
   `(helm-grep-match ((,class (:background "#3a3a3a" :foreground "#fce94f" :bold t))))
   `(helm-grep-running ((,class (:foreground "#ff4b4b" :background nil))))
   `(helm-header ((,class (:foreground ,highlight-background :background "#afd7ff"))))
   `(helm-lisp-show-completion ((,class (:foreground "#4e4e4e" :background ,prompt-background))))
   ;; `(helm-match ((,class (:foreground ,prompt-background :background "#303030" :bold t))))
   `(helm-selection ((,class (:foreground nil :background ,highlight-background))))
   `(helm-selection-line ((,class (:foreground nil :background "#875f00"))))


   ;;; Uncustomized

   ;; Flycheck
   `(flycheck-error ((,class (:background "#dd0000" :foreground "#ffffff" :bold t))))
   `(flycheck-warnline ((,class (:background ,line-number :foreground "#ffffff" :bold t))))

   ;; Highlighting faces
   ;; `(linum-highlight-face ((,class (:background ,prompt-background :foreground "#3a3a3a"))))
   ;; `(hl-line ((,class (:background "#4e4e4e"))))
   ;; `(highlight-symbol-face ((,class (:background "#4e4e4e"))))
   `(secondary-selection ((,class (:background ,highlight-background :foreground "#ffffff"))))
   `(lazy-highlight ((,class (:background "#ff1f8b" :foreground "#c6c6c6"))))
   `(trailing-whitespace ((,class (:background "#a40000"))))
   `(header-line ((,class (:background ,highlight-background :foreground "#ffffff"))))
   `(help-argument-name ((,class (:foreground "#ff7bbb" :italic t))))


   ;; Escape and prompt faces
   `(minibuffer-prompt ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t))))
   `(escape-glyph ((,class (:foreground "#c4a000"))))
   `(error ((,class (:foreground "#ff4b4b"))))
   `(warning ((,class (:foreground "#ffaf5f"))))
   `(success ((,class (:foreground ,prompt-background))))


   ;; org-mode
   `(org-document-title ((,class (:foreground "#afd7ff" :background "#303030" :weight bold))))
   `(org-document-info ((,class (:foreground ,link-text :background "#303030" :weight bold))))
   `(org-document-info-keyword ((,class (:foreground "#ffaf5f" :background "#6c6c6c"))))
   `(org-archived ((,class (:slant italic))))
   `(org-checkbox ((,class (:background "#c6c6c6" :foreground "#4e4e4e"
                                        :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground "#afd7ff" :underline t))))
   `(org-done ((,class (:bold t :weight bold :foreground ,prompt-foreground :background ,prompt-background
                              :box (:line-width 1 :style none)))))
   `(org-todo ((,class (:bold t :weight bold :foreground "#a40000" :background "#ffaf87"
                              :box (:line-width 1 :style none)))))
   `(org-level-1 ((,class (:foreground ,link-text))))
   `(org-level-2 ((,class (:foreground ,prompt-background))))
   `(org-level-3 ((,class (:foreground ,line-number))))
   `(org-level-4 ((,class (:foreground "#00d7af"))))
   `(org-level-5 ((,class (:foreground "#ef2929"))))
   `(org-level-6 ((,class (:foreground "#af5fff"))))
   `(org-level-7 ((,class (:foreground "#ff4ea3"))))
   `(org-level-8 ((,class (:foreground "#ffd700"))))
   `(org-tag ((,class (:background "#4e4e4e" :foreground "#c6c6c6" :bold t :weight bold))))

   `(org-column ((,class (:background "#3a3a3a" :foreground "#4e4e4e"))))
   `(org-column-title ((,class (:background "#afd7ff" :foreground "#303030" :underline t :weight bold))))
   `(org-agenda-structure ((,class (:foreground "#00ac8a" :background nil :bold t))))
   `(org-deadline-announce ((,class (:foreground "#a40000"))))
   `(org-scheduled ((,class (:foreground "#b2b2b2"))))
   `(org-scheduled-previously ((,class (:foreground "#ef2929"))))
   `(org-scheduled-today ((,class (:foreground ,link-text))))
   `(org-special-keyword ((,class (:background "#4e4e4e" :foreground "#c6c6c6"))))
   `(org-table ((,class (:background "#4e4e4e" :foreground "#c6c6c6"))))
   `(org-time-grid ((,class (:foreground "#8a8a8a"))))
   `(org-upcoming-deadline ((,class (:foreground "#ef2929"))))
   `(org-warning ((,class (:bold t :foreground "#ffffff" :background "#a40000"))))
   `(org-formula ((,class (:foreground "#af5fff"))))
   `(org-headline-done ((,class (:foreground ,prompt-background))))
   `(org-hide ((,class (:foreground "#303030"))))
   `(org-code ((,class (:foreground ,link-text :background "#3a3a3a"))))
   `(org-link ((,class (:foreground ,link-text :underline t))))
   `(org-footnote ((,class (:foreground "#ff1f8b"))))
   `(org-ellipsis ((,class (:foreground "#dd0000"))))
   `(org-agenda-clocking ((,class (:foreground ,highlight-background :background "#afd7ff" :bold t))))
   `(org-agenda-date ((,class (:foreground ,link-text :background "#303030" :underline nil))))
   `(org-agenda-date-weekend ((,class (:foreground "#d18aff" :underline nil :bold nil))))
   `(org-agenda-date-today ((,class (:foreground "#afd7ff" :background "#6c6c6c" :slant italic :weight bold))))
   `(org-agenda-column-dateline ((,class (:foreground "#ffffff" :background "#4e4e4e" :underline t))))
   `(org-agenda-todo ((,class (:foreground "#ffffff" :background "#dd0000"))))
   `(org-agenda-done ((,class (:foreground ,prompt-background :background nil))))
   `(org-agenda-dimmed-todo-face ((,class (:foreground "#ffffff" :background "#dd0000"))))
   `(org-priority ((,class (:foreground "#ef2929" :background ,nil))))
   `(org-block ((,class (:foreground ,link-text :background "#3a3a3a"))))
   `(org-block-background ((,class (:foreground nil :background "#3a3a3a"))))
   `(org-block-begin-line ((,class (:foreground "#ffffff" :background ,highlight-background))))
   `(org-block-end-line ((,class (:foreground "#4e4e4e" :background "#3a3a3a"))))
   `(org-quote ((,class (:foreground ,link-text :background "#4e4e4e"))))
   `(org-mode-line-clock ((,class (:foreground ,highlight-background :background "#afd7ff" :bold t))))
   `(org-mode-line-clock-overrun ((,class (:foreground "#ffffff" :background "#ef2929" :bold t))))
   `(org-verbatim ((,class (:foreground ,link-text :background "#4e4e4e" :bold nil))))

   ;; outline
   `(outline-1 ((,class (:foreground ,link-text))))
   `(outline-2 ((,class (:foreground ,prompt-background))))
   `(outline-3 ((,class (:foreground ,line-number))))
   `(outline-4 ((,class (:foreground "#00d7af"))))
   `(outline-5 ((,class (:foreground "#ef2929"))))
   `(outline-6 ((,class (:foreground "#af5fff"))))
   `(outline-7 ((,class (:foreground "#ff4ea3"))))
   `(outline-8 ((,class (:foreground "#ffd700"))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face ((,class (:foreground "#c6c6c6"))))
   `(undo-tree-visualizer-current-face ((,class (:foreground ,prompt-background :weight bold))))
   `(undo-tree-visualizer-active-branch-face ((,class (:foreground "#dd0000"))))
   `(undo-tree-visualizer-register-face ((,class (:foreground "#ffd700"))))

   ;; Markdown-mode
   `(markdown-blockquote-face ((,class (:foreground ,line-number :background "#4e4e4e" :italic t))))
   `(markdown-bold-face ((,class (:foreground "#c6c6c6" :bold t))))
   `(markdown-comment-face ((,class (:foreground "#8a8a8a" :italic t))))
   `(markdown-header-delimiter-face ((,class (:foreground "#5faf00" :bold t))))
   `(markdown-header-face ((,class (:foreground ,prompt-background :bold t))))
   `(markdown-header-rule-face ((,class (:foreground ,prompt-background :bold t))))
   `(markdown-header-face-1 ((,class (:foreground ,prompt-background :bold t))))
   `(markdown-header-face-2 ((,class (:foreground ,prompt-background :bold t))))
   `(markdown-header-face-3 ((,class (:foreground ,prompt-background :bold t))))
   `(markdown-header-face-4 ((,class (:foreground ,prompt-background :bold t))))
   `(markdown-header-face-5 ((,class (:foreground ,prompt-background :bold t))))
   `(markdown-header-face-6 ((,class (:foreground ,prompt-background :bold t))))
   `(markdown-link-face ((,class (:foreground "#ff7bbb" :underline t))))
   `(markdown-inline-code-face ((,class (:foreground ,link-text :background "#4e4e4e"))))
   `(markdown-italic-face ((,class (:foreground "#c6c6c6" :italic t :underline "#c6c6c6"))))
   `(markdown-list-face ((,class (:foreground ,prompt-background :background "#303030" :bold t))))
   `(markdown-math-face ((,class (:foreground "#ff7bbb"))))
   `(markdown-missing-link-face ((,class (:foreground "#ef2929" :bold t))))
   `(markdown-pre-face ((,class (:foreground ,link-text))))
   `(markdown-reference-face ((,class (:foreground ,line-number :italic t))))
   `(markdown-url-face ((,class (:foreground "#ff1f8b" :underline "#ff1f8b"))))

   ;; Twittering-mode
   `(twittering-username-face ((,class (:foreground ,link-text :background "#3a3a3a" :bold t :underline t))))
   `(twittering-uri-face ((,class (:foreground ,link-text :underline t))))
   `(twittering-timeline-footer-face ((,class (:foreground "#b2b2b2"))))
   `(twittering-timeline-header-face ((,class (:foreground "#b2b2b2"))))

   ;; Jabber
   `(jabber-activity-face ((,class (:foreground "#ff4ea3"))))
   `(jabber-activity-personal-face ((,class (:foreground "#00d7af"))))
   `(jabber-chat-error ((,class (:foreground "#ffafaf" :background "#dd0000"))))
   `(jabber-chat-prompt-foreign ((,class (:foreground ,line-number))))
   `(jabber-chat-prompt-local ((,class (:foreground ,link-text))))
   `(jabber-chat-prompt-system ((,class (:foreground "#ffd700" :weight bold))))
   `(jabber-chat-text-foreign ((,class (:foreground "#ffffff"))))
   `(jabber-chat-text-local ((,class (:foreground "#b2b2b2"))))
   `(jabber-rare-time-face ((,class (:foreground "#a8a8a8"))))
   `(jabber-roster-user-away ((,class (:foreground ,line-number))))
   `(jabber-roster-user-chatty ((,class (:foreground "#d18aff"))))
   `(jabber-roster-user-dnd ((,class (:foreground "#ef2929"))))
   `(jabber-roster-user-error ((,class (:foreground "#ffafaf" :background "#a40000"))))
   `(jabber-roster-user-offline ((,class (:foreground "#a8a8a8"))))
   `(jabber-roster-user-online ((,class (:foreground ,prompt-background))))
   `(jabber-roster-user-xa ((,class (:foreground "#a8a8a8"))))

   ;; popup
   `(popup-face ((,class (:background "#4e4e4e" :foreground ,link-text))))
   `(popup-isearch-match ((,class (:background "#4e4e4e" :foreground "#ff4ea3" :bold t))))
   `(popup-menu-face ((,class (:background "#4e4e4e" :foreground ,link-text))))
   `(popup-menu-mouse-face ((,class (:background ,prompt-background :foreground "#3a3a3a"))))
   `(popup-menu-selection-face ((,class (:background ,highlight-background :foreground "#afd7ff"))))
   `(popup-menu-summary-face ((,class (:background "#4e4e4e" :foreground ,link-text))))
   `(popup-scroll-bar-background-face ((,class (:background "#4e4e4e" :foreground "#4e4e4e"))))
   `(popup-scroll-bar-foreground-face ((,class (:background "#8a8a8a" :foreground "#b2b2b2"))))
   `(popup-summary-face ((,class (:background "#4e4e4e" :foreground ,link-text))))
   `(popup-tip-face ((,class (:background "#6c6c6c" :foreground "#c6c6c6"))))

   ;; company
   `(company-echo ((,class (:background nil :foreground "#c6c6c6"))))
   `(company-echo-common ((,class (:background "#4e4e4e" :foreground "#ef2929"))))
   `(company-preview ((,class (:background "#303030" :foreground "#ff4ea3"))))
   `(company-preview-common ((,class (:background "#303030" :foreground "#ff4ea3"))))
   `(company-preview-search ((,class (:background "#3a3a3a" :foreground "#ff4ea3" :bold t))))
   `(company-scrollbar-bg ((,class (:background ,solid-background))))
   `(company-scrollbar-fg ((,class (:background ,light-text-foreground))))
   `(company-template-field ((,class (:background "#ffffaf" :foreground "#3a3a3a"))))
   `(company-tooltip ((,class (:background ,solid-background :foreground ,light-text-foreground))))
   `(company-tooltip-annotation ((,class (:background ,solid-background :foreground ,metadata-text))))
   `(company-tooltip-common ((,class (:background nil :foreground ,highlight-foreground))))
   `(company-tooltip-common-selection ((,class (:background ,highlight-background :foreground nil :bold t))))
   `(company-tooltip-mouse ((,class (:background ,prompt-background :foreground "#303030"))))
   `(company-tooltip-selection ((,class (:background ,highlight-background :foreground ,highlight-foreground))))

   ;; Button and link faces
   `(link ((,class (:underline t :foreground ,link-text))))
   `(link-visited ((,class (:underline t :foreground "#1f5bff"))))

   ;; Gnus
   `(gnus-button ((,class (:weight normal :foreground ,link-text :underline t))))
   `(gnus-cite-1 ((,class (:foreground ,link-text :background "#3a3a3a" :slant italic))))
   `(gnus-cite-10 ((,class (:foreground "#ff7bbb" :background "#3a3a3a" :slant italic))))
   `(gnus-cite-11 ((,class (:foreground "#00d7af" :background "#3a3a3a" :slant italic))))
   `(gnus-cite-2 ((,class (:foreground ,prompt-background :background "#3a3a3a" :slant italic))))
   `(gnus-cite-3 ((,class (:foreground "#ff4ea3" :background "#3a3a3a" :slant italic))))
   `(gnus-cite-4 ((,class (:foreground "#00d7af" :background "#3a3a3a" :slant italic))))
   `(gnus-cite-5 ((,class (:foreground "#ff4b4b" :background "#3a3a3a" :slant italic))))
   `(gnus-cite-6 ((,class (:foreground "#d18aff" :background "#3a3a3a" :slant italic))))
   `(gnus-cite-7 ((,class (:foreground ,line-number :background "#3a3a3a" :slant italic))))
   `(gnus-cite-8 ((,class (:foreground ,link-text :background "#3a3a3a" :slant italic))))
   `(gnus-cite-9 ((,class (:foreground ,prompt-background :background "#3a3a3a" :slant italic))))
   `(gnus-emphasis-highlight-words ((,class (:foreground "#a40000" :background "#ffafaf" :bold t))))
   `(gnus-group-mail-1 ((,class (:foreground ,link-text))))
   `(gnus-group-mail-1-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-mail-1-low ((,class (:foreground "#1f5bff"))))
   `(gnus-group-mail-2 ((,class (:foreground ,line-number))))
   `(gnus-group-mail-2-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-mail-2-low ((,class (:foreground "#ff5d17"))))
   `(gnus-group-mail-3 ((,class (:foreground "#ff4ea3"))))
   `(gnus-group-mail-3-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-mail-3-low ((,class (:foreground "#ff1f8b"))))
   `(gnus-group-mail-low ((,class (:foreground "#c4a000"))))
   `(gnus-group-mail-low-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-news-1 ((,class (:foreground ,link-text))))
   `(gnus-group-news-1-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-news-1-low ((,class (:foreground "#1f5bff"))))
   `(gnus-group-news-2 ((,class (:foreground ,line-number))))
   `(gnus-group-news-2-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-news-2-low ((,class (:foreground "#ff5d17"))))
   `(gnus-group-news-3 ((,class (:foreground "#ff4ea3"))))
   `(gnus-group-news-3-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-news-3-low ((,class (:foreground "#ff1f8b"))))
   `(gnus-group-news-4 ((,class (:foreground "#af5fff"))))
   `(gnus-group-news-4-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-news-4-low ((,class (:foreground "#9a08ff"))))
   `(gnus-group-news-5 ((,class (:foreground "#00d7af"))))
   `(gnus-group-news-5-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-news-5-low ((,class (:foreground "#00ac8a"))))
   `(gnus-group-news-6 ((,class (:foreground ,prompt-background))))
   `(gnus-group-news-6-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-group-news-6-low ((,class (:foreground "#5faf00"))))
   `(gnus-group-news-low ((,class (:foreground "#c4a000"))))
   `(gnus-group-news-low-empty ((,class (:foreground "#8a8a8a"))))
   `(gnus-header-content ((,class (:foreground "#ff7bbb" ))))
   `(gnus-header-from ((,class (:foreground ,link-text :underline t))))
   `(gnus-header-name ((,class (:foreground "#a8a8a8"))))
   `(gnus-header-newsgroups ((,class (:foreground "#ff4ea3"))))
   `(gnus-header-subject ((,class (:foreground "#ffffff" :bold t))))
   `(gnus-server-agent ((,class (:foreground "#8a8a8a"))))
   `(gnus-server-closed ((,class (:foreground "#8a8a8a"))))
   `(gnus-server-denied ((,class (:foreground "#8a8a8a"))))
   `(gnus-server-offline ((,class (:foreground "#8a8a8a"))))
   `(gnus-server-opened ((,class (:foreground "#8a8a8a"))))
   `(gnus-signature ((,class (:slant italic :foreground "#8a8a8a"))))
   `(gnus-splash ((,class (:foreground "#a8a8a8"))))
   `(gnus-summary-cancelled ((,class (:foreground "#8a8a8a" :background "#303030"))))
   `(gnus-summary-high-ancient ((,class (:bold t :foreground "#a40000" :background nil))))
   `(gnus-summary-high-read ((,class (:bold t :foreground "#c6c6c6"))))
   `(gnus-summary-high-ticked ((,class (:slant italic :bold t :foreground "#dd0000" :background nil))))
   `(gnus-summary-high-undownloaded ((,class (:slant italic :foreground "#dd0000" :background nil))))
   `(gnus-summary-high-unread ((,class (:bold t :foreground "#ff4b4b"))))
   `(gnus-summary-low-ancient ((,class (:foreground "#5faf00"))))
   `(gnus-summary-low-read ((,class (:foreground "#c6c6c6"))))
   `(gnus-summary-low-ticked ((,class (:slant italic :foreground ,prompt-background))))
   `(gnus-summary-low-undownloaded ((,class (:slant italic :foreground ,prompt-background))))
   `(gnus-summary-low-unread ((,class (:slant italic :foreground ,prompt-background))))
   `(gnus-summary-normal-ancient ((,class (:foreground "#1f5bff"))))
   `(gnus-summary-normal-read ((,class (:foreground "#c6c6c6"))))
   `(gnus-summary-normal-ticked ((,class (:slant italic :foreground ,link-text))))
   `(gnus-summary-normal-undownloaded ((,class (:slant italic :foreground ,link-text))))
   `(gnus-summary-normal-unread ((,class (:foreground "#afd7ff" :bold t))))
   `(gnus-summary-selected ((,class (:background ,prompt-background :foreground "#005f00"))))

   ;; Dired/Dired+
   `(dired-directory ((,class (:foreground ,directory-text :bold t))))
   `(diredp-file-name ((,class (:foreground ,file-text))))
   ;; Uncustomized
   `(dired-flagged ((,class (:foreground "#ef2929"))))
   `(dired-header ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t))))
   `(dired-ignored ((,class (:foreground "#a8a8a8"))))
   `(dired-mark ((,class (:foreground ,prompt-background))))
   `(dired-marked ((,class (:foreground ,prompt-background))))
   `(dired-perm-write ((,class (:foreground "#dd0000" :bold t))))
   `(dired-symlink ((,class (:foreground "#ff4ea3"))))
   `(dired-warning ((,class (:foreground "#c6c6c6" :background "#a40000" :bold t))))
   `(diredp-compressed-file-suffix ((,class (:foreground "#af5fff"))))
   `(diredp-date-time ((,class (:foreground ,link-text :background "#3a3a3a"))))
   `(diredp-deletion ((,class (:foreground "#c6c6c6", :background "#a40000"))))
   `(diredp-deletion-file-name ((,class (:foreground "#dd0000"))))
   `(diredp-dir-heading ((,class (:foreground "#303030" :background ,prompt-background))))
   `(diredp-dir-priv ((,class (:foreground ,link-text :background "#303030" :bold t))))
   `(diredp-display-msg ((,class (:foreground ,line-number))))
   `(diredp-executable-tag ((,class (:foreground ,prompt-background))))
   `(diredp-file-suffix ((,class (:foreground ,line-number))))
   `(diredp-flag-mark ((,class (:foreground "#c6c6c6" :background "#ff1f8b" :bold t))))
   `(diredp-flag-mark-line ((,class (:foreground "#303030" :background "#ff7bbb"))))
   `(diredp-ignored-file-name ((,class (:foreground "#8a8a8a"))))
   `(diredp-link-priv ((,class (:foreground "#ff1f8b"))))
   `(diredp-mode-line-flagged ((,class (:foreground "#303030" :background ,prompt-background))))
   `(diredp-mode-line-marked ((,class (:foreground "#c6c6c6" :background "#ff1f8b" bold t))))
   `(diredp-no-priv ((,class (:foreground "#c6c6c6" :background "#3a3a3a"))))
   `(diredp-number ((,class (:foreground "#fce94f"))))
   `(diredp-other-priv ((,class (:foreground "#c6c6c6" :background ,highlight-background))))
   `(diredp-rare-priv ((,class (:foreground "#c6c6c6" :background "#af5fff"))))
   `(diredp-symlink ((,class (:foreground "#ff1f8b"))))
   `(diredp-read-priv ((,class (:foreground ,prompt-foreground :background ,prompt-background))))
   `(diredp-write-priv ((,class (:foreground "#0000af" :background "#afd7ff"))))
   `(diredp-exec-priv ((,class (:foreground "#a40000" :background "#ffaf87"))))


   ;; Message faces
   `(message-cited-text ((,class (:foreground ,prompt-background))))
   `(message-header-cc ((,class (:foreground "#afd7ff"))))
   `(message-header-name ((,class (:foreground "#b2b2b2"))))
   `(message-header-newsgroups ((,class (:foreground ,link-text :bold t))))
   `(message-header-other ((,class (:foreground "#ff7bbb"))))
   `(message-header-subject ((,class (:foreground "#ffffff" :bold t))))
   `(message-header-to ((,class (:foreground ,link-text :underline t :bold t))))
   `(message-header-xheader ((,class (:foreground "#a8a8a8"))))
   `(message-mml ((,class (:foreground ,line-number))))
   `(message-separator ((,class (:foreground "#6c6c6c"))))

   ;; Grep
   `(grep-context-face ((,class (:foreground "#dd0000"))))
   `(grep-error-face ((,class (:foreground "#ef2929" :weight bold :underline t))))
   `(grep-hit-face ((,class (:foreground ,prompt-background))))
   `(grep-match-face ((,class (:foreground nil :background nil :inherit match))))

   ;; Diff
   `(diff-context ((,class (:foreground "#6c6c6c"))))
   `(diff-file-header ((,class (:foreground "#303030" :background "#afd7ff" :bold t))))
   `(diff-function ((,class (:foreground "#3a3a3a" :background "#c6c6c6"))))
   `(diff-header ((,class (:foreground ,highlight-background :background "#afd7ff"))))
   `(diff-hunk-header ((,class (:foreground "#afd7ff" :background "#4e4e4e" :bold t))))
   `(diff-index ((,class (:foreground "#3a3a3a" :background "#b2b2b2" :bold t))))
   `(diff-indicator-added ((,class (:foreground "#ffffff" :background "#5faf00" :bold t))))
   `(diff-indicator-changed ((,class (:foreground "#ffffff" :background "#c4a000" :bold t))))
   `(diff-indicator-removed ((,class (:foreground "#ffffff" :background "#a40000" :bold t))))
   `(diff-nonexistent ((,class (:foreground "#ffffff" :background "#a40000" :bold t))))
   `(diff-refine-added ((,class (:foreground "#ffffff" :background ,prompt-foreground :bold t))))
   `(diff-refine-change ((,class (:foreground "#ffffff" :background "#875f00" :bold t))))
   `(diff-refine-removed ((,class (:foreground "#ffffff" :background "#a40000" :bold t))))

   ;; Ediff
   `(ediff-current-diff-A ((,class (:background "#875f00"))))
   `(ediff-current-diff-Ancestor ((,class (:background ,highlight-background))))
   `(ediff-current-diff-B ((,class (:background "#6c0099"))))
   `(ediff-current-diff-C ((,class (:background "#af5f00"))))
   `(ediff-even-diff-A ((,class (:background "#4e4e4e"))))
   `(ediff-even-diff-Ancestor ((,class (:background "#4e4e4e"))))
   `(ediff-even-diff-B ((,class (:background "#4e4e4e"))))
   `(ediff-even-diff-C ((,class (:background "#4e4e4e"))))
   `(ediff-fine-diff-A ((,class (:foreground nil :background "#005f00" :bold t))))
   `(ediff-fine-diff-Ancestor ((,class (:foreground nil :background "#005f00" :bold t))))
   `(ediff-fine-diff-B ((,class (:foreground nil :background "#005f00" :bold t))))
   `(ediff-fine-diff-C ((,class (:foreground nil :background "#005f00" :bold t))))
   `(ediff-odd-diff-A ((,class (:background "#a40000"))))
   `(ediff-odd-diff-Ancestor ((,class (:background "#a40000"))))
   `(ediff-odd-diff-B ((,class (:background "#a40000"))))
   `(ediff-odd-diff-C ((,class (:background "#a40000"))))

   ;; smerge
   `(smerge-refined-change ((,class (:background ,highlight-background :foreground "#ffffff"))))

   ;; Flyspell faces
   `(flyspell-duplicate ((,class (:underline t foreground-color"#ffaf5f"))))
   `(flyspell-incorrect ((,class (:background "#ef2929" :foreground "#c6c6c6" :bold t))))

   ;; Semantic faces
   `(semantic-decoration-on-includes ((,class (:underline "#a8a8a8"))))
   `(semantic-decoration-on-private-members-face
     ((,class (:background "#9a08ff"))))
   `(semantic-decoration-on-protected-members-face
     ((,class (:background "#ff1f8b"))))
   `(semantic-decoration-on-unknown-includes
     ((,class (:background "#a40000"))))
   `(semantic-decoration-on-unparsed-includes
     ((,class (:background "#3a3a3a"))))
   `(semantic-tag-boundary-face ((,class (:overline ,link-text))))
   `(semantic-unmatched-syntax-face ((,class (:underline "#ef2929"))))

   ;; CUA
   `(cua-rectangle ((,class (:background "#ff1f8b" :foreground "#c6c6c6"))))

   ;; Ace-jump
   `(ace-jump-face-background ((,class (:background nil :foreground "#6c6c6c"))))
   `(ace-jump-face-foreground ((,class (:foreground ,line-number :bold t))))


   ;; EShell
   `(eshell-ls-archive ((,class (:foreground "#af5fff"))))
   `(eshell-ls-backup ((,class (:foreground "#4e4e4e"))))
   `(eshell-ls-clutter ((,class (:foreground "#8a8a8a"))))
   `(eshell-ls-directory ((,class (:foreground ,link-text :bold t))))
   `(eshell-ls-executable ((,class (:foreground ,prompt-background))))
   `(eshell-ls-missing ((,class (:foreground "#ffffff" :background "#a40000"))))
   `(eshell-ls-product ((,class (:foreground "#ffffff" :background ,prompt-background))))
   `(eshell-ls-readonly ((,class (:foreground "#ff5d17"))))
   `(eshell-ls-special ((,class (:foreground "#fce94f"))))
   `(eshell-ls-symlink  ((,class (:foreground "#ff4ea3"))))
   `(eshell-ls-unreadable ((,class (:foreground "#8a8a8a"))))
   `(eshell-prompt ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t))))

   ;; Comint prompt (Shell)
   `(eshell-prompt ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t))))

   ;; which-function-mode
   `(which-func ((,class (:foreground "#ffffff" :background ,line-number))))

   ;; Flymake
   `(flymake-warnline ((,class (:underline ,line-number))))
   `(flymake-errline ((,class (:underline "#dd0000"))))


   ;; Malabar
   `(malabar-error-face ((,class (:underline "#dd0000"))))
   `(malabar-warning-face ((,class (:underline ,line-number))))
   `(malabar-info-face ((,class (:underline "#1f5bff"))))

   ;; MMM-Mode
   `(mmm-cleanup-submode-face ((,class (:background "#ffd787"))))
   `(mmm-code-submode-face ((,class (:background "#d7d7ff"))))
   `(mmm-comment-submode-face ((,class (:background "#afd7ff"))))
   `(mmm-declaration-submode-face ((,class (:background "#87ffff"))))
   `(mmm-default-submode-face ((,class (:background "#3a3a3a"))))
   `(mmm-delimiter-face ((,class (:background nil :foreground "#ffffff"))))
   `(mmm-init-submode-face ((,class (:background "#ffafd7"))))
   `(mmm-output-submode-face ((,class (:background "#e6a8df"))))
   `(mmm-special-submode-face ((,class (:background ,prompt-background))))

   ;; Clojure
   `(clojure-test-failure-face ((,class (:underline ,line-number))))
   `(clojure-test-error-face ((,class (:underline "#dd0000"))))
   `(clojure-test-success-face ((,class (:underline "#5faf00"))))

   ;; Javascript
   `(js2-function-param-face ((,class (:foreground "#5faf00"))))
   `(js2-external-variable ((,class (:foreground ,line-number :underline t))))
   `(js2-error ((,class (:foreground "#dd0000" :underline t :bold t))))
   `(js2-warning ((,class (:foreground nil :underline t :bold t))))

   ;; rcirc
   `(rcirc-bright-nick ((,class (:foreground ,link-text :bold t))))
   `(rcirc-dim-nick ((,class (:foreground "#8a8a8a" :bold t))))
   `(rcirc-keyword ((,class (:foreground "#ff4ea3" :bold t))))
   `(rcirc-my-nick ((,class (:foreground ,prompt-background :bold t))))
   `(rcirc-nick-in-message ((,class (:foreground "#5faf00"))))
   `(rcirc-nick-in-message-full-line ((,class (:foreground ,highlight-background))))
   `(rcirc-other-nick ((,class (:foreground ,link-text :bold t))))
   `(rcirc-prompt ((,class (:foreground "#4e4e4e" :background ,prompt-background :bold t))))
   `(rcirc-server ((,class (:foreground "#a8a8a8"))))
   `(rcirc-server-prefix ((,class (:foreground "#a8a8a8"))))
   `(rcirc-timestamp ((,class (:foreground ,line-number))))
   `(rcirc-track-keyword ((,class (:foreground "#ff4ea3"))))
   `(rcirc-track-nick ((,class (:foreground ,link-text))))
   `(rcirc-url ((,class (:foreground ,link-text :bold nil :underline "#1f5bff"))))

   ;; ERC
   `(erc-button ((,class (:foreground ,link-text :underline ,link-text :bold nil))))
   `(erc-current-nick-face ((,class (:foreground ,prompt-background))))
   `(erc-dangerous-hosts ((,class (:foreground "#dd0000" :bold t))))
   `(erc-direct-msg-face ((,class (:foreground ,line-number))))
   `(erc-error-face ((,class (:foreground "#dd0000"))))
   `(erc-header-face ((,class (:background ,link-text))))
   `(erc-input-face ((,class (:foreground "#ffffff"))))
   `(erc-keyword-face ((,class (:foreground "#ff4ea3" :bold t))))
   `(erc-my-nick-face ((,class (:foreground ,prompt-background :bold t))))
   `(erc-nick-default-face ((,class (:bold t :foreground ,link-text))))
   `(erc-nick-msg-face ((,class (:weight normal :foreground ,line-number))))
   `(erc-notice-face ((,class (:foreground "#8a8a8a"))))
   `(erc-pal-face ((,class (:foreground "#d18aff"))))
   `(erc-prompt-face ((,class (:bold t :foreground ,prompt-background :background "#6c6c6c"))))
   `(erc-timestamp-face ((,class (:foreground ,line-number))))

   ;; ReStructuredText
   `(rst-level-1-face ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-2-face ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-3-face ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-4-face ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-5-face ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-6-face ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-1 ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-2 ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-3 ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-4 ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-5 ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-level-6 ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-adornment ((,class (:foreground ,line-number :background "#303030" :bold t))))
   `(rst-block ((,class (:foreground ,prompt-background :background "#4e4e4e" :bold t))))
   `(rst-comment ((,class (:foreground "#ff4b4b" :background "#a40000" :bold t))))
   `(rst-literal ((,class (:foreground ,prompt-background :background "#4e4e4e"))))
   `(rst-reference ((,class (:foreground "#ff4ea3" :background "#303030"))))
   `(rst-definition ((,class (:foreground "#fce94f" :background "#303030"))))
   `(rst-directive ((,class (:foreground "#d18aff" :background "#3a3a3a" :bold t))))
   `(rst-external ((,class (:foreground ,link-text :background "#303030"))))
   `(rst-transition ((,class (:foreground ,prompt-background :background "#3a3a3a" :bold t))))

   ;; yalinum
   `(yalinum-bar-face ((,class (:foreground "#6c6c6c" :background "#c6c6c6"))))
   `(yalinum-face ((,class (:foreground "#c6c6c6" :background "#8a8a8a"))))
   `(yalinum-track-face ((,class (:foreground "#c6c6c6" :background "#6c6c6c"))))

   ;; Ruby
   `(enh-ruby-heredoc-delimiter-face ((,class (:foreground "#af5fff"))))
   `(enh-ruby-op-face ((,class (:foreground "#ff5d17" :bold t))))
   `(enh-ruby-regexp-delimiter-face ((,class (:foreground "#af5fff"))))
   `(enh-ruby-string-delimiter-face ((,class (:foreground "#af87ff"))))
   `(erm-syn-errline ((,class (:foreground "#ffafaf" :background "#a40000" :bold t :underline t))))
   `(erm-syn-warnline ((,class (:bold t :underline t))))

   ;; ansi-term
   `(term-color-black ((,class (:background "#303030" :foreground "#303030"))))
   `(term-color-blue ((,class (:background "#00d7af" :foreground "#00d7af"))))
   `(term-color-cyan ((,class (:background "#00d7af" :foreground "#00d7af"))))
   `(term-color-green ((,class (:background ,prompt-background :foreground ,prompt-background))))
   `(term-color-magenta ((,class (:background "#ff1f8b" :foreground "#ff1f8b"))))
   `(term-color-red ((,class (:background "#ef2929" :foreground "#ef2929"))))
   `(term-color-white ((,class (:background "#ffffff" :foreground "#ffffff"))))
   `(term-color-yellow ((,class (:background ,line-number :foreground "#ff8700"))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,line-number :bold t))))
   `(ido-incomplete-regexp ((,class (:foreground "#ff4b4b" :bold t))))
   `(ido-indicator ((,class (:foreground "#875f00" :background "#ffd787"))))
   `(ido-only-match ((,class (:foreground ,prompt-background :background nil))))
   `(ido-subdir ((,class (:foreground ,link-text :bold t))))
   `(ido-virtual ((,class (:foreground "#ff1f8b"))))


   ;; cfw: Calendar Framework
   ;;   `(cfw:face-annotation ((,class (:foreground , :background ,))))
   `(cfw:face-day-title ((,class (:foreground "#ffffff" :background "#262626"))))
   ;;   `(cfw:face-default-content ((,class (:foreground , :background ,))))
   ;;   `(cfw:face-default-day ((,class (:foreht , :background ,))))
   ;;   `(cfw:face-disable ((,class (:foreground , :background ,))))
   `(cfw:face-grid ((,class (:foreground "#8a8a8a"))))
   `(cfw:face-header ((,class (:foreground "#c6c6c6" :background "#4e4e4e" :bold t))))
   `(cfw:face-holiday ((,class (:foreground "#d18aff" :background "#262626" :bold t))))
   ;;   `(cfw:face-periods ((,class (:foreground , :background ,))))
   `(cfw:face-saturday ((,class (:foreground "#c3c9f8" :background ,highlight-background :bold t))))
   `(cfw:face-select ((,class (:foreground "#303030" :background ,link-text))))
   `(cfw:face-sunday ((,class (:foreground "#ffafaf" :background "#a40000" :bold t))))
   ;;   `(cfw:face-title ((,class (:foreground , :background ,))))
   `(cfw:face-today ((,class (:foreground ,line-number :background "#4e4e4e"))))
   `(cfw:face-today-title ((,class (:foreground "#ffffff" :background ,line-number))))
   `(cfw:face-toolbar ((,class (:foreground "#c6c6c6" :background "#4e4e4e"))))
   `(cfw:face-toolbar-button-off ((,class (:foreground "#5faf87":background "#4e4e4e"))))
   `(cfw:face-toolbar-button-on ((,class (:foreground "#ef2929" :background "#ffffff"))))

   ;; Column marker
   `(column-marker-1 ((,class (:background "#6c6c6c"))))
   `(column-marker-2 ((,class (:background "#875f00"))))
   `(column-marker-3 ((,class (:background "#a40000"))))

   ;; Swoop
   `(swoop-face-header-format-line ((,class (:foreground "#000000" :background nil :underline nil))))
   `(swoop-face-line-buffer-name ((,class (:foreground ,prompt-foreground :background ,prompt-background))))
   `(swoop-face-line-number ((,class (:foreground "#87875f" :background "#d7d7af"))))
   `(swoop-face-target-line ((,class (:foreground "#fce94f" :background "#6c6c6c"))))
   `(swoop-face-target-words ((,class (:foreground "#ff7bbb" :background "#6c6c6c" :bold t))))
   `(helm-swoop-target-line-block-face ((,class (:foreground "#fce94f" :background "#4e4e4e"))))
   `(helm-swoop-target-line-face ((,class (:foreground "#fce94f" :background "#6c6c6c"))))
   `(helm-swoop-target-word-face ((,class (:foreground "#ff1f8b" :background "#ffafd7" :bold t))))

   ;; widget
   `(widget-button ((,class (:foreground ,link-text :underline t :bold t))))
   `(widget-button-pressed ((,class (:foreground "#afd7ff"))))
   `(widget-documentation ((,class (:foreground ,prompt-background))))
   `(widget-field ((,class (:foreground ,prompt-background :background "#4e4e4e"))))
   `(widget-inactive ((,class (:foreground "#8a8a8a"))))
   `(widget-single-line-field ((,class (:foreground ,prompt-background :background "#4e4e4e"))))

   ;; table
   `(table-cell ((,class (:foreground "#ffffff" :background "#4e4e4e"))))

   ;; compilation
   `(compilation-line-number ((,class (:foreground ,line-number))))
   `(compilation-info ((,class (:foreground ,link-text))))
   ;; Uncustomized
   `(compilation-column-number ((,class (:foreground ,prompt-background))))
   `(compilation-error ((,class (:foreground "#a40000" :background "#ff4b4b" :bold t))))
   `(compilation-mode-line-exit ((,class (:foreground ,prompt-foreground :background ,prompt-background :bold t))))
   `(compilation-mode-line-fail ((,class (:foreground "#a40000" :background "#ffafaf" :bold t))))
   `(compilation-mode-line-run ((,class (:foreground "#d75f00" :background "#ffd787" :bold t))))
   `(compilation-warning ((,class (:foreground "#ff5d17"))))

   ;; Neotree
   `(neo-banner-face ((,class (:foreground "#5faf00" :background nil))))
   `(neo-header-face ((,class (:foreground ,prompt-background :background nil))))
   `(neo-root-dir-face ((,class (:foreground "#ff7bbb"))))
   `(neo-button-face ((,class (:foreground ,link-text :bold t))))
   `(neo-dir-link-face ((,class (:foreground "#1f5bff" :bold t))))
   `(neo-expand-btn-face ((,class (:foreground ,link-text :background "#6c6c6c"))))
   `(neo-file-link-face ((,class (:foreground "#c6c6c6"))))

   ;; info
   `(info-header-node ((,class (:foreground "#ff4ea3" :bold t))))
   `(info-header-xref ((,class (:foreground ,link-text :background nil :bold t))))
   `(info-index-match ((,class (:background ,highlight-background))))
   `(info-menu-header ((,class (:foreground "#ffffff" :bold t :underline t))))
   `(info-menu-star ((,class (:foreground "#ef2929"))))
   `(info-node ((,class (:foreground "#a40000"))))
   `(info-title-1 ((,class (:foreground ,link-text :bold t))))
   `(info-title-2 ((,class (:foreground ,prompt-background :bold t))))
   `(info-title-3 ((,class (:foreground ,line-number :bold t))))
   `(info-title-4 ((,class (:foreground "#ff4ea3" :bold t))))
   `(info-xref ((,class (:foreground ,link-text :underline t))))
   `(info-xref-visited ((,class (:foreground "#d18aff" :underline t))))

   ;; Tuareg
   `(tuareg-font-lock-error-face ((,class (:foreground "#a40000" :background "#ffafaf" :bold t))))
   `(tuareg-font-lock-governing-face ((,class (:foreground "#c6c6c6" :bold t))))
   `(tuareg-font-lock-interactive-error-face ((,class (:foreground "#a40000" :background "#ffafaf" :bold t))))
   `(tuareg-font-lock-interactive-output-face ((,class (:foreground ,highlight-background))))
   `(tuareg-font-lock-multistage-face ((,class (:foreground ,highlight-background :background "#afd7ff"))))
   `(tuareg-font-lock-operator-face ((,class (:foreground ,prompt-background :background "#4e4e4e" :bold t))))

   ;; CPerl
   `(cperl-array-face ((,class (:foreground "#c3c9f8" :background ,highlight-background))))
   `(cperl-hash-face ((,class (:foreground "#ffaf87" :background "#5f0000"))))
   `(cperl-nonoverridable-face ((,class (:foreground ,prompt-background :background "#005f00"))))

   ;; Haskell
   `(haskell-interactive-face-compile-error ((,class (:foreground "#ff4b4b" :background nil :bold t))))
   `(haskell-interactive-face-compile-warning ((,class (:foreground ,line-number :background nil :bold t))))
   `(haskell-interactive-face-garbage ((,class (:foreground "#8a8a8a"))))
   `(haskell-interactive-face-prompt ((,class (:foreground ,prompt-background :background "#6c6c6c" :bold t))))
   `(haskell-interactive-face-result ((,class (:foreground ,link-text))))

   ;; tty-menu
   `(menu ((,class (:foreground "#a8a8a8" :background "#4e4e4e"))))
   `(tty-menu-disabled-face ((,class (:foreground "#6c6c6c" :background "#4e4e4e"))))
   `(tty-menu-enabled-face ((,class (:foreground "#ffffff" :background "#4e4e4e" :bold t))))
   `(tty-menu-selected-face ((,class (:background ,highlight-background))))

   ;; web-mode
   `(web-mode-comment-face ((,class (:foreground "#4e4e4e"))))
   `(web-mode-current-element-highlight-face ((,class (:background "#4e4e4e"))))
   `(web-mode-current-column-highlight-face ((,class (:background "#4e4e4e"))))
   `(web-mode-symbol-face ((,class (:foreground "#ffd700"))))
   `(web-mode-type-face ((,class (:foreground "#00d7af"))))

   ;; Custom
   `(custom-button ((,class (:background "#afd7ff" :foreground ,highlight-background
                                         :box (:line-width 1 :style released-button)))))
   `(custom-button-mouse ((,class (:background "#d7d7ff" :foreground "#4e4e4e"
                                               :box (:line-width 1 :style released-button)))))
   `(custom-button-pressed ((,class (:foreground "#4e4e4e" :background "#c6c6c6"
                                                 :box (:line-width 1 :style pressed-button)))))

   ;; Hydra
   `(hydra-face-red ((,class (:foreground "#ff4b4b"))))
   `(hydra-face-blue ((,class (:foreground ,link-text))))
   `(hydra-face-amaranth ((,class (:foreground "#ff4ea3"))))
   )

  (custom-theme-set-variables
   'robenkleene-dark
   `(ansi-color-names-vector ["#303030" "#ff4b4b" ,prompt-background "#fce94f"
                              ,link-text "#d18aff" "#afd7ff" "#c6c6c6"]))
  )


(provide-theme 'robenkleene-dark)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; robenkleene-dark-theme.el ends here
