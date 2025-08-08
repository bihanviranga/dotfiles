;; Typescript, Angular, React, and JSX/TSX settings

;;; --- Helper functions ---

(defun bihanviranga/project-root ()
  "Get the root directory of the current project."
  (or (doom-project-root) default-directory))

(defun bihanviranga/project-has-file (filename)
  "Return t if FILENAME exists in the project root."
  (file-exists-p (expand-file-name filename (bihanviranga/project-root))))

(defun bihanviranga/project-package-json-has-dep (dep)
  "Return t if package.json in project root lists DEP as a dependency."
  (let ((pkg-json (expand-file-name "package.json" (bihanviranga/project-root))))
    (when (file-exists-p pkg-json)
      (with-temp-buffer
        (insert-file-contents pkg-json)
        (goto-char (point-min))
        (search-forward (format "\"%s\"" dep) nil t)))))

(defun bihanviranga/npm-global-root ()
  "Return the npm global root directory dynamically by running `npm root -g`."
  (string-trim (shell-command-to-string "npm root -g")))

(defun bihanviranga/log-project-type ()
  (cond
   ((bihanviranga/project-has-file "angular.json")
    (message "[*] Detected Angular project"))
   ((or (bihanviranga/project-package-json-has-dep "react")
        (bihanviranga/project-package-json-has-dep "next")
        (bihanviranga/project-package-json-has-dep "vite"))
    (message "[*] Detected React/Next.js/Vite project"))
   (t
    (message "[*] Detected JS/TS project"))))

;;; --- Angular LSP registration ---

(after! lsp-mode
  (let ((npm-global (bihanviranga/npm-global-root)))
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-stdio-connection
                        (list "ngserver"
                              "--stdio"
                              "--tsProbeLocations" npm-global
                              "--ngProbeLocations" npm-global))
    :activation-fn (lambda (filename &rest _)
                     (when filename
                       (locate-dominating-file filename "angular.json")))
    :priority -1
    :server-id 'angular-ls))))

;;; --- LSP starter function

(defun bihanviranga/start-appropriate-lsp ()
  "Start the correct LSP server based on project type."
  (bihanviranga/log-project-type)
  (lsp-deferred))

;;; --- JTSX + Treesitter setup ---

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
  :hook ((jtsx-tsx-mode . bihanviranga/start-appropriate-lsp)
         (jtsx-jsx-mode . bihanviranga/start-appropriate-lsp)
         (jtsx-typescript-mode . bihanviranga/start-appropriate-lsp))
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

;;; --- ESlint config ---

(setq-hook! '(jtsx-typescript-mode-hook jtsx-tsx-mode-hook)
  lsp-eslint-server-command
  '("vscode-eslint-language-server" "--stdio"))

;;; --- Smartparens JSX fix ---

;; When typing "<div>", etc, after the first "<", the closing ">" gets auto-inserted,
;; which I do not want. So we skip it.
(after! smartparens
  ;; JSX-style angle brackets
  (sp-with-modes '(jtsx-tsx-mode jtsx-jsx-mode)
    ;; Define the < > pair
    (sp-local-pair "<" ">"
                   :actions '(insert autoskip)
                   :unless '(sp-in-comment-p sp-in-string-p))))

;;; --- JSX newline fix ---

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
