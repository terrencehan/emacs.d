;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               `(rust-mode . ("rust-analyzer" :initializationOptions
                              (:procMacro (:enable t)
                                          :cargo (:buildScripts (:enable t)
                                                                :features
                                                                "all")))))
  )


(use-package rust-mode
  :config
  (add-hook 'eglot-managed-mode-hook (lambda () (eldoc-mode -1)))
  :hook
  (rust-mode . eglot-ensure))


(provide 'init-rust)
;;; init-rust.el ends here
