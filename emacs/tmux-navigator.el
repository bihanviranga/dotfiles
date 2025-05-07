;;; tmux-navigator.el --- Seamless tmux + evil window navigation in terminal
;;
;; Enables tmux-style split navigation with C-h/j/k/l in terminal Emacs,
;; similar to vim-tmux-navigator.

(unless (display-graphic-p)
  (defun tmux-navigator--navigate (direction)
    "Try windmove in DIRECTION, fallback to tmux."
    (let ((windmove-fn (pcase direction
                         ('left  #'windmove-left)
                         ('down  #'windmove-down)
                         ('up    #'windmove-up)
                         ('right #'windmove-right))))
      (unless (ignore-errors (funcall windmove-fn) t)
        (tmux-navigator--tmux direction))))

  (defun tmux-navigator--tmux (direction)
    "Call tmux to move in DIRECTION."
    (let ((cmd (pcase direction
                 ('left  "select-pane -L")
                 ('down  "select-pane -D")
                 ('up    "select-pane -U")
                 ('right "select-pane -R"))))
      (call-process-shell-command (concat "tmux " cmd))))

  (defun tmux-navigator-setup ()
    "Set up keybindings for tmux navigation."
    (evil-define-key 'normal 'global
      (kbd "C-h") (lambda () (interactive) (tmux-navigator--navigate 'left))
      (kbd "C-j") (lambda () (interactive) (tmux-navigator--navigate 'down))
      (kbd "C-k") (lambda () (interactive) (tmux-navigator--navigate 'up))
      (kbd "C-l") (lambda () (interactive) (tmux-navigator--navigate 'right))))

  (tmux-navigator-setup))

(provide 'tmux-navigator)
