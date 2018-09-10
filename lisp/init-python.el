(require 'eglot)

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

;; (when (maybe-require-package 'eglot)
;;   (after-load 'python
;;     ;;(add-hook 'python-mode-hook 'anaconda-mode)
;;     (add-hook 'python-mode-hook 'eglot-ensure)
;; 		(flymake-mode nil)
;;     ;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
;; 		))

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
		(add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)))

(add-hook 'python-mode-hook
          (lambda ()
						;; (sanityinc/local-push-company-backend 'company-anaconda)
						(setq-default indent-tabs-mode t)
						(setq-default tab-width 2)
						(setq-default python-indent-offset 2)
						(add-to-list 'write-file-functions 'delete-trailing-whitespace)
						(flymake-mode nil)
						))

(setq anaconda-mode-localhost-address "localhost")
(setq url-proxy-services '(("no_proxy" . "^\\(127.0.0.1\\|localhost\\|10.*\\)")))

(provide 'init-python)
