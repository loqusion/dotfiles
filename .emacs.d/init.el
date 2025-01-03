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

(use-package esup
  :commands esup
  ;; Workaround for bug: https://github.com/jschaf/esup/issues/54#issuecomment-651247749
  :init (setq esup-depth 0))

(use-package zerodark-theme
  :init (load-theme 'zerodark t))

(use-package evil
  :init
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo)
  (evil-set-leader '(normal visual motion) (kbd "SPC"))
  (evil-define-key '(normal visual) 'global (kbd "j") 'evil-next-visual-line)
  (evil-define-key '(normal visual) 'global (kbd "k") 'evil-previous-visual-line)
  (evil-define-key '(normal visual) 'global (kbd "q") 'evil-execute-last-recorded-macro)
  (evil-define-key '(normal visual) 'global (kbd "Q") 'evil-record-macro))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package which-key
  ;; :diminish which-key-mode
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
(setq line-number-mode t)
(setq column-number-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(column-number-mode t)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen nil)
 '(menu-bar-mode nil)
 '(package-selected-packages '(esup evil which-key magit))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(save-place-mode t)
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
