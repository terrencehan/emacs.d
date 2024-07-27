
(use-package org-roam
  :ensure t
  :config
  (setq org-roam-directory "~/org-roam")
    :hook ((after-init . org-roam-setup))

(provide 'init-org-roam)
