;;; init-git.el --- Git SCM support -*- lexical-binding: t -*-
;;; Commentary:

(use-package git-blamed :ensure t)
(use-package gitignore-mode :ensure t)
(use-package gitconfig-mode :ensure t)
(use-package git-timemachine :ensure t)

(use-package magit
  :ensure t
  :config
  (setq-default magit-diff-refine-hunk t)
  :bind (("C-x g" . magit-status)))

(use-package fullframe :ensure t)

(use-package magit-todos
  :ensure t
  :after(magit)
  :config
  (fullframe magit-status magit-mode-quit-window)
  )

(provide 'init-git)
;;; init-git.el ends here
