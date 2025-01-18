
;(add-hook 'vue-mode-hook #'lsp)

(use-package
  lsp-mode
  :ensure t
  :commands lsp
  :hook
  (
   (js-ts-mode . lsp)
   (typescript-ts-mode . lsp)
   (web-mode . lsp)
   (java-ts-mode . lsp)
   )
  :config
  (setq lsp-enable-file-watchers nil
	lsp-prefer-capf t)
  )


(provide 'vue)
