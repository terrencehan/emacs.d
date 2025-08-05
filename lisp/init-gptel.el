;;; init-go.el --- Support for the Go language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package gptel
  :ensure t
  :config
  (setq gptel-log-level 'debug)
  (setq gptel-model "qwen3-nothinking")
  (setq gptel-prompt-prefix-alist '((markdown-mode . "### ")
                                    (org-mode . "*** ")
                                    (text-mode . ">>> ")))
  (setq gptel-response-prefix-alist '((markdown-mode . "### ")
                                      (org-mode . "*** ")
                                      (text-mode . "💬 ")))
  (setq gptel-backend
        (gptel-make-openai "bkaidev"
          :host (getenv "BKAI_HOST")
          :protocol "https"
          :endpoint "/prod/openapi/aidev/gateway/llm/v1/chat/completions/"
          :header `(("X-Bkapi-Authorization" . ,(format "{\"bk_app_code\": \"%s\", \"bk_app_secret\": \"%s\"}"
                                                        (getenv "BKAI_APP_CODE")
                                                        (getenv "BKAI_APP_SECRET")))
                    ("Content-Type" . "application/json"))
          :stream t
          :key 'gptel-api-key
          :models '("deepseek-r1"))))

(provide 'init-gptel)
;;; init-rust.el ends here
