;; Typescript, TSX, and React settings

(after! treesit
  (setq treesit-language-source-alist
    '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
      (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))
  (unless (treesit-language-available-p 'typescript)
    (treesit-install-language-grammar 'typescript))
  (unless (treesit-language-available-p 'tsx)
    (treesit-install-language-grammar 'tsx)))

(use-package! typescript-ts-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :hook ((typescript-ts-mode tsx-ts-mode) . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package! combobulate
  :after treesit
  :config
  (setq combobulate-key-prefix "C-c o"))

(use-package! rjsx-mode
  :defer t
  :init
  (add-hook 'tsx-ts-mode-hook #'rjsx-minor-mode)
  :config
  (setq-hook! 'tsx-ts-mode-hook
    indent-line-function #'rjsx-indent-line))

;; apheleia for Prettier
(after! apheleia
  (setf (alist-get 'prettier apheleia-formatters) '("prettier" "--stdin-filepath" filepath))
  (setf apheleia-mode-alist '((typescript-ts-mode . prettier)
                              (tsx-ts-mode        . prettier))))

;; LSP ESLint
(setq-hook! '(typescript-ts-mode-hook tsx-ts-mode-hook)
  lsp-eslint-server-command '("vscode-eslint-language-server" "--stdio"))
