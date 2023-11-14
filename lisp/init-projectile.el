;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :init
  (add-hook 'after-init-hook 'projectile-mode)
  ;; Shorter modeline
  (setq-default projectile-mode-line-prefix " Proj")

  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

;(use-package ibuffer-projectile
;  :after (projectile))

(provide 'init-projectile)
;;; init-projectile.el ends here
