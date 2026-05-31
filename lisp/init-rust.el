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

(use-package breadcrumb
  :hook (eglot-managed-mode . breadcrumb-local-mode)
  :config
  ;; 🌟【核心修复】设置正确的 Imenu（函数/Trait）最大长度限制
  ;; 默认是 0.3（占窗口宽度的 30%），这里改成 150（允许显示 150 个字符）
  (setq breadcrumb-imenu-max-length 150)

  ;; 设置项目/文件路径的最大长度（0 表示完全不裁剪，或者设为 20 强行压缩文件路径）
  (setq breadcrumb-project-max-length 20)
  ;; 让 breadcrumb 优先使用 eglot/lsp 的后端数据
  (setq breadcrumb-imenu-generic-expression nil))

(use-package eat)

(use-package ai-code
  :init
  (setq ai-code-onboarding-auto-show nil)
  ;; :straight (:host github :repo "tninja/ai-code-interface.el") ;; if you want to use straight to install, no need to have MELPA setting above
  :config
  ;; use codex as backend, other options are 'claude-code, 'gemini, 'github-copilot-cli, 'opencode, 'kilo, 'grok, 'cursor, 'kiro, 'codebuddy, 'aider, 'eca, 'agent-shell, 'claude-code-ide, 'claude-code-el
  (ai-code-set-backend 'codex)
  ;; Optional: default menu stays unchanged; use a narrower 2-column layout on smaller frames
  ;; (setq ai-code-menu-layout 'two-columns)
  ;; Enable global keybinding for the main menu
  (global-set-key (kbd "C-c a") #'ai-code-menu)
  ;; Optional: Use eat if you prefer, by default it is vterm
  (setq ai-code-backends-infra-terminal-backend 'eat) ;; config for native CLI backends. for external backends such as agent-shell, claude-code-ide.el and claude-code.el, please check their own config
  ;; Optional: Try ghostel as an backend infra
  ;; (setq ai-code-backends-infra-terminal-backend 'ghostel)
  ;; Optional: Disable @ file completion in comments and AI sessions
  ;; (ai-code-prompt-filepath-completion-mode -1)
  ;; Optional: Ask AI to run test after code changes, for a tighter build-test loop
  (setq ai-code-auto-test-type 'ask-me)
  ;; Optional: Disable numbered next steps for discussion prompts at send time
  ;; (enabled by default)
  ;; (setq ai-code-discussion-auto-follow-up-enabled nil)
  ;; Optional: In AI session buffers, SPC in Evil normal state triggers the prompt-enter UI
  (with-eval-after-load 'evil (ai-code-backends-infra-evil-setup))
  ;; Optional: Turn on auto-revert buffer, so that the AI code change automatically appears in the buffer
  (global-auto-revert-mode 1)
  (setq auto-revert-interval 1) ;; set to 1 second for faster update
  ;; Optional: Set up Magit integration for AI commands in Magit popups
  (with-eval-after-load 'magit
    (ai-code-magit-setup-transients)))


(use-package rust-mode
  :config
  (add-hook 'eglot-managed-mode-hook (lambda () (eldoc-mode -1)))
  :hook
  (rust-mode . eglot-ensure))



(provide 'init-rust)
;;; init-rust.el ends here
