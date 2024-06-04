(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)


(use-package projectile)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(setq lsp-enable-completion t)
(setq lsp-completion-provider :capf)

(use-package hydra)
(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0)
  (global-company-mode 1)
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(use-package which-key :config (which-key-mode))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode)) 

(use-package helm-lsp)
(use-package helm
	     :config (helm-mode))
(use-package lsp-treemacs)
(custom-set-variables
 '(package-selected-packages nil))

(custom-set-faces
 '(default ((t (:background "black" :foreground "white"))))
 '(font-lock-comment-face ((t (:weight bold))))
 '(rainbow-blocks-depth-1-face ((t (:foreground "#FF5555"))))
 '(rainbow-blocks-depth-2-face ((t (:foreground "#FFAA00"))))
 '(rainbow-blocks-depth-3-face ((t (:foreground "#FFFF55"))))
 '(rainbow-blocks-depth-4-face ((t (:foreground "#55FF55"))))
 '(rainbow-blocks-depth-5-face ((t (:foreground "#55FFFF"))))
 '(rainbow-blocks-depth-6-face ((t (:foreground "#5555FF"))))
 '(rainbow-blocks-depth-7-face ((t (:foreground "#AA55FF"))))
 '(rainbow-blocks-unmatched-face ((t (:foreground "#FF5555" :background "#FFFFFF")))))
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(add-to-list 'mode-line-format '(:eval (format " %s" buffer-file-coding-system)))
(setq make-backup-files nil)
(set-face-attribute 'default nil :family  "Noto Sans" :height 120)
(setq treemacs-show-hidden-files t)
(set-language-environment "Japanese")
(global-display-line-numbers-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq default-input-method "ibus")
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)
(setq backup-directory-alist '(("." . "/home/huanghao/backups")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(add-hook 'after-init-hook 'global-company-mode)
(column-number-mode 1)
(setq company-minimum-prefix-length 1)
(require 'smex)
(smex-initialize)
(global-set-key(kbd "M-x") 'smex)
(global-set-key(kbd "M-X") 'smex-major-mode-commands)
(global-set-key(kbd "C-c C-c M-x") 'execute-extended-command)
(setq company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil)
(require 'multiple-cursors)
(global-set-key (kbd "C-c m") 'mc/mark-all-like-this)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-engine 'xetex)
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("XeLaTeX" "xelatex -interaction=nonstopmode %s" TeX-run-command t t :help "Run XeLaTeX")))
(setq TeX-command-default "XeLaTeX")
(setq TeX-view-program-selection '((output-pdf "PDF Tools")))
(setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
(pdf-tools-install)
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
			      "xelatex -interaction nonstopmode %f"))
(setq org-html-inline-images t)
(use-package highlight-symbol
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  (global-set-key (kbd "M-n") 'highlight-symbol-next)
  (global-set-key (kbd "M-p") 'highlight-symbol-prev)
  (global-set-key (kbd "M-<f3>") 'highlight-symbol-query-replace))
(use-package rainbow-blocks
  :ensure t
  :hook (prog-mode . rainbow-blocks-mode)
  :config
  (custom-set-faces
   '(rainbow-blocks-depth-1-face ((t (:foreground "#FF5555"))))  ;; Red
   '(rainbow-blocks-depth-2-face ((t (:foreground "#FFAA00"))))  ;; Orange
   '(rainbow-blocks-depth-3-face ((t (:foreground "#FFFF55"))))  ;; Yellow
   '(rainbow-blocks-depth-4-face ((t (:foreground "#55FF55"))))  ;; Green
   '(rainbow-blocks-depth-5-face ((t (:foreground "#55FFFF"))))  ;; Cyan
   '(rainbow-blocks-depth-6-face ((t (:foreground "#5555FF"))))  ;; Blue
   '(rainbow-blocks-depth-7-face ((t (:foreground "#AA55FF"))))  ;; Purple
   '(rainbow-blocks-unmatched-face ((t (:foreground "#FF5555" :background "#FFFFFF"))))))  ;; Red with white background for unmatched
(put 'erase-buffer 'disabled nil)
(setq warning-minimum-level :error)

(require 'edebug)
(edebug-defun)
