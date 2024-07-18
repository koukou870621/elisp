
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-initialize 'use-package))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package tern
  :ensure t
  :hook (js-mode . tern-mode)
  :config
  (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
  (add-hook 'web-mode-hook (lambda () (tern-mode t))))

;; (use-package company-tern
;;   :load-path "./lib/company-tern"
;;   :after (company tern)
;;   :config
;;   (add-to-list 'company-backends 'company-tern))

(add-to-list 'load-path "./lib/company-tern")

(require 'company-tern)
;(autoload 'tern-mode "company-tern.el" nil t)
(add-to-list 'company-backends 'company-tern)

;; (define-key tern-mode-keymap (kdb "M-.") nil)
;; (define-key tern-mode-keymap (kbd "M-,") nil)


(provide 'node99)
