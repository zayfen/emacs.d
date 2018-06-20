(maybe-require-package 'vue-mode)
(maybe-require-package 'vue-html-mode)
(maybe-require-package 'lsp-vue)
(require 'vue-mode)
;; (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)

(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  )

(use-package lsp-vue
  :ensure t
  :after (vue-mode lsp-mode)
  :hook ((vue-mode . lsp-vue-enable) (vue-mode . flycheck-mode)))

(provide 'init-vue)
