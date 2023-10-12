;;; init-yaml.el --- Support Yaml files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package yaml-mode
  :ensure t
  :config
  (add-auto-mode 'yaml-mode "\\.yml\\.erb\\'"))

(provide 'init-yaml)
;;; init-yaml.el ends here
