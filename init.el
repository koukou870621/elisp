(add-to-list 'load-path "~/elisp_work/elisp")

(require 'common)
(require 'java)
(require 'koukou_python)
(require 'node)
(require 'typescript)
;(require 'go)

;(require 'init_javascript)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ac-js2 ace-jump-mode ag anki-mode auctex blacken buttercup
	    company-box company-jedi company-plsense company-ycm
	    counsel-etags desktop+ doom doom-themes edbi edebug-x
	    elisp-autofmt elisp-format elpy eshell-toggle eshell-z
	    evil expand-region firefox-javascript-repl flycheck fzf
	    google-translate goto-last-point graphviz-dot-mode
	    helm-gtags helm-lsp highlight-blocks highlight-parentheses
	    highlight-symbol indium jedi ligature lispy log4e lsp-java
	    lsp-jedi lsp-python-ms lsp-ui magit modus-themes mozc
	    nodejs-repl ox-pandoc pdf-tools point-stack popwin py-yapf
	    quelpa rainbow-blocks reformatter smex tern-auto-complete
	    tmux-mode tree-sitter-langs treemacs-projectile
	    typescript-mode undo-tree web-mode which-key xclip
	    yaml-mode yapfify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
