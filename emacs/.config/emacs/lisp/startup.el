(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(setq initial-scratch-message nil)

(defun display-startup-echo-area-message ()
  (message ""))
(setq inhibit-startup-echo-area-message "GNU")

;; Garbage collector
(setq gc-cons-threshold (* 50 1000 1000))
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 2 1000 1000))))

(provide 'startup)
