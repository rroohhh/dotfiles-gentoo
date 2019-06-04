;;; Init.el --- my init file for emacs
;;; Commentary:

;;; Code:
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")
						 ("marmalade" . "https://marmalade-repo.org/packages/")
						 ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/config/")
;; (add-to-list 'load-path "~/.emacs.d/github/xelb")
;; (add-to-list 'load-path "~/.emacs.d/github/exwm")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)

(require 'packages)
(require 'main-config)
(require 'magit-config)
(require 'evil-config)
(require 'projectile-config)
(require 'code-config)
(require 'company-config)
(require 'cpp-config)
(require 'latex-config)
(require 'mail-config)
(require 'gnuplot-config)
(require 'ycmd-config)
(require 'theme)
(require 'web-config)
(require 'helm-configs)
(require 'rust-config)

;; (add-to-list 'default-frame-alist '(background-color . "#000000"))
(set-background-color "#282828")

;; (load "server")
;; (unless (server-running-p) (server-start))

(setq color-theme-is-global nil)

(if (daemonp)
    (add-hook 'after-make-frame-functions
			  (lambda (frame)
				(with-selected-frame frame
				  (load "theme")
				  (if (not (window-system frame)) (set-background-color "#000000")))))
  (load "theme"))

;; ToDo(robin): fill these
;; (require 'd-config)
;; (require 'web-config)
(require 'org-config)
;; (require 'maxima-config)
;; (require 'java-config)
;; (require 'gdb-config)

(load "/home/robin/.emacs.d/keylogger.el")
(keylogger-go)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(debug-on-error t)
 '(describe-char-unidata-list
   (quote
	(name old-name general-category decomposition decimal-digit-value digit-value numeric-value)))
 '(global-hl-line-mode t)
 '(helm--remap-mouse-mode t)
 '(helm-ag-base-command "rg --vimgrep --no-heading")
 '(package-selected-packages
   (quote
	(evil-collection company-tern scad-mode yaml-mode spinner wolfram-mode org-plus-contrib typescript-mode ob-rust dts-mode which-key persistent-scratch json-mode go-mode oberon evil-goggles evil json-reformat cargo rust-mode evil-surround ycmd-eldoc org commenter fzf counsel ivy ivy-mode beacon adaptive-wrap ievil-iedit-state evil-iedit-state auto-insert zenburn-theme ws-butler web-mode web-beautify use-package spaceline smart-mode-line-powerline-theme smart-comment rtags real-auto-save rainbow-delimiters pretty-mode org-bullets org-beautify-theme notmuch nlinum-relative modern-cpp-font-lock magit linum-relative latex-preview-pane irony-eldoc iedit hungry-delete helm-swoop helm-projectile helm-ag gruvbox-theme gnuplot-mode git-gutter flycheck-ycmd flycheck-irony fancy-battery f expand-region evil-smartparens evil-org evil-mc evil-matchit evil-god-state company-ycmd company-try-hard company-statistics company-irony-c-headers company-irony company-auctex cmake-mode cmake-ide clang-format avy)))
 '(spaceline-helm-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed))))
 '(helm-helper ((t (:foreground "#83A598" :height 1.3))))
 '(helm-source-header ((t (:foreground "#d5c4a1" :height 1.3)))))

(provide 'init)
(put 'downcase-region 'disabled nil)
