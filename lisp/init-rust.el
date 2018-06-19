;;(when (maybe-require-package 'rust-mode)
;;  (when (maybe-require-package 'racer)
;;  (add-hook 'rust-mode-hook #'racer-mode)
;;  (add-hook 'racer-mode-hook #'eldoc-mode))
;;  (when (maybe-require-package 'company)
;;  (add-hook 'racer-mode-hook #'company-mode)))

;; (when (maybe-require-package 'rust-mode)
;;   (when (maybe-require-package 'lsp-rust)
;;     ;; (require-package 'lsp-rust)
;;     (with-eval-after-load 'lsp-mode
;;       (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;       (require 'lsp-rust)
;;       (add-hook 'rust-mode-hook #'lsp-rust-enable))
;;     ))

(require-package 'lsp-rust)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(when (maybe-require-package 'flycheck-rust)
  (after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(with-eval-after-load 'lsp-mode
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  (require 'lsp-rust))

(add-hook 'rust-mode-hook #'lsp-rust-enable)
(add-hook 'rust-mode-hook #'flycheck-mode)

(provide 'init-rust)
