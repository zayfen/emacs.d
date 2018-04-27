(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (add-hook 'python-mode-hook
                (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))

(add-hook 'python-mode-hook
          (lambda ()
            (setq-default indent-tabs-mode t)
            (setq-default tab-width 2)
            (setq-default python-indent-offset 2)
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(provide 'init-python)
