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

;; Jump to visible text (similar to vim-easymotion)
(use-package avy
  :bind (("C-:" . avy-goto-char-timer)
         ("C-'" . avy-goto-char-2)
         ("M-g g" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         :map isearch-mode-map
         ("C-'" . avy-isearch))
  :config
  (setq avy-timeout-seconds 0.3)
  ;; Dim the buffer while choosing a target
  (setq avy-background t))

;; Git porcelain
(use-package magit
  :bind ("C-x g" . magit-status)
  :init
  ;; Disable Emacs VC for Git
  (setq vc-handled-backends (delq 'Git vc-handled-backends)))

;; Display key bindings in a popup
(use-package which-key
  :config (which-key-mode))

(use-package dashboard
  :demand t
  :init
  (setq inhibit-startup-message t)
  :config
  (dashboard-setup-startup-hook))

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
   '(avy dashboard esup magit spacemacs-theme which-key zerodark-theme))
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
