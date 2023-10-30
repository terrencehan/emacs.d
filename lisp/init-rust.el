;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package rust-mode
  :hook (rust-mode . lsp)
  :config
  (setq lsp-rust-analyzer-proc-macro-enable t))

(provide 'init-rust)
;;; init-rust.el ends here
