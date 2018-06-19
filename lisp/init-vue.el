(maybe-require-package 'vue-mode)
(maybe-require-package 'vue-html-mode)
(maybe-require-package 'lsp-vue)
(require 'vue-mode)
(add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)

(provide 'init-vue)
