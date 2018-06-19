(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (flatland)))
 '(custom-safe-themes
   (quote
    ("a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (auto-complete-config yari yard-mode yagist xref-js2 writeroom-mode whole-line-or-region whitespace-cleanup-mode wgrep-ag vlf vc-darcs use-package uptimes unfill undo-tree toml-mode tidy tide textile-mode tern-auto-complete tagedit symbol-overlay switch-window sql-indent smex smarty-mode slime-company skewer-less session scss-mode scratch sass-mode ruby-hash-syntax ruby-compilation rspec-mode robe restclient regex-tool rainbow-mode rainbow-delimiters racer purescript-mode psc-ide projectile-rails project-local-variables prettier-js pip-requirements paredit-everywhere page-break-lines ox-impress-js ox-hugo origami org2ctex org2blog org-pomodoro org-plus-contrib org-fstree org-cliplink opencc oauth2 nlinum nginx-mode multiple-cursors move-dup monokai-theme monokai-alt-theme mode-line-bell mmm-mode magithub lua-mode lsp-ui list-unicode-display less-css-mode ledger-mode js-comint ivy-xref ivy-historian ipretty intero immortal-scratch ibuffer-vc httprepl hippie-expand-slime hindent highlight-quoted highlight-escape-sequences helm-xref guide-key goto-gem gnuplot gitignore-mode github-issues github-clone gitconfig-mode git-timemachine git-messenger git-blamed ggtags function-args fullframe flycheck-ycmd flycheck-rust flycheck-package flycheck-ledger flycheck-elm flycheck-color-mode-line flycheck-clojure flatland-theme expand-region exec-path-from-shell erlang ensime elm-mode elisp-slime-nav elein dsvn dotenv-mode dockerfile-mode docker-compose-mode docker disable-mouse diredfl dired-sort dimmer diminish diff-hl dhall-mode default-text-scale darcsum daemons csv-nav csv-mode css-eldoc crontab-mode cquery cpputils-cmake counsel company-ycmd company-terraform company-quickhelp company-php company-lsp company-anaconda command-log-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmd-to-echo cmake-mode cmake-ide cljsbuild-mode cl-lib-highlight cask-mode bundler bug-reference-github browse-kill-ring browse-at-remote better-defaults beacon avy auto-compile anzu aggressive-indent ag add-node-modules-path)))
 '(session-use-package t nil (session))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Mono" :foundry "GOOG" :slant normal :weight normal :height 151 :width normal)))))

(setq-default tab-width 2)

(provide 'init-local)
