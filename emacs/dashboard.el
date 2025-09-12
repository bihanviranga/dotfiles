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
                             "Every keypress is a prayer, every command a litany."
                             "Abandon IDE, all ye who enter here."
                             "In Lisp we trust."
                             "Stay Deluxe, stay recursive."
                             "Syntax sanctified, runtime purified."
                             "Trust in M-x, for it is infinite."
                             "++HAIL THE DATASPHERE++"
                             "┌(◉_◉)┘ Hail the Machine Spirit!"
                             "Ξ Stay Deluxe, like a neon-lit kernel panic"
                             "┌(◉_◉)┘ Invocation complete. Proceed."
                             "Sanctify this session, O Machine God."
                             "Emacs: The Editor Eternal."))
                (msg (nth (random (length greetings)) greetings)))
           (insert "\n"
                   (+doom-dashboard--center +doom-dashboard--width msg)
                   "\n")))
       (delq #'doom-dashboard-widget-banner +doom-dashboard-functions)))
