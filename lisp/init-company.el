;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package company
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (dolist (backend '(company-eclim company-semantic))
    (delq backend company-backends))
  (define-key company-mode-map (kbd "M-/") 'company-complete)
  (define-key company-active-map (kbd "M-/") 'company-other-backend)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq-default company-dabbrev-other-buffers 'all
                company-tooltip-align-annotations t)
  )

(use-package company-quickhelp
  :after (company)
  :init
  (add-hook 'after-init-hook 'company-quickhelp-mode))

(provide 'init-company)
;;; init-company.el ends here
