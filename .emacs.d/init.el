;; Make startup faster by reducing the frequency of garbage
;; collection. The default is 800 kilobytes.
;; The threshold is lowered again after initialization.
(setq gc-cons-threshold (* 50 1000 1000))

(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-always-defer t)

;; Emacs Start Up Profiler
(use-package esup
  :commands esup
  ;; Workaround for bug: https://github.com/jschaf/esup/issues/54#issuecomment-651247749
  :init (setq esup-depth 0))

;; Themes
(use-package spacemacs-theme)
(use-package zerodark-theme)

(load-theme 'spacemacs-dark t)

(defun set-alpha (alpha)
  "Set the frame opacity (alpha transparency)."
  (interactive)
  (set-frame-parameter nil 'alpha-background alpha)
  (setf (alist-get 'alpha-background default-frame-alist) alpha))
(set-alpha 95)

;; Vim keymaps to avoid Emacs pinky
(use-package evil
  :demand t
  ;; :init
  ;; (setq evil-want-Y-yank-to-eol t)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo)
  (evil-set-leader '(normal visual motion) (kbd "SPC"))

  (customize-set-variable 'evil-want-Y-yank-to-eol t)

  (evil-define-key '(normal visual) 'global
    (kbd "j") 'evil-next-visual-line
    (kbd "k") 'evil-previous-visual-line
    (kbd "q") 'evil-execute-last-recorded-macro
    (kbd "Q") 'evil-record-macro))

;; Shows number of matches in mode-line when searching with evil.
(use-package evil-anzu
  :after (evil)
  ;; Lazy loading doesn't provide much benefit because evil-anzu
  ;; only defines four defadvices
  :demand t)

;; Motions and text objects for delimited function arguments.
(use-package evil-args
  :after (evil)
  :bind
  (:map evil-inner-text-objects-map
   ("a" . evil-inner-arg)
   :map evil-outer-text-objects-map
   ("a" . evil-outer-arg)))

;; Modal-editing optimized for editing Lisp.
;; TODO: Add lispy
;; (use-package evil-cleverparens
;;   :after (evil)
;;   :hook (

;; Enables two char keypress to exit most modes.
(use-package evil-escape
  :after (evil)
  :hook (pre-command . evil-escape-pre-command-hook)
  :init
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-unordered-key-sequence t)
  :config
  (message "evil-escape loaded"))

;; Highlight changes with evil operations
(use-package evil-goggles
  :after (evil)
  :demand t
  :init
  (setq evil-goggles-duration 0.1)
  :config
  (evil-goggles-mode t))

;; Motions to comment text.
(use-package evil-nerd-commenter
  :after (evil)
  :bind
  (:map evil-normal-state-map
   ("gc" . evilnc-comment-operator)
   :map evil-visual-state-map
   ("gc" . evilnc-comment-or-uncomment-lines))
  :init
  (setq evilnc-comment-text-object "gc"))

;; Vim-style numeric incrementing and decrementing.
(use-package evil-numbers
  :after (evil)
  :bind
  (:map evil-normal-state-map
   ("C-x =" . evil-numbers/inc-at-pt)
   ("C-x +" . evil-numbers/inc-at-pt)
   ("C-x -" . evil-numbers/dec-at-pt)))

;; vim-surround emulation.
(use-package evil-surround
  :after (evil)
  :bind
  (:map evil-operator-state-map
   ("s" . evil-surround-edit)
   ("S" . evil-Surround-edit)
   :map evil-visual-state-map
   ("S" . evil-surround-region)
   ("gS" . evil-Surround-region)))

;; Start a * or # search from the visual selection.
(use-package evil-visualstar
  :after (evil)
  :bind
  (:map evil-visual-state-map
   ("*" . evil-visualstar/begin-search-forward)
   ("#" . evil-visualstar/begin-search-backward)))

;; Jump to visible text (similar to vim-easymotion)
(use-package avy
  :after (evil)
  :bind
  (:map evil-normal-state-map
   ("s" . avy-goto-char)
   ("S" . avy-goto-line)))

;; Git porcelain
(use-package magit
  :bind ("C-x g" . magit-status)
  :init
  ;; Disable Emacs VC for Git
  (setq vc-handled-backends (delq 'Git vc-handled-backends)))

;; Display key bindings in a popup
(use-package which-key
  :config (which-key-mode))

(defun config-visit ()
  "Edit Emacs configuration."
  (interactive)
  (find-file user-init-file))
(keymap-global-set "C-c e" 'config-visit)

(defun config-reload ()
  "Reload Emacs configuration."
  (interactive)
  (load-file user-init-file)
  (condition-case err
      (progn
        (load-file user-init-file)
        (message "Configuration reloaded successfully"))
    (error "%s" (error-message-string err))))
(keymap-global-set "C-c r" 'config-reload)

;; Options
(setq isearch-wrap-pause "no-ding")

(setq ansi-color-names-vector
      ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])

;; Modes
(line-number-mode t)
(column-number-mode t)
(global-display-line-numbers-mode t)
(save-place-mode t)

;; custom-* functions are slow, so I've moved out everything I can
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(evil-visualstar evil-goggles evil-args evil-nerd-commenter evil-surround evil-escape avy esup evil which-key magit))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 113 :width normal :foundry "ADBO" :family "SauceCodePro Nerd Font"))))
 '(fringe ((t (:background "#292b2e")))))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Emacs ready in %s with %d garbage collections."
		     (format "%.2fms"
			     (* 1000 (float-time
				      (time-subtract after-init-time before-init-time))))
		     gcs-done)))
