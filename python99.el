(message "============load python99 start==============")

;(add-hook 'python-mode-hook #'lsp)
 (defun my/python-mode-hook ()
   (add-to-list 'company-backends 'company-jedi))
 (add-hook 'python-mode-hook 'my/python-mode-hook)

					;(add-hook 'python-mode-hook 'jedi:setup)




(elpy-enable)




(message "=====================load python99 end ========================")
