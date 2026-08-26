(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(set-face-attribute 'default nil
                    :font "JetBrainsMono Nerd Font"
                    :height 140
                    :weight 'normal)

(provide 'ui)
