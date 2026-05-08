
(use-package org-roam
  :config
  (setq org-roam-directory "~/org-roam")
    :hook ((after-init . org-roam-setup)))

(provide 'init-org-roam)
