;; -*- lexical-binding: t; -*-
(require 'package)
(setq package-archives '(("melpa"  . "https://melpa.org/packages/")
                          ("gnu"    . "https://elpa.gnu.org/packages/")
                          ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package batppuccin
  :config
  (load-theme 'batppuccin-mocha t))

;; (use-package evil
;;   :init
;;   (setq evil-want-integration t
;;         evil-want-keybinding nil
;;         evil-want-C-u-scroll t
;;         evil-want-C-i-jump nil
;;         evil-undo-system 'undo-redo)
;;   :config
;;   (evil-mode 1))

;; (use-package evil-collection
;;   :after evil
;;   :config
;;   (evil-collection-init))

;; (use-package evil-commentary
;;   :after evil
;;   :config
;;   (evil-commentary-mode))

;; (use-package evil-surround
;;   :after evil
;;   :config
;;   (global-evil-surround-mode 1))

(use-package org-tree-slide)

(use-package magit)
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package vertico
  :init
  (vertico-mode 1)
  :custom
  (vertico-cycle t))

(use-package marginalia
  :after vertico
  :init
  (marginalia-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package consult
  :bind (
         ("C-s" . consult-line)
         ("C-x b" . consult-buffer)
         ("C-x f" . find-file)
         ("C-x r" . consult-ripgrep)
         ;;:map evil-normal-state-map
))

(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; (evil-set-leader 'normal (kbd "SPC"))

;; (evil-define-key 'normal 'global
;;   (kbd "<leader>ff") 'find-file
;;   (kbd "<leader>fr") 'consult-recent-file
;;   (kbd "<leader>bb") 'consult-buffer
;;   (kbd "<leader>ps") 'consult-ripgrep
;;   (kbd "<leader>SPC") 'execute-extended-command)

(use-package which-key
    :config
    (which-key-mode))


(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "slant"
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-set-close-button nil
        centaur-tabs-set-modified-marker t)
  :bind
  ;;(:map evil-normal-state-map
    ;;    ("g t" . centaur-tabs-forward)
  ;;      ("g T" . centaur-tabs-backward))

  )

(use-package company
  :after lsp-mode
  :init (global-company-mode 1)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection)
         :map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  (company-selection-wrap-around t))

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package org-present
  :ensure t
  :config
  (add-hook 'org-present-mode-hook
            (lambda ()
              (org-present-big)
              (org-present-hide-cursor)
              (org-present-read-only)))
  (add-hook 'org-present-mode-quit-hook
            (lambda ()
              (org-present-small)
              (org-remove-inline-images)
              (org-present-show-cursor)
              (org-present-read-write))))

(use-package visual-fill-column
  :ensure t
  :config
  (add-hook 'org-present-mode-hook
            (lambda ()
              (setq visual-fill-column-width 100
                    visual-fill-column-center-text t)
              (visual-fill-column-mode 1))))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package vterm)

(use-package chess)
(use-package pacmacs)

(provide 'packages)
