
(setq project-web-root-map '(("gwclerk" . "webapp")("gwhozentool" . "WebRoot")))
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(setq org-startup-with-inline-images t)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


(setq plantuml-jar-path (expand-file-name "/usr/share/plantuml/plantuml.jar"))
(setq org-plantuml-jar-path plantuml-jar-path)

(setq lsp-log-io t)
(setq lsp-jdtls-log-devel "DEBUG")
(setq debug-on-error t)

(defun check-network-connection()
  "check if the network connection is available by trying to retrieve a webpage."
  (condition-case nil
      (let ((url "http://www.google.com"))
	(with-current-buffer (url-retrieve-synchronously url) t)
	)
    (error nil)
      )
  )

(if (null (check-network-connection))(setq package-user-dir "~/elisp_work/elisp/elpa")())


(require 'package)
(add-to-list
 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list
 'package-archives '("melpa" . "https://melpa.org/packages/")
 t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(unless (package-installed-p 'multiple-cursors)
  (package-refresh-contents)
  (package-install 'multiple-cursors))
(unless (package-installed-p 'pdf-tools)
  (package-refresh-contents)
  (package-install 'pdf-tools))
(unless (package-installed-p 'popwin)
  (package-refresh-contents)
  (package-install 'popwin))
(unless (package-installed-p 'log4e)
  (package-refresh-contents)
  (package-install 'log4e))
(unless (package-installed-p 'ag)
  (package-refresh-contents)
  (package-install 'ag))
(unless (package-installed-p 'elisp-autofmt)
  (package-refresh-contents)
  (package-install 'elisp-autofmt))

(unless (package-installed-p 'doom)
  (package-refresh-contents)
  (package-install 'doom))

(unless (package-installed-p 'ace-jump-mode)
  (package-refresh-contents)
  (package-install 'ace-jump-mode))
(unless (package-installed-p 'edbi)
  (package-refresh-contents)
  (package-install 'edbi))

(unless (package-installed-p 'company-plsense)
  (package-refresh-contents)
  (package-install 'company-plsense))

(unless (package-installed-p 'indium)
  (package-refresh-contents)
  (package-install 'indium))

(unless (package-installed-p 'smex)
  (package-refresh-contents)
  (package-install 'smex))

(unless (package-installed-p 'projectile)
  (package-refresh-contents)
  (package-install 'projectile))

(unless (package-installed-p 'flycheck)
  (package-refresh-contents)
  (package-install 'flycheck))

(unless (package-installed-p 'hydra)
  (package-refresh-contents)
  (package-install 'hydra))

(unless (package-installed-p 'which-key)
  (package-refresh-contents)
  (package-install 'which-key))

(unless (package-installed-p 'dap-mode)
  (package-refresh-contents)
  (package-install 'dap-mode))

(unless (package-installed-p 'helm-lsp)
  (package-refresh-contents)
  (package-install 'helm-lsp))

(unless (package-installed-p 'helm)
  (package-refresh-contents)
  (package-install 'helm))

(unless (package-installed-p 'lsp-treemacs)
  (package-refresh-contents)
  (package-install 'lsp-treemacs))

(unless (package-installed-p 'lsp-java)
  (package-refresh-contents)
  (package-install 'lsp-java))

(unless (package-installed-p 'magit)
 (package-refresh-contents)
 (package-install 'magit))

(unless (package-installed-p 'xclip)
 (package-refresh-contents)
 (package-install 'xclip))


(unless (package-installed-p 'expand-region)
 (package-refresh-contents)
 (package-install 'expand-region))

(unless (package-installed-p 'eshell-z)
 (package-refresh-contents)
 (package-install 'eshell-z))


(unless (package-installed-p 'desktop+)
 (package-refresh-contents)
 (package-install 'desktop+))


(unless (package-installed-p 'yaml-mode)
 (package-refresh-contents)
 (package-install 'yaml-mode))


(unless (package-installed-p 'go-mode)
 (package-refresh-contents)
 (package-install 'go-mode))


(unless (package-installed-p 'gradle-mode)
 (package-refresh-contents)
 (package-install 'gradle-mode))


(unless (package-installed-p 'groovy-mode)
 (package-refresh-contents)
 (package-install 'groovy-mode))


(unless (package-installed-p 'vue-mode)
  (package-refresh-contents)
  (package-install 'vue-mode))


(require 'desktop+)
;(desktop+)
(desktop-save-mode 1)
(setq desktop-auto-save-timeout 10)


(require 'log4e)
(log4e:deflogger
 "klog" "%t [%l] %m" "%H:%M:%S"
 '((fatal . "fatal")
   (error . "error")
   (warn . "warn")
   (info . "info")
   (debug . "debug")
   (trace . "trace")))
(klog--log-set-level 'trace)
(klog--log-enable-logging)

(use-package popwin)
(popwin-mode 1)


(custom-set-variables '(package-selected-packages nil))
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
 '(rainbow-blocks-unmatched-face
   ((t (:foreground "#FF5555" :background "#FFFFFF")))))
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(add-to-list
 'mode-line-format '(:eval (format " %s" buffer-file-coding-system)))
(setq make-backup-files nil)
(set-face-attribute 'default nil :family "Noto Sans" :height 140)
(setq treemacs-show-hidden-files t)
(set-language-environment "Japanese")
(global-display-line-numbers-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;(setq default-input-method "ibus")
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)
(setq backup-directory-alist '(("." . "/home/huanghao/backups")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(add-hook 'after-init-hook 'global-company-mode)
(column-number-mode 1)
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(setq
 company-dabbrev-ignore-case nil
 company-dabbrev-downcase nil)


(require 'multiple-cursors)
(global-set-key (kbd "C-c m") 'mc/mark-all-like-this)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-engine 'xetex)
(eval-after-load "tex"
  '(add-to-list
    'TeX-command-list
    '("XeLaTeX"
      "xelatex -interaction=nonstopmode %s"
      TeX-run-command
      t
      t
      :help "Run XeLaTeX")))
(setq TeX-command-default "XeLaTeX")
;; (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
;; (setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
;; (pdf-tools-install)
;; (setq org-latex-pdf-process
;;       '("xelatex -interaction nonstopmode %f"
;;         "xelatex -interaction nonstopmode %f"))
(setq org-html-inline-images t)
(use-package
 highlight-symbol
 :ensure t
 :config
 (add-hook 'prog-mode-hook 'highlight-symbol-mode)
 (global-set-key (kbd "M-n") 'highlight-symbol-next)
 (global-set-key (kbd "M-p") 'highlight-symbol-prev)
 (global-set-key (kbd "M-<f3>") 'highlight-symbol-query-replace))
(use-package
 rainbow-blocks
 :ensure t
 :hook (prog-mode . rainbow-blocks-mode)
 :config
 (custom-set-faces
  '(rainbow-blocks-depth-1-face ((t (:foreground "#FF5555")))) ;; Red
  '(rainbow-blocks-depth-2-face ((t (:foreground "#FFAA00")))) ;; Orange
  '(rainbow-blocks-depth-3-face ((t (:foreground "#FFFF55")))) ;; Yellow
  '(rainbow-blocks-depth-4-face ((t (:foreground "#55FF55")))) ;; Green
  '(rainbow-blocks-depth-5-face ((t (:foreground "#55FFFF")))) ;; Cyan
  '(rainbow-blocks-depth-6-face ((t (:foreground "#5555FF")))) ;; Blue
  '(rainbow-blocks-depth-7-face ((t (:foreground "#AA55FF")))) ;; Purple
  '(rainbow-blocks-unmatched-face
    ((t
      (:foreground
       "#FF5555"
       :background "#FFFFFF")))))) ;; Red with white background for unmatched
(put 'erase-buffer 'disabled nil)
(setq warning-minimum-level :error)
(require 'edebug)

(use-package
 google-translate
 :ensure t
 :custom (google-translate-backend-method 'curl)
 :config
 (setq google-translate-default-source-language "ja")
 (setq google-translate-default-target-language "zh-CN"))
(global-set-key (kbd "C-c t") 'google-translate-at-point)
(global-set-key (kbd "C-c T") 'google-translate-query-translate)


(use-package
  rime
  :ensure t
  :config
  (setq rime-user-data-dir "~/.config/fcitx/rime")
  (setq rime-share-data-dir "/usr/share/rime-data")
  (setq default-input-method "rime")
  (setq rime-show-candidate 'posframe)
  )


(use-package
  pyim
  :ensure t
  :config
  (setq default-input-method "pyim")
  )


(defun execute-buffer ()
  "現在のバッファ内の全てのコードを実行します。"
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (eval-region (point-min) (point-max)))
  (deactivate-mark))


;(setq popwin:popup-window-position 'right)
(setq popwin:popup-window-dedicated-p t)
(setq popwin:popup-window-stuck-p t)
(defun test22 (&rest args)
  (popwin:messages))


(ido-mode t)
(setq ido-enable-flex-matching t)


(eval-after-load 'eshell
  '(require 'eshell-z nil t))

(setq use-package-always-ensure t)

(windmove-default-keybindings)

(klog--debug "common load done")

(defun generate-uuid ()
  ""
  (string-trim (shell-command-to-string "uuidgen")))

(defun yas-unique-serialversionuid ()
  ""
  (let ((uuid
         (string-to-number (substring (replace-regexp-in-string
                                       "-" "" (generate-uuid))
                                      0 15)
                           16)))
    (format "%dL" uuid)))


(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode))

(require 'jump-xml)
(advice-add 'xref-find-definitions :around #'my-around-advice)
(advice-add 'kill-ring-save :after #'copy-to-windows-cliboard)
(advice-add 'kill-region :after #'copy-to-windows-cliboard)
(advice-add 'yank :around #'paste-from-windows-cliboard)
(advice-add 'save-buffer :after #'copy-jsp-to-tomcat-webapps)


(org-babel-do-load-languages 'org-babel-load-languages '((dot . t)(plantuml . t)))

(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
(org-toggle-inline-images)


;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)
;(setq ibus-agent-file-name "/usr/bin/ibus-daemon")  ;; 检查 IBus 的路径是否正确

(provide 'common)
