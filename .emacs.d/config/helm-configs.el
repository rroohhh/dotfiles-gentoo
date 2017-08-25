;;; helm-configs.el --- helm config
;;; Commentary:

;;; Code:
(use-package helm-config
  :demand
  :ensure helm
  :diminish helm-mode
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-multi-swoop-edit-save t)
  (setq helm-split-window-in-side-p           t)
  (setq helm-move-to-line-cycle-in-source     t)
  :bind (([remap execute-extended-command] . helm-M-x)
		 ([remap find-file] . helm-find-files)
		 ([remap list-all-buffers] . helm-buffers-list)
		 ("M-y" . helm-show-kill-ring))
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1))

(use-package helm-ag
  :demand
  :config
  (custom-set-variables
   '(helm-ag-base-command "rg --vimgrep --no-heading --glob *.org")))

(use-package helm-swoop
  :demand
  :bind (([remap isearch-forward] . helm-swoop)
		 ([remap isearch-backward] . helm-swoop)
		 ;("M-s s" . helm-multi-swoop-all)
		 ("C-v C-b" . helm-buffers-list)
		 ("C-x C-b" . helm-buffers-list)))
(provide 'helm-configs)
;;; helm-configs.el ends here
