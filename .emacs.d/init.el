;;; Init.el --- my init file for emacs
;;; Commentary:

;;; Code:
(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
						 ("org" . "http://orgmode.org/elpa/")
						 ("marmalade" . "http://marmalade-repo.org/packages/")
						 ("gnu" . "http://elpa.gnu.org/packages/")))

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
 '(debug-on-error nil)
 '(helm-ag-base-command "rg --vimgrep --no-heading")
 '(package-selected-packages
   (quote
	(json-reformat cargo rust-mode evil-surround ycmd-eldoc org commenter fzf counsel ivy ivy-mode beacon adaptive-wrap ievil-iedit-state evil-iedit-state auto-insert zenburn-theme ws-butler web-mode web-beautify use-package spaceline smart-mode-line-powerline-theme smart-comment rtags real-auto-save rainbow-delimiters pretty-mode org-bullets org-beautify-theme notmuch nlinum-relative modern-cpp-font-lock magit linum-relative latex-preview-pane irony-eldoc iedit hungry-delete helm-swoop helm-projectile helm-ag gruvbox-theme gnuplot-mode git-gutter flycheck-ycmd flycheck-irony fancy-battery f expand-region evil-smartparens evil-org evil-mc evil-matchit evil-god-state company-ycmd company-try-hard company-statistics company-irony-c-headers company-irony company-auctex cmake-mode cmake-ide clang-format avy)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "securesmtp.t-online.de"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-helper ((t (:foreground "#83A598" :height 1.3))))
 '(helm-source-header ((t (:foreground "#d5c4a1" :height 1.3)))))

(provide 'init)
