



;; (use-package lsp-ui
;;   :commands lsp-ui-mode
;;   :config
;;   (setq lsp-ui-sideline-enable nil
;; 	lsp-ui-doc-enable nil))

;; (use-package company
;;   :after lsp-mode
;;   :hook (lsp-mode . company-mode)
;;   :config
;;   (setq company-minimum-prefix-length 1
;; 	company-idle-delay 0.0))



;; (use-package typescript-mode
;;   :after lsp-mode
;;   :mode "\\.ts\\'"
;;   :hook (typescript-mode . lsp-deferred)
;;   :config
;;   (setq typescript-indent-level 2))
  



;; (require 'lsp-mode)

;; ;; 确保使用 TypeScript Language Server
;; (defun my/typescript-mode-hook ()
;;   (lsp))

;; (add-hook 'typescript-mode-hook 'my/typescript-mode-hook)

;; ;; 设置自动模式关联
;; (add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))

;; ;; 注册 TypeScript 语言服务器
;; (lsp-register-server
;;  'ts-ls
;;  `("typescript-language-server" "--stdio" "--tsserver-path" ,(executable-find "typescript-language-server"))
;;  "TypeScript Language Server")


(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js2-mode))
(add-hook 'js-mode-hook #'lsp)
(add-hook 'typescript-mode-hook #'lsp)
(message "===== mjs====")


(provide 'typescript)
