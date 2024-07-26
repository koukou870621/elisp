
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-initialize 'use-package))

(use-package
 company
 :ensure t
 :config (add-hook 'after-init-hook 'global-company-mode))

(use-package
 tern
 :ensure t
 :hook (js-mode . tern-mode)
 :config
 (add-hook 'js2-mode-hook (lambda () (tern-mode t)(auto-complete-mode)))
 (add-hook 'web-mode-hook (lambda () (tern-mode t)(auto-complete-mode)))
 )



(add-to-list 'load-path "./lib/company-tern")

;; (require 'company-tern
;;          :after (company tern)
;;          :config (add-to-list 'company-backends 'company-tern))




(tern-ac-setup)






(provide 'node)
