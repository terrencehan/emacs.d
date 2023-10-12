;;; init-editing-utils.el --- Day-to-day editing helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package unfill)

(when (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode))

(maybe-require-package 'list-unicode-display)

;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 create-lockfiles nil
 auto-save-default nil
 make-backup-files nil
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(add-hook 'after-init-hook 'transient-mark-mode)

(use-package beacon
  :init
  (add-hook 'after-init-hook 'beacon-mode)
  :config
  (setq-default beacon-lighter "")
  (setq-default beacon-size 20))

;;; Newline behaviour

(global-set-key (kbd "RET") 'newline-and-indent)

(after-load 'subword
  (diminish 'subword-mode))

(when (fboundp 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 1)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package symbol-overlay
  :diminish symbol-overlay-mode
  :bind (
         :map symbol-overlay-mode-map
              ("M-i" . symbol-overlay-put)
              ("M-I" . symbol-overlay-remove-all)
              ("M-n" . symbol-overlay-jump-next)
              ("M-p" . symbol-overlay-jump-prev))
  :hook (prog-mode . symbol-overlay-mode))

(use-package browse-kill-ring
  :bind (("M-Y" . browse-kill-ring)
         :map browse-kill-ring-mode-map
         ("C-g" . browse-kill-ring-quit)
         ("M-n" . browse-kill-ring-forward)
         ("M-p" . browse-kill-ring-previous)))

;;----------------------------------------------------------------------------
;; Don't disable narrowing commands
;;----------------------------------------------------------------------------
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;;----------------------------------------------------------------------------
;; Show matching parens
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook 'show-paren-mode)

;;----------------------------------------------------------------------------
;; Expand region
;;----------------------------------------------------------------------------
(use-package expand-region
  :bind (("M-s n" . er/expand-region)))

;;----------------------------------------------------------------------------
;; Don't disable case-change functions
;;----------------------------------------------------------------------------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(use-package avy
  :bind (("M-s s" . avy-goto-char))
  :config
  (setq avy-styles-alist '((avy-goto-char . at-full)))
  (setq avy-background t))

(use-package multiple-cursors)

;;----------------------------------------------------------------------------
;; Page break lines
;;----------------------------------------------------------------------------
(use-package page-break-lines
  :diminish page-break-lines-mode
  :init
  (add-hook 'after-init-hook 'global-page-break-lines-mode))

;;----------------------------------------------------------------------------
;; Cut/copy the current line if no region is active
;;----------------------------------------------------------------------------
(use-package whole-line-or-region
  :diminish whole-line-or-region-local-mode
  :init
  (add-hook 'after-init-hook 'whole-line-or-region-global-mode))


(use-package highlight-escape-sequences
  :init
  (add-hook 'after-init-hook 'global-page-break-lines-mode))

(use-package which-key
  :diminish which-key-mode
  :init
  (add-hook 'after-init-hook 'which-key-mode))

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
