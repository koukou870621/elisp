(add-to-list 'load-path "~/soft/node-ac")
(require 'node-ac-mode)

(setq node-ac-node-modules-path "/home/huanghao/.nvm/versions/node/v22.2.0/lib/node_modules")

(add-hook 'js2-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-.") 'node-ac-auto-complete)
	    (local-set-key (kbd "C-c C-d") 'node-ac-show-document)
	    (local-set-key (kbd "C-c C-j") 'node-ac-jump-to-definition)))

(ac-config-default)
