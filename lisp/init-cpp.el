;; (require-package 'ggtags)
;; (require-package 'ycmd)
;; (require-package 'company-ycmd)
;; (require-package 'flycheck-ycmd)
;; (require-package 'cpputils-cmake)

;; (add-hook 'c++-mode-hook 'ycmd-mode)
;; (add-hook 'c-mode-hook 'ycmd-mode)
;; (add-hook 'c++-mode-hook 'company-mode)

;; (set-variable 'ycmd-server-command
;;               '("python" "/home/zayafa/.emacs.d/vendor/ycmd/ycmd"))
;; (set-variable 'ycmd-global-config "/home/zayafa/.emacs.d/vendor/ycmd/cpp/ycm/.ycm_extra_conf.py")


;; (company-ycmd-setup)
;; (flycheck-ycmd-setup)
;; (setq company-backends-c-mode-common '((company-c-headers
;;                                         company-ycmd
;;                                         company-dabbrev :with company-yasnippet)))

;; (add-hook 'c-mode-common-hook
;;           (lambda()
;;             (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
;;                                         ;(gtags-mode t)
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode)
;;               (ggtags-mode 1))))

;; (add-hook 'c++-mode-hook
;;           (lambda ()
;;             (setq company-clang-arguments "-std=c++11")
;;             (setq flycheck-clang-language-standard "c++11")
;;             (setq flycheck-select-checker "c/c++-clang")))


(require-package 'ggtags)
(require-package 'cpputils-cmake)
(require-package 'cquery)
(require-package 'lsp-ui)
(require-package 'company-lsp)
(require-package 'helm-xref)
(require-package 'function-args)

(require 'cquery)
(require 'lsp-ui)
(require 'company-lsp)

(setq cquery-executable "/home/zayafa/.emacs.d/vendor/cquery/build/release/bin/cquery")
;; ;; Arch Linux aur/cquery-git aur/cquery
;; (setq cquery-executable "/usr/bin/cquery")

;; ;; Log file
(setq cquery-extra-args '("--log-file=/tmp/cq.log"))
;; ;; Cache directory, both relative and absolute paths are supported
(setq cquery-cache-dir ".cquery_cached_index")
;; ;; Initialization options
;; (setq cquery-extra-init-params '(:cacheFormat "msgpack"))
(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".cquery")
                projectile-project-root-files-top-down-recurring)))

(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

(use-package cquery
             :commands lsp-cquery-enable
             :init (add-hook 'c-mode-common-hook #'cquery//enable))

(add-hook 'c-mode-common-hook #'cquery//enable)

(setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack" :completion (:detailedLabel t)))
;;(cquery-xref-find-custom "$cquery/base")
;;(cquery-xref-find-custom "$cquery/callers")
;;(cquery-xref-find-custom "$cquery/derived")
;;(cquery-xref-find-custom "$cquery/vars")

;; Alternatively, use lsp-ui-peek interface
;;(lsp-ui-peek-find-custom 'base "$cquery/base")
;;(lsp-ui-peek-find-custom 'callers "$cquery/callers")
;;(lsp-ui-peek-find-custom 'random "$cquery/random") ;; jump to a random declaration

;; lsp-ui-doc.el renders comments in a child frame (Emacs >= 26) or inline (< 26).
;; (setq lsp-ui-doc-include-signature nil)  ; don't include type signature in the child frame
;; (setq lsp-ui-sideline-show-symbol nil)  ; don't show symbol on the right of info

(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)


(provide 'init-cpp)
