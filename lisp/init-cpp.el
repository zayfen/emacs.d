
(require-package 'ggtags)
(require-package 'company-lsp)
(require-package 'helm-xref)
(require-package 'function-args)

;;;;;;;;;;;;;;;;;;; use ccls
;;(add-to-list 'load-path (expand-file-name "site-list/emacs-ccls" user-emacs-directory))
(require-package 'ccls)
(require-package 'lsp-ui)

;; ;;(require-package 'lsp-ui)
;; (use-package lsp-mode :commands lsp)
;; (use-package company-lsp :commands company-lsp)

;; (use-package ccls
;;   :hook ((c-mode c++-mode objc-mode) .
;;          (lambda () (require 'ccls) (lsp))))

(setq ccls-executable "/home/zayfen/.emacs.d/vendor/ccls/ccls")

;; (defun ccls//enable ()
;;   (condition-case nil
;;       (lsp-ccls-enable)
;;     (user-error nil)))

;; (use-package ccls
;;   :commands lsp-ccls-enable
;;   :init
;;   (add-hook 'c-mode-hook #'ccls//enable)
;;   (add-hook 'c++-mode-hook #'ccls//enable)
;;   )
;; Also see lsp-project-whitelist lsp-project-blacklist ccls-root-matchers
;; lsp-ui-doc.el renders comments in a child frame (Emacs >= 26) or inline (< 26).
(setq lsp-ui-doc-include-signature nil)  ; don't include type signature in the child frame
(setq lsp-ui-sideline-show-symbol nil)  ; don't show symbol on the right of info

(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)


(provide 'init-cpp)
