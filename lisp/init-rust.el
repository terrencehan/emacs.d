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


(with-eval-after-load 'flymake
  ;; 1. 封死文本指示符：让它想画字符时画出空字符串
  (setq flymake-note-indicator ""
        flymake-warning-indicator ""
        flymake-error-indicator ""
        flymake-note-error-indicator ""
        flymake-warning-error-indicator "")

  ;; 2. 封死计数器：不让它显示 !!2
  (setq flymake-suppress-zero-counters t)

  ;; 3. 封死绘图逻辑：这是最暴力的，直接拦截它的绘图指令
  ;; 无论它想在 Fringe 还是 Margin 画东西，都返回 nil
  (advice-add 'flymake--fringe-overlay-spec :override (lambda (&rest _) nil))
  (advice-add 'flymake--margin-overlay-spec :override (lambda (&rest _) nil)))


(provide 'init-rust)
;;; init-rust.el ends here
