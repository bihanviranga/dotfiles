;; Typescript, TSX, and React settings

(after! treesit
  (setq treesit-language-source-alist
        '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))
  (dolist (lang '(typescript tsx))
    (unless (treesit-language-available-p lang)
      (treesit-install-language-grammar lang))))

(use-package! jtsx
  :mode (("\\.ts\\'" . jtsx-typescript-mode)
         ("\\.tsx\\'" . jtsx-tsx-mode)
         ("\\.jsx?\\'" . jtsx-jsx-mode))
  :commands jtsx-install-treesit-language
  :hook ((jtsx-tsx-mode . hs-minor-mode)
         (jtsx-jsx-mode . hs-minor-mode)
         (jtsx-typescript-mode . hs-minor-mode))
  :custom
  (js-indent-level 2)
  (typescript-ts-mode-indent-offset 2)
  (jtsx-enable-jsx-electric-closing-element t)
  (jtsx-enable-electric-open-newline-between-jsx-element-tags t)
  (jtsx-enable-jsx-element-tags-auto-sync t))
;; To auto-sync opening/closing tags:
;; (jtsx-enable-jsx-element-tags-auto-sync t)
;;
;; The following line was commented out because it can be run interactively only.
;; So once for each language, we have to manually call
;; M-x jtsx-install-treesit-language
;; :config
;; (jtsx-install-treesit-language)

(use-package! typescript-ts-mode  ; still used via jtsx-typescript-mode
  :hook ((jtsx-typescript-mode jtsx-tsx-mode) . lsp-deferred))

(after! apheleia
  (setf (alist-get 'prettier apheleia-formatters)
        '("prettier" "--stdin-filepath" filepath))
  (setf apheleia-mode-alist
        '((jtsx-typescript-mode . prettier)
          (jtsx-tsx-mode        . prettier))))

(setq-hook! '(jtsx-typescript-mode-hook jtsx-tsx-mode-hook)
  lsp-eslint-server-command
  '("vscode-eslint-language-server" "--stdio"))

;; When typing "<div>", etc, after the first "<", the closing ">" gets auto-inserted,
;; which I do not want. So we skip it.
(after! smartparens
  ;; JSX-style angle brackets
  (sp-with-modes '(jtsx-tsx-mode jtsx-jsx-mode)
    ;; Define the < > pair
    (sp-local-pair "<" ">"
                   :actions '(insert autoskip)
                   :unless '(sp-in-comment-p sp-in-string-p))))

;; When typing "<div>" and pressing enter, the closing tag does not get indented properly.
;; This function fixes that.
(defun bihanviranga/jtsx-electric-newline ()
  "Insert newline and re-indent closing JSX tag if present."
  (interactive)
  (newline-and-indent)
  (save-excursion
    (forward-line 1)
    (when (looking-at-p "\\s-*<\\/[^>]+>")
      (indent-according-to-mode))))

(add-hook 'jtsx-tsx-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") #'bihanviranga/jtsx-electric-newline)))
