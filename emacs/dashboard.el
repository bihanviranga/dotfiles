;; Dashboard page config

;; Remove default widgets we don't want
(remove-hook '+dashboard-functions #'+dashboard-widget-shortmenu)
(remove-hook '+dashboard-functions #'+dashboard-widget-footer)
(remove-hook '+dashboard-functions #'+dashboard-widget-banner)

;; Hide stuff
(add-hook! '+dashboard-mode-hook
  (hl-line-mode -1))
(setq-hook! '+dashboard-mode-hook evil-normal-state-cursor (list nil))

;; Show one of these as the greeting message.
(defun bihanviranga/dashboard-widget-greeting ()
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
    (+dashboard-insert "" msg "")))

(add-hook! '+dashboard-functions #'bihanviranga/dashboard-widget-greeting)
