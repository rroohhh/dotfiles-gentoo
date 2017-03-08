;;; swiper-config.el --- swiper config
;;; Commentary:

;;; Code:

(use-package ivy
  :demand
  :diminish ivy-mode
  :init
  :bind
  :config
  ;; (ivy-mode 1)
  ;; (setq ivy-use-virtual-buffers nil)
  )

(use-package counsel
  :demand
  :init
  :bind
  :config)

(provide 'swiper-config)
;;; swiper-config.el ends here
