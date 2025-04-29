;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Jesus H. Christ"
      user-mail-address "buddha@nirvana.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Mononoki Nerd Font" :size 18 :weight 'semi-light)
;;     doom-variable-pitch-font (font-spec :family "Mononoki Nerd Font" :size 18))

;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-operandi)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/home/shinobi/Documents/notes/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (require 'obsidian)
;; Location of obsidian vault
;;(setopt obsidian-directory "/home/shinobi/org")
;; Default location for new notes from `obsidian-capture'
;; (setopt obsidian-inbox-directory "Inbox")
;; Useful if you're going to be using wiki links
;; (setopt markdown-enable-wiki-links t)

;; These bindings are only suggestions; it's okay to use other bindings
;; Create note
;; (define-key obsidian-mode-map (kbd "C-c C-n") 'obsidian-capture)
;; If you prefer you can use `obsidian-insert-wikilink'
;; (define-key obsidian-mode-map (kbd "C-c C-l") 'obsidian-insert-link)
;; Open file pointed to by link at point
;; (define-key obsidian-mode-map (kbd "C-c C-o") 'obsidian-follow-link-at-point)
;; Open a note note from vault
;; (define-key obsidian-mode-map (kbd "C-c C-p") 'obsidian-jump)
;; Follow a backlink for the current file
;; (define-key obsidian-mode-map (kbd "C-c C-b") 'obsidian-backlink-jump)

;; Activate obsidian mode and backlinks mode
;; (global-obsidian-mode t)
;; (obsidian-backlinks-mode t)
(setq shell-file-name (executable-find
                       "bash"))

(after! vterm-mode
  (setq-default vterm-shell "/bin/fish")
  (setq-default explicit-shell-file-name "~/config/fish/config.fish"))



;; To open files with .journal extension in hledger-mode


;; Provide the path to you journal file.
;; The default location is too opinionated.

(use-package! selectric-mode
  )

(after! denote
  (use-package denote
    :ensure t
    :hook
    ( ;; If you use Markdown or plain text files, then you want to make
     ;; the Denote links clickable (Org renders links as buttons right
     ;; away)
     (text-mode . denote-fontify-links-mode-maybe)
     ;; Apply colours to Denote names in Dired.  This applies to all
     ;; directories.  Check `denote-dired-directories' for the specific
     ;; directories you may prefer instead.  Then, instead of
     ;; `denote-dired-mode', use `denote-dired-mode-in-directories'.
     (dired-mode . denote-dired-mode))
    :bind
    ;; Denote DOES NOT define any key bindings.  This is for the user to
    ;; decide.  For example:
    ( :map global-map
           ("C-c n n" . denote)
           ("C-c n d" . denote-dired)
           ("C-c n g" . denote-grep)
           ;; If you intend to use Denote with a variety of file types, it is
           ;; easier to bind the link-related commands to the `global-map', as
           ;; shown here.  Otherwise follow the same pattern for `org-mode-map',
           ;; `markdown-mode-map', and/or `text-mode-map'.
           ("C-c n l" . denote-link)
           ("C-c n L" . denote-add-links)
           ("C-c n b" . denote-backlinks)
           ("C-c n q c" . denote-query-contents-link) ; create link that triggers a grep
           ("C-c n q f" . denote-query-filenames-link) ; create link that triggers a dired
           ;; Note that `denote-rename-file' can work from any context, not just
           ;; Dired bufffers.  That is why we bind it here to the `global-map'.
           ("C-c n r" . denote-rename-file)
           ("C-c n R" . denote-rename-file-using-front-matter)

           ;; Key bindings specifically for Dired.
           :map dired-mode-map
           ("C-c C-d C-i" . denote-dired-link-marked-notes)
           ("C-c C-d C-r" . denote-dired-rename-files)
           ("C-c C-d C-k" . denote-dired-rename-marked-files-with-keywords)
           ("C-c C-d C-R" . denote-dired-rename-marked-files-using-front-matter))

    :config
    ;; Remember to check the doc string of each of those variables.
    (setq denote-directory (expand-file-name "~/Documents/notes/"))
    (setq denote-save-buffers nil)
    (setq denote-known-keywords '("emacs" "km" "business" "philosophy"))
    (setq denote-infer-keywords t)
    (setq denote-sort-keywords t)
    (setq denote-prompts '(title keywords))
    (setq denote-excluded-directories-regexp nil)
    (setq denote-excluded-keywords-regexp nil)
    (setq denote-rename-confirmations '(rewrite-front-matter modify-file-name))

    ;; Pick dates, where relevant, with Org's advanced interface:
    (setq denote-date-prompt-use-org-read-date t)

    ;; Automatically rename Denote buffers using the `denote-rename-buffer-format'.
    (denote-rename-buffer-mode 1))
  )

(after! denote-journal
  (use-package denote-journal
    :ensure t
    ;; Bind those to some key for your convenience.
    :commands ( denote-journal-new-entry
                denote-journal-new-or-existing-entry
                denote-journal-link-or-create-entry )
    :hook (calendar-mode . denote-journal-calendar-mode)
    :config
    ;; Use the "journal" subdirectory of the `denote-directory'.  Set this
    ;; to nil to use the `denote-directory' instead.
    (setq denote-journal-directory
          (expand-file-name "journal" denote-directory))
    ;; Default keyword for new journal entries. It can also be a list of
    ;; strings.
    (setq denote-journal-keyword "journal")
    ;; Read the doc string of `denote-journal-title-format'.
    (setq denote-journal-title-format 'day-date-month-year))

  )

(after! denote-sequence
  (use-package denote-sequence
    :ensure t
    :bind
    ( :map global-map
           ;; Here we make "C-c n s" a prefix for all "[n]otes with [s]equence".
           ;; This is just for demonstration purposes: use the key bindings
           ;; that work for you.  Also check the commands:
           ;;
           ;; - `denote-sequence-new-parent'
           ;; - `denote-sequence-new-sibling'
           ;; - `denote-sequence-new-child'
           ;; - `denote-sequence-new-child-of-current'
           ;; - `denote-sequence-new-sibling-of-current'
           ("C-c n s s" . denote-sequence)
           ("C-c n s f" . denote-sequence-find)
           ("C-c n s l" . denote-sequence-link)
           ("C-c n s d" . denote-sequence-dired)
           ("C-c n s r" . denote-sequence-reparent)
           ("C-c n s c" . denote-sequence-convert))
    :config
    ;; The default sequence scheme is `numeric'.
    (setq denote-sequence-scheme 'alphanumeric))


  )
