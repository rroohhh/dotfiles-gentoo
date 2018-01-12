;;; theme.el --- my theme, gruvbox with some tweaks
;;; Commentary:

;;; Code:

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'gruvbox t)
;; (load-theme 'gruvbox t)

;; (use-package gruvbox-theme
;;   :demand
;;   :config
;;   (load-theme 'gruvbox t))

(use-package spaceline-config
  :ensure spaceline
  :demand
  :init
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  :config
  (spaceline-emacs-theme)
  (spaceline-helm-mode)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-input-method-off)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-toggle-flycheck-error-off)
  (spaceline-toggle-flycheck-warning-off)
  (spaceline-toggle-flycheck-info-off)
  (spaceline-toggle-evil-state))

(use-package powerline
  :demand
  :init
  (setq powerline-default-separator 'arrow))

(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
		(font-lock-add-keywords
		 mode
		 '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
		   ("\\<\\(ToDo\\)" 1 'font-lock-fixme-face t)
		   ("\\<\\(NOTE\\)" 1 'font-lock-note-face t)
		   ("\\<\\(Note\\)" 1 'font-lock-note-face t))))
	  fixme-modes)
(modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)
(modify-face 'spaceline-evil-normal "#282828" "#a09880" nil t nil t nil nil)
(modify-face 'spaceline-evil-insert "#282828" "#80a490" nil t nil t nil nil)
(modify-face 'spaceline-evil-visual "#282828" "#f0bc30" nil t nil t nil nil)
(modify-face 'spaceline-evil-replace "#282828" "#88bc78" nil t nil t nil nil)

;; use a highlight line
(global-hl-line-mode 1)
(set-face-background 'hl-line "midnight blue")

;; some color tweaks
(set-cursor-color "#ff0033")
;; (custom-theme-set-faces 'gruvbox-dark
;; 						`(region ((t :background "#504945"))))

;; default font
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 110
                    :weight 'normal
					:width 'normal)

;; (set-face-bold 'bold nil)

(provide 'theme)
;;; theme.el ends here
