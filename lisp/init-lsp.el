;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package lsp-mode
  :ensure t)

(use-package dap-mode
  :ensure t
  :after (lsp-mode))

(use-package lsp-ui
  :ensure t)


(provide 'init-lsp)
;;; init-python.el ends here
