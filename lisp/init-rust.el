(require-package 'flycheck-rust)
(when (maybe-require-package 'rust-mode)
  (when (maybe-require-package 'racer)
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode))
  (when (maybe-require-package 'company)
    (add-hook 'racer-mode-hook #'company-mode)
    (setq company--auto-completion t)
    (setq company-tooltip-align-annotations t)
    (flycheck-rust-setup)))

;; (when (maybe-require-package 'rust-mode)
;;   (when (maybe-require-package 'lsp-rust)
;;     ;; (require-package 'lsp-rust)
;;     (with-eval-after-load 'lsp-mode
;;       (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;       (require 'lsp-rust)
;;       (add-hook 'rust-mode-hook #'lsp-rust-enable))
;;     ))

;; (require-package 'lsp-rust)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(when (maybe-require-package 'flycheck-rust)
  (after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
		(setq rust-indent-offset 2)))

;; (with-eval-after-load 'lsp-mode
;;   (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;   (require 'lsp-rust))

;; (add-hook 'rust-mode-hook #'lsp-rust-enable)
;; (add-hook 'rust-mode-hook #'flycheck-mode)

;; (lsp-define-stdio-client lsp-rust "rust" #'lsp-rust--get-root nil
;;                          :command-fn #'lsp-rust--rls-command
;;                          :initialize #'lsp-rust--initialize-client)


;; (defun company-lsp--rust-completion-snippet (item)
;;   "Function providing snippet with the rust language.
;; It parses the function's signature in ITEM (a CompletionItem)
;; to expand its arguments."
;;   (-when-let* ((kind (gethash "kind" item))
;;                (is-function (= kind 3)))
;;     (let* ((detail (gethash "detail" item))
;;            (snippet (when (and detail (s-matches? "^\\(pub \\)?\\(unsafe \\)?fn " detail))
;;                       (-some--> (substring detail (1+ (s-index-of "(" detail)) (s-index-of ")" detail))
;;                                 (replace-regexp-in-string "^[^,]*self\\(, \\)?" "" it)
;;                                 (s-split ", " it)
;;                                 (mapconcat (lambda (x) (format "${%s}" x)) it ", ")))))
;;       (concat "(" (or snippet "$1") ")$0"))))

(with-eval-after-load 'lsp-mode
  (require 'lsp-rust)
  (add-hook 'rust-mode-hook #'lsp-rust-enable))


(provide 'init-rust)
