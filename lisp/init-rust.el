;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package rust-mode
  :hook (rust-mode . eglot-ensure))

(provide 'init-rust)
;;; init-rust.el ends here
