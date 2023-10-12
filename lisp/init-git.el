;;; init-git.el --- Git SCM support -*- lexical-binding: t -*-
;;; Commentary:

(use-package git-blamed)
(use-package gitignore-mode)
(use-package gitconfig-mode)
(use-package git-timemachine)

(use-package magit
  :config
  (setq-default magit-diff-refine-hunk t)
  :bind (("C-x g" . magit-status)))

(use-package fullframe)

(use-package magit-todos
  :after(magit)
  :config
  (fullframe magit-status magit-mode-quit-window)
  )

(provide 'init-git)
;;; init-git.el ends here
