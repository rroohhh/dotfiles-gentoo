;;; main-config --- main non mode / package specific configuation
;;; Commentary:
;;; Code:


(require 'essentials)
(require 'functions)
(require 'theme)

(setq global-mark-ring-max 5000             ; increase mark ring to contains 5000 entries
	  mark-ring-max 5000                ; increase kill ring to contains 5000 entries
	  mode-require-final-newline t      ; add a newline to end of file
	  tab-width 4                       ; default to 4 visible spaces to display a tab
	  )

;; disable lockfiles, I only use emacs as server -> no clashes
(setq create-lockfiles nil)

;;(add-hook 'evil-normal-state-entry-hook '(lambda () ((save-buffer))))

;; use a global backup directory to prevent the backup from being scatted all over the place
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
	  backup-by-copying t    ; Don't delink hardlinks
	  version-control t      ; Use version numbers on backups
	  delete-old-versions t  ; Automatically delete excess backups
	  kept-new-versions 20   ; how many of the newest versions to keep
	  kept-old-versions 5    ; and how many of the old
	  )

;; M-Arrows for navigating windows
(windmove-default-keybindings 'meta)

;; set utf8 as default
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; auto indent on return
(global-set-key (kbd "RET") 'newline-and-indent)

;; realllllllyyyy slow on big org files...
;; (use-package nlinum-relative
;;   :config
;;   ;; something else you want
;;   (eval-after-load 'evil
;; 	(lambda ()
;; 	  (setq nlinum-relative-current-symbol "->")
;; 	  (nlinum-relative-setup-evil)
;; 	  (global-nlinum-relative-mode))))

;; disable menu bar
(menu-bar-mode -1)

;; disable tool bar
(tool-bar-mode -1)

;; disable scroll bar
(scroll-bar-mode -1)

;; disable suspend
;; (put 'suspend-frame 'disabled t)

;; enable time in modeline
(display-time-mode 1)


;; minimal fringes
;; (fringe-mode 15)

;; strip emacs even more
;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Prevent the cursor from blinking
(blink-cursor-mode 0)
(setq visible-cursor nil)

(setq inhibit-startup-echo-area-message "robin")
(toggle-frame-fullscreen)

;; override selection
(delete-selection-mode 1)

;; always show matching brackets
(show-paren-mode 1)

;; no linenumbers in shell
(add-hook 'shell-mode-hook (linum-mode 0))

;; use abbrev-mode
(setq default-abbrev-mode t)

(diminish 'abbrev-mode)

(define-key global-map [(control v)] ctl-x-map)

(use-package beacon
  :ensure t
  :config
  (progn
	(beacon-mode 1)
	(setq beacon-push-mark 0)
	(setq beacon-color "#666600")))

(use-package real-auto-save
  :diminish real-auto-save-mode
  :demand
  :init
  (setq real-auto-save-interval 10) ;; in seconds
  :config
  (add-hook 'fundamental-mode 'real-auto-save-mode))

(use-package git-gutter
  :demand
  :config
  (git-gutter:linum-setup)
  (global-git-gutter-mode +1))

(use-package fzf
  :demand
  :config
  (setq fzf/executable "~/.fzf/bin/fzf"))

;;(setq gc-cons-threshold 300000000)

;;(defun my-minibuffer-setup-hook ()
;;  (setq gc-cons-threshold most-positive-fixnum))

;;(defun my-minibuffer-exit-hook ()
;;  (setq gc-cons-threshold 800000))

;;(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
;;(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;; ispell config
(use-package ispell
  :demand
  :config
  ;; (add-to-list 'ispell-dictionary-alist '("deutsch-hunspell"
  ;; 												"[[:alpha:]]"
  ;; 												"[^[:alpha:]]"
  ;; 												"[']"
  ;; 												t
  ;; 												("-d" "de_DE"); Dictionary file name
  ;; 												nil
  ;; 												iso-8859-1))

  ;; (add-to-list 'ispell-local-dictionary-alist '("english-hunspell"
  ;; 												"[[:alpha:]]"
  ;; 												"[^[:alpha:]]"
  ;; 												"[']"
  ;; 												t
  ;; 												("-d" "en_US")
  ;; 												nil
  ;; 												iso-8859-1))

  ;; (setq ispell-program-name "aspell")
  ;; (setq ispell-program-name "aspell"          ; Use hunspell to correct mistakes
		;; ispell-dictionary   "deutsch-hunspell") ; Default dictionary to use
  ;; (add-to-list 'ispell-skip-region-alist '(org-property-drawer-re))
  ;; (message "%s" org-optio)
  )

(use-package flyspell
  :demand)

(setq font-latex-fontify-script nil)

(set-variable 'fill-column 100)
(add-hook 'org-mode 'turn-on-auto-fill)

(provide 'main-config)
;;; main-config.el ends here
