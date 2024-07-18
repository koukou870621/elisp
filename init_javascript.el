
(add-to-list 'load-path "~/soft/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))


(provide 'init_javascript)
