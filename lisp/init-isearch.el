(use-package anzu
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq anzu-mode-lighter "")
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (add-hook 'after-init-hook 'global-anzu-mode))

(provide 'init-isearch)
