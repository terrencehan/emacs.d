;;; init-git.el --- Git SCM support -*- lexical-binding: t -*-
;;; Commentary:

(use-package git-blamed)
(use-package gitignore-mode)
(use-package gitconfig-mode)
(use-package git-timemachine)

(use-package magit
  :config
  (setq-default magit-diff-refine-hunk t)
  (fullframe magit-status magit-mode-quit-window)
  :bind (("C-x g" . magit-status)))

(use-package fullframe)

(use-package magit-todos
  :after(magit)
  )

(provide 'init-git)
;;; init-git.el ends here
