;; -*- lexical-binding: t; -*-
(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(set-face-attribute 'default nil
                    :font "JetBrainsMono Nerd Font"
                    :height 140
                    :weight 'normal)

(defun my/use-terminal-background ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook #'my/use-terminal-background)

(set-face-attribute 'default nil
                    :font "JetBrainsMono Nerd Font"
                    :height 140)

(global-display-line-numbers-mode 1)


(provide 'ui)
