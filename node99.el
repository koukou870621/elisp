
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (package-initialize)
;; (unless package-archive-contents (package-refresh-contents))

;; (setq package-list '(dap-mode typescript-mode tree-sitter tree-sitter-langs lsp-mode lsp-ui))
;; (dolist (package package-list)
;;   (unless (package-installed-p package) (package-install package)))


;; (require 'tree-sitter-langs)
;; (require 'tree-sitter)
;; (global-tree-sitter-mode)
;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; (require 'lsp-mode)
;; (add-hook 'typescript-mode-hook 'lsp-deferred)
;; (add-hook 'javascript-mode-hook 'lsp-deferred)

;; (defun my-setup-dap-node ()
;;   (require 'dap-node)
;;   (unless (file-exists-p dap-node-debug-path)(dap-node-setup)))
;; (add-hook 'typescript-mode-hook 'my-setup-dap-node)
;; (add-hook 'javascript-mode-hook 'my-setup-dap-node)

;; (require 'dap-node)
;; (if (file-exists-p (nth 1 dap-node-debug-program))
;;     (message "NodeJs debugger successfully installed")
;;   (message "NodeJs debugger install failed. Please download it manually"))

;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; (add-to-list 'company-backends 'ac-js2-company)

;; (setq ac-js2-evaluate-calls t)
;; (setq ac-js2-external-libraries '("full/path/to/a-library.js"))


(add-to-list 'load-path "~/.emacs.d/company-tern")
(require 'company-tern)


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))



(provide 'node99)
