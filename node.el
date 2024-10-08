
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-initialize 'use-package))

;; (use-package
;;  company
;;  :ensure t
;;  :config (add-hook 'after-init-hook 'global-company-mode))

;; (use-package
;;  tern
;;  :ensure t
;;  :hook (js-mode . tern-mode)
;;  :config
;;  (add-hook 'js2-mode-hook (lambda () (tern-mode t)(auto-complete-mode)))
;;  (add-hook 'web-mode-hook (lambda () (tern-mode t)(auto-complete-mode)))
;;  )



;(add-to-list 'load-path "./lib/company-tern")

;; (require 'company-tern
;;          :after (company tern)
;;          :config (add-to-list 'company-backends 'company-tern))




;(tern-ac-setup)






;; 确保安装了 lsp-mode
;; (use-package lsp-mode
;;   :ensure t
;;   :hook (typescript-mode . lsp)        ; 对于 TypeScript 文件
;;   (js-mode . lsp)                      ; 对于 JavaScript 文件
;;   :commands lsp)

;; ;; 确保安装了 company-mode
;; (use-package company
;;   :ensure t
;;   :config
;;   (add-hook 'after-init-hook 'global-company-mode)) ; 全局启用 company-mode

;; ;; 配置 company-capf
;; (add-hook 'lsp-mode-hook 'company-mode) ; 在 lsp-mode 中启用 company-mode



;; (add-to-list 'company-backends 'company-dabbrev)
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-hook 'js-mode-hook #'lsp)
;; (add-hook 'typescript-mode-hook #'lsp)

;; (setq lsp-enable-completion nil)
;; (add-hook 'lsp-mode-hook 'company-mode)



(message "111111111111111")
;; (add-hook 'vue-mode-hook #'lsp)
;; (setq lsp-vue-server-command '("typescript-language-server" "--stdio"))
(message "2222222222222")


(provide 'node)
