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
(setq doom-theme 'doom-solarized-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/home/shinobi/org/")


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
(setopt obsidian-directory "/home/shinobi/org")
;; Default location for new notes from `obsidian-capture'
(setopt obsidian-inbox-directory "Inbox")
;; Useful if you're going to be using wiki links
(setopt markdown-enable-wiki-links t)

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


;;; Basic configuration
(require 'hledger-mode)

;; To open files with .journal extension in hledger-mode
(add-to-list 'auto-mode-alist '("\\.journal\\'" . hledger-mode))

;; Provide the path to you journal file.
;; The default location is too opinionated.
(setq hledger-jfile "/home/shinobi/Repos/hledger/hledger.journal")

;; For easily adjusting dates.
(define-key hledger-mode-map (kbd "<kp-add>") 'hledger-increment-entry-date)
(define-key hledger-mode-map (kbd "<kp-subtract>") 'hledger-decrement-entry-date)

;; Personal Accounting
(global-set-key (kbd "C-c e") 'hledger-jentry)
(global-set-key (kbd "C-c j") 'hledger-run-command)
