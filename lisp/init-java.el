(defun ensime-java-mode-hook ()
  (ensime-mode 1))

(add-hook 'java-mode-hook 'ensime-java-mode-hook)

(add-hook 'java-mode-hook (lambda ()
                            (setq indent-tabs-mode nil)))

(add-hook 'compilation-mode-hook (lambda ()
                                   (setq compilation-scroll-output 'first-error)))
;;; c mode configuration
(defconst lgfang-c-style
  '((c-tab-always-indent        . t)
    (c-basic-offset . 2)
    (c-ignore-auto-fill . nil)
    (c-comment-only-line-offset . (0 . 0))
    (c-hanging-braces-alist     . ((substatement-open after before)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist . ((knr-argdecl-intro . 5)
                        (arglist-intro . +)
                        (arglist-close . c-lineup-close-paren)
                        (inclass . +)
                        (member-init-intro . +)
                        (statement-block-intro . +)
                        (defun-block-intro . +)
                        (substatement-open . 0)
                        (label . 0)
                        (statement-case-open . +)
                        (statement-case-intro . +)
                        (case-label . 2)
                        (statement-cont . c-lineup-math)
                        (inline-open . 0)
                        (brace-list-open . +)
                        (topmost-intro-cont . 0)
                        (c . 1) ; "c" for continue of comment, not "c
                                        ; programming language"
                        ))
    (c-special-indent-hook . c-gnu-impose-minimum)
    (c-block-comment-prefix . "lgf: ")
    (c-comment-prefix-regexp . ((awk-mode . "#+(lgf: )?")
                                (other ."lgf: \\|//+\\|\\**")))
    ;; go to this file and test if c block comments works
    ;; [[file:./patches/comments-test.c]]
    (c-echo-syntactic-information-p . t))
  "lgfang's C Programming Style")
(c-add-style "lgfang" lgfang-c-style nil)

(add-hook 'java-mode-hook
          (lambda ()
            (c-set-style "lgfang")
            (c-toggle-hungry-state 1)
            (hs-minor-mode 1)
            (turn-on-cwarn-mode)

            (set-fill-column 100)
            (setq fci-rule-color "gray")

            (turn-on-fci-mode)
            ;; (eldoc-mode 1)
            ))

(defun hl-show-java-error ()
  (interactive)
  (print (ensime-errors-at (point))))

(provide 'init-java)
