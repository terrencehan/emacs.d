(use-package catppuccin-theme
  :init
  (setq catppuccin-flavor 'mocha)
  ;(setq catppuccin-flavor 'frappe)
  :config
  (load-theme 'catppuccin t)
  ;; 如果在终端运行，强制去除背景色
  (unless (display-graphic-p)
    (set-face-background 'default "none")
    (set-face-background 'line-number "none")
    (set-face-background 'fringe "none")))

(provide 'init-themes)
