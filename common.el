(setq minor-mode-alist
      (assq-delete-all 'auto-revert-mode minor-mode-alist))
(setq minor-mode-alist
      (assq-delete-all 'smerge-mode minor-mode-alist))
(setq minor-mode-alist
      (assq-delete-all 'rainbow-blocks-mode minor-mode-alist))
;(setq minor-mode-alist (assq-delete-all 'helm-mode minor-mode-alist))
(setq minor-mode-alist
      (assq-delete-all 'which-key-mode minor-mode-alist))
(setq minor-mode-alist
      (assq-delete-all 'highlight-symbol-mode minor-mode-alist))

(setq org-startup-with-inline-images t)
(setq project-web-root-map
      '(("gwclerk" . "webapp") ("gwhozentool" . "WebRoot")))
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(setq org-startup-with-inline-images t)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(setq default-input-method "japanese")
(setq plantuml-jar-path
      (expand-file-name "/usr/share/plantuml/plantuml.jar"))
(setq org-plantuml-jar-path plantuml-jar-path)

(setq lsp-log-io t)
(setq lsp-jdtls-log-devel "DEBUG")
(setq debug-on-error t)

(global-unset-key (kbd "C-z"))


(defun check-network-connection ()
  "check if the network connection is available by trying to retrieve a webpage."
  (condition-case nil
      (let ((url "http://www.google.com"))
        (with-current-buffer (url-retrieve-synchronously url)
          t))
    (error nil)))

(if (null (check-network-connection))
    (setq package-user-dir "~/elisp_work/elisp/elpa")

  ())




(progn
    (add-to-list
     'load-path "/home/huanghao/elisp_work/elisp/elpa/aweshell")
    (require 'aweshell))



(require 'package)
(add-to-list
 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list
 'package-archives '("melpa" . "https://melpa.org/packages/")
 t)

(package-initialize)
(message "----22-----")
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package multiple-cursors :ensure t :config)
(use-package pdf-tools :ensure t :config)
(use-package popwin :ensure t :config)
(use-package log4e :ensure t :config)
(use-package ag :ensure t :config)
(use-package elisp-autofmt :ensure t :config)
(use-package doom :ensure t :config)
(use-package ace-jump-mode :ensure t :config)
(use-package edbi :ensure t :config)
(use-package company-plsense :ensure t :config)
(use-package indium :ensure t :config)
(use-package smex :ensure t :config)
(use-package projectile :ensure t :config)
(use-package flycheck :ensure t :config)
(use-package hydra :ensure t :config)
(use-package which-key :ensure t :config)
(use-package dap-mode :ensure t :config)
(use-package helm-lsp :ensure t :config)
;(use-package helm :ensure t :config)
(use-package lsp-treemacs :ensure t :config)
(use-package magit :ensure t :config)
(use-package xclip :ensure t :config)
(use-package expand-region :ensure t :config)
(use-package eshell-z :ensure t :config)
(use-package desktop+ :ensure t :config)
(use-package yaml-mode :ensure t :config)
(use-package go-mode :ensure t :config)
(use-package gradle-mode :ensure t :config)
(use-package groovy-mode :ensure t :config)
(use-package vue-mode :ensure t :config)

(use-package treesit-auto :config (global-treesit-auto-mode))


(use-package origami :ensure t :hook (vue-html-mode . origami-mode))

(use-package ivy :ensure t :config (ivy-mode 1))

(use-package counsel :ensure t)

(use-package swiper :ensure t :bind ("C-s" . swiper))

(message "----33-----")
(require 'desktop+)
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

(setq org-html-inline-images t)
(use-package
 highlight-symbol
 :ensure t
 :config
 (add-hook 'prog-mode-hook 'highlight-symbol-mode)
 (global-set-key (kbd "M-n") 'highlight-symbol-next)
 (global-set-key (kbd "M-p") 'highlight-symbol-prev)
 (global-set-key (kbd "M-<f3>") 'highlight-symbol-query-replace))
;; (use-package
;;  rainbow-blocks
;;  :ensure t
;;  :hook (prog-mode . rainbow-blocks-mode)
;;  :config
;;  (custom-set-faces
;;   '(rainbow-blocks-depth-1-face ((t (:foreground "#FF5555")))) ;; Red
;;   '(rainbow-blocks-depth-2-face ((t (:foreground "#FFAA00")))) ;; Orange
;;   '(rainbow-blocks-depth-3-face ((t (:foreground "#FFFF55")))) ;; Yellow
;;   '(rainbow-blocks-depth-4-face ((t (:foreground "#55FF55")))) ;; Green
;;   '(rainbow-blocks-depth-5-face ((t (:foreground "#55FFFF")))) ;; Cyan
;;   '(rainbow-blocks-depth-6-face ((t (:foreground "#5555FF")))) ;; Blue
;;   '(rainbow-blocks-depth-7-face ((t (:foreground "#AA55FF")))) ;; Purple
;;   '(rainbow-blocks-unmatched-face
;;     ((t
;;       (:foreground
;;        "#FF5555"
;;        :background "#FFFFFF")))))) ;; Red with white background for unmatched
(put 'erase-buffer 'disabled nil)
(setq warning-minimum-level :error)
(require 'edebug)
(message "-----44----")
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
 (setq default-input-method "japanese")
 (setq rime-show-candidate 'posframe))

;=========================================================
(use-package
 pyim
 :ensure t
 :config (setq default-input-method "japanese"))


(use-package
 sqlformat
 :ensure t
 :config
 (setq sqlformat-command 'pgformatter) ;; 使用 pgformatter 作为格式化工具
 (setq sqlformat-args '("-s2" "-g")) ;; 设置 pgformatter 的格式化参数
 (add-hook 'sql-mode-hook 'sqlformat-on-save-mode)) ;; 保存时自动格式化


(use-package elpy :ensure t :init (elpy-enable) :config)
(add-to-list 'major-mode-remap-alist '(java-mode . java-ts-mode))

(message "-----4411----")


(use-package
 exec-path-from-shell
 :ensure t
 :config (exec-path-from-shell-initialize))


;; (advice-add
;;  'lsp
;;  :before
;;  (lambda (&rest _args)
;;    (eval
;;     '(setf (lsp-session-server-id->folders (lsp-session)) (ht)))))


(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 100000000)

(use-package
 lsp-mode
 :hook
 ((java-ts-mode . lsp) (typescript-ts-mode . lsp) (js-ts-mode . lsp))
 :commands lsp
 :config
 (setq lsp-idle-delay 0.3)
 ;(setq lsp-log-io nil)
 ;(setq lsp-intelephense-completion-max-items 100)
 ;(setq lsp-completion-enable-additional-text-edit nil)
;;  (setq lsp-completion-provider :none)
;;  (setq company-backends '(company-capf))
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-enable-file-watchers nil)
  ;; (setq lsp-enable-text-document-color nil)
  ;; (setq lsp-ui-doc-enable nil)
  ;; (setq lsp-file-watch-threshold 2000)
  ;; (setq lsp-response-timeout 5)
  ;; (setq lsp-auto-guess-root nil)
  ;; (setq lsp-use-plists t) 
 )



(defun my-enable-lsp ()
  (interactive)
  (when (derived-mode-p 'js-mode 'vue-mode 'java-mode)
    (lsp)))

(add-hook 'js-mode-hook #'my-enable-lsp)
(add-hook 'vue-mode-hook #'my-enable-lsp)



;; (use-package
;;   lsp-mode
;;   :ensure t
;;   :commands lsp
;;   :hook
;;   (
;;    (js-ts-mode . lsp)
;;    (typescript-ts-mode . lsp)
;;    (web-mode . lsp)
;;    (java-ts-mode . lsp)
;;    )
;;   :config
;;   (setq lsp-enable-file-watchers nil
;; 	lsp-prefer-capf t)
;;   )




(message "-----4422----")


(defun execute-buffer ()
  "現在のバッファ内の全てのコードを実行します。"
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (eval-region (point-min) (point-max)))
  (deactivate-mark))


(setq popwin:popup-window-dedicated-p t)
(setq popwin:popup-window-stuck-p t)
(defun test22 (&rest args)
  (popwin:messages))


;(ido-mode t)
(setq ido-enable-flex-matching t)


(eval-after-load 'eshell '(require 'eshell-z nil t))

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

(org-babel-do-load-languages
 'org-babel-load-languages '((dot . t) (plantuml . t)))

(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
(org-toggle-inline-images)


(defun close-all-buffers ()
  "Close all buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))


(yas-global-mode 1)
(message "----55-----")


(use-package move-text :ensure t :config (move-text-default-bindings))

(use-package helm-themes :ensure t)

(use-package
 prettier-js
 :ensure t
 
 )




(use-package
 emmet-mode
 :ensure t
 :hook
 ((web-mode . emmet-mode)
  (vue-mode . emmet-mode)
  (js2-mode . emmet-mode)
  (js-mode . emmet-mode)))

(use-package vterm :ensure t)


(provide 'common)
