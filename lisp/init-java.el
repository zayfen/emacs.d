
;;; lsp-java flavor

(maybe-require-package 'lsp-java)
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp-java-enable)
;; (setq lsp-java--workspace-folders (list "/home/zayafa/workspace/Tars/java"))




;; lsp-javacomp flavor
(maybe-require-package 'lsp-javacomp)
(require 'lsp-javacomp)
(add-hook 'java-mode-hook #'lsp-javacomp-enable)



(use-package lsp-javacomp
	:commands lsp-javacomp-enable
	:init
	(add-hook 'java-mode-hook
						(lambda ()
							;; Load company-lsp before enabling lsp-javacomp, so that function
							;; parameter snippet works.
							(require 'company-lsp)
							(lsp-javacomp-enable)
							;; Use company-lsp as the company completion backend
							(set (make-variable-buffer-local 'company-backends) '(company-lsp))
							;; Optional company-mode settings
							(set (make-variable-buffer-local 'company-idle-delay) 0.1)
							(set (make-variable-buffer-local 'company-minimum-prefix-length) 1)))
	;; Optional, make sure JavaComp is installed. See below.
	:config
	(lsp-javacomp-install-server))

(add-hook 'java-mode-hook (lambda () 
														(setq c-basic-offset 2
														tab-width 2
														indent-tabs-mode t)))

(provide 'init-java)
