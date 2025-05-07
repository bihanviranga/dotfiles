;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

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
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;; NOTE: if the doom-font is not a nerd font, some icons will break.
(setq doom-font (font-spec :family "BlexMono Nerd Font" :size 11 :weight 'light))
;; I've set org-mode to use variable-pitch-font
(setq doom-variable-pitch-font (font-spec :family "Overpass" :size 13 :weight 'light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-plain-dark)
;; I don't like the default font color -- too unreadable.
(after! doom-themes
  (custom-set-faces!
    '(font-lock-comment-face :foreground "#808380" :slant italic)
    '(marginalia-documentation :foreground "#808380")))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; Org mode customization
(after! org
  (setq org-hide-emphasis-markers t)
  (custom-set-faces!
    '(org-document-title :height 1.3 :weight bold)
    '(org-block :inherit fixed-pitch)
    '(org-code :inherit (shadow fixed-pitch)))
  (add-hook! 'org-mode-hook
                (variable-pitch-mode)
                (display-line-numbers-mode -1))
  (dolist (face `(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5
                  org-level-6
                  org-level-7
                  org-level-8))))
(after! org-modern
  (setq org-modern-star '("•" "◦" "▪" "▹")))

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

;; Cool monochrome theme:
;; (load-theme 'sketch-black t)

;; Set a default window size on load
(add-to-list 'default-frame-alist '(height . 100))
(add-to-list 'default-frame-alist '(width . 200))

;; Wakatime with Wakapi
(use-package wakatime-mode :ensure t)
;; Run Wakatime in all buffers.
(global-wakatime-mode)

(setq-default line-spacing 0.2)

;; Disable LSP documentation window that pops up from the bottom
;; See nummber 13 in:
;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
(setq lsp-signature-render-documentation nil)

(setq menu-bar-mode -1
      scroll-bar-mode -1
      tool-bar-mode -1)

;; Modeline settings
(after! doom-modeline
  (setq doom-modeline-height 30
        doom-modeline-bar-width 5
        ;; Disable the icon that says 'I', and fallback to the chars.
        doom-modeline-modal-icon nil
        doom-modeline-modal-modern-icon nil
        doom-modeline-buffer-size nil)
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode))

;; Split settings
(setq evil-vsplit-window-right t
      evil-split-window-below t)
;; Prompt which buffer to open in a split
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))
;; Switch between windows using C-<vim navigation key>
(map! :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right)
;; Disable the messages that are shown when switching states
(setq evil-echo-state nil)

;; Disable automatic code completion
;; Can be triggered when needed with C-SPC
(setq company-idle-delay .2)

;; Go to next/prev buffers using shift+h/l
(map! :n "H" #'previous-buffer
      :n "L" #'next-buffer)

;; Add projects
;; (projectile-add-known-project "~/Code/dotfiles")

;; Dashboard page config
;; Remove the menu
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
;; Hide stuff
(add-hook! '+doom-dashboard-mode-hook
  (hide-mode-line-mode -1)
  (hl-line-mode -1))
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))
;; Remove the GitHub icon
(setq +doom-dashboard-functions
      (delq #'doom-dashboard-widget-footer +doom-dashboard-functions))
;; Remove the large banner
(setq +doom-dashboard-functions
      (delq #'doom-dashboard-widget-banner +doom-dashboard-functions))
;; Show one of these as the greeting message.
(setq +doom-dashboard-functions
      (cons
       (lambda ()
         (let* ((greetings '("Praise the Machine Spirit!"
                             "Blessed is the kernel. Blessed is the Emacs."
                             "Only in configuration is there salvation."
                             "The Emperor protects."
                             "From code, salvation. From configs, ascension."
                             "The Omnissiah guides my keystrokes."
                             "Every function a prayer, every keystroke a blessing."
                             "The Machine God watches over this editor."
                             "In the grim darkness of the far future, there is only Emacs."
                             "The Machine Spirit guides my cursor."
                             "My faith is my shield, my keybindings my sword."
                             "The Machine God watches over this buffer."
                             "The path to enlightenment is paved with documentation."
                             "Emacs: The Editor Eternal."))
                (msg (nth (random (length greetings)) greetings)))
           (insert "\n"
                   (+doom-dashboard--center +doom-dashboard--width msg)
                   "\n")))
       (delq #'doom-dashboard-widget-banner +doom-dashboard-functions)))

(load! "tmux-navigator.el")
