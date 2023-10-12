;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package all-the-icons)

(use-package lsp-mode)

(use-package dap-mode
  :after (lsp-mode))

(use-package lsp-ui)

(provide 'init-lsp)
;;; init-python.el ends here
