;;; evil-config.el --- my evil config, still in progress
;;; Commentary:

;;; Code:

(use-package evil
  :demand
  :init
  (setq evil-want-C-w-delete t)
  (setq evil-want-C-u-scroll t)
  (setq evil-cross-lines t)
  (setq evil-want-fine-undo t)
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  (evil-define-key 'insert term-mode-map "\C-n" 'self-insert-command)
  (evil-define-key 'insert term-mode-map "\C-p" 'self-insert-command)
  (evil-define-key 'normal global-map (kbd "öö") 'indent-region-or-buffer)
  (evil-define-key 'normal global-map (kbd "s") 'evil-backward-char)
  (evil-define-key 'normal global-map (kbd "n") 'evil-next-line)
  (evil-define-key 'normal global-map (kbd "t") 'evil-previous-line)
  (evil-define-key 'visual global-map (kbd "s") 'evil-backward-char)
  (evil-define-key 'visual global-map (kbd "n") 'evil-next-line)
  (evil-define-key 'visual global-map (kbd "t") 'evil-previous-line)
  (evil-define-key 'normal org-mode-map (kbd "ö.") 'org-edit-special)
  (evil-define-key 'normal org-mode-map (kbd "o") 'evil-org-open-below)
  (evil-define-key 'normal org-mode-map (kbd "O") 'evil-org-open-above)
  (evil-define-key 'insert global-map "\C-e" 'end-of-line)
  (evil-define-key 'insert global-map "\C-h" 'evil-delete-backward-char-and-join)
  (evil-define-key 'insert global-map "\C-u" 'evil-delete-line)
  (add-hook 'evil-insert-state-entry-hook (lambda () (if buffer-file-name (save-buffer))))
  (add-hook 'evil-insert-state-exit-hook (lambda () (if buffer-file-name (save-buffer))))
  (defalias #'forward-evil-word #'forward-evil-symbol))

(use-package god-mode
  :demand)

(use-package evil-god-state
  :demand
  :config
  (evil-define-key 'normal global-map (kbd "¨") 'evil-execute-in-god-state))

;; ToDo(robin): make own keybindings for compile, rtags (jump to definition etc.) flycheck (jump to error, etc)
(use-package evil-leader
  :demand
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
	"SPC" 'save-buffer
	"f" 'helm-find-files
	"j" 'helm-buffers-list
	"a" 'helm-ag))

(use-package evil-matchit
  :demand
  :config
  (global-evil-matchit-mode 1))

(use-package evil-mc
  :demand
  :diminish global-evil-mc-mode
  :config
  (global-evil-mc-mode))

(global-set-key (kbd "M-s") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-n") 'windmove-down)
(global-set-key (kbd "M-t") 'windmove-up)

(global-set-key (kbd "M-L") 'next-buffer)
(global-set-key (kbd "M-S") 'previous-buffer)

;; ToDo(robin): add keybinds for switching buffers and moving via sexps and projectile and internal helm movement/persistent option (define-key helm-mode-map [tab] 'a-command)

(use-package expand-region
  :demand
  :config
  (evil-define-key 'normal global-map (kbd "ä") 'er/expand-region))

(use-package avy
  :demand
  :config
  (evil-define-key 'normal global-map (kbd "gs") 'avy-goto-char-timer)
  (avy-setup-default))

(use-package evil-org
  :demand
  :config
  (evil-define-key 'normal evil-org-mode-map (kbd "s") 'evil-backward-char)
  (evil-define-key 'normal evil-org-mode-map (kbd "n") 'evil-next-line)
  (evil-define-key 'normal evil-org-mode-map (kbd "t") 'evil-previous-line)
  (evil-define-key 'visual evil-org-mode-map (kbd "s") 'evil-backward-char)
  (evil-define-key 'visual evil-org-mode-map (kbd "n") 'evil-next-line)
  (evil-define-key 'visual evil-org-mode-map (kbd "t") 'evil-previous-line))

(use-package evil-surround
  :demand
  :config
  (global-evil-surround-mode 1))

(use-package evil-goggles
  :ensure t
  :config
  (evil-goggles-mode)
  (evil-goggles-use-diff-faces))

(use-package evil-terminal-cursor-changer
  :config
  (unless (display-graphic-p)
	(etcc-on)))

(provide 'evil-config)
;;; evil-config.el ends here
