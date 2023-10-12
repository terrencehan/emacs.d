;;; init-minibuffer.el --- Config for minibuffer completion       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package orderless
  :ensure t)

(use-package marginalia
  :ensure t
  :init
  (add-hook 'after-init-hook 'marginalia-mode))

(use-package embark
  :ensure t)

(use-package projectile
  :ensure t)

(use-package consult
  :ensure t
  :after (projectile)
  :config
  (setq-default consult-project-root-function 'projectile-project-root)

  (defmacro sanityinc/no-consult-preview (&rest cmds)
    `(with-eval-after-load 'consult
       (consult-customize ,@cmds :preview-key (kbd "M-P"))))

  (sanityinc/no-consult-preview
   consult-ripgrep
   consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-file consult--source-project-file consult--source-bookmark)

  (when (and (executable-find "rg") (maybe-require-package 'affe))
    (defun sanityinc/affe-grep-at-point (&optional dir initial)
      (interactive (list prefix-arg (when-let ((s (symbol-at-point)))
                                      (symbol-name s))))
      (affe-grep dir initial))
    (global-set-key (kbd "M-?") 'sanityinc/affe-grep-at-point)
    (sanityinc/no-consult-preview sanityinc/affe-grep-at-point)
    (with-eval-after-load 'affe (sanityinc/no-consult-preview affe-grep)))

  (global-set-key [remap switch-to-buffer] 'consult-buffer)
  (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
  (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
  (global-set-key [remap goto-line] 'consult-goto-line))

(use-package consult-flycheck
  :ensure t)

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :hook (embark-collect-mode . embark-consult-preview-minor-mode))

(use-package vertico
  :ensure t
  :after (orderless embark marginalia consult)

  :init
  (add-hook 'after-init-hook 'vertico-mode)

  :bind (:map vertico-map
              ("C-c C-o" . embark-export)
              ("C-c C-c" . embark-act))

  :config
  (defun my/use-orderless-in-minibuffer ()
    (setq-local completion-styles '(substring orderless)))
  (add-hook 'minibuffer-setup-hook 'my/use-orderless-in-minibuffer)
  )


(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
