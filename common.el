
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
(setq default-input-method "ibus")
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
(setq TeX-view-program-selection '((output-pdf "PDF Tools")))
(setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
(pdf-tools-install)
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode %f"
        "xelatex -interaction nonstopmode %f"))
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

(defun execute-buffer ()
  "現在のバッファ内の全てのコードを実行します。"
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (eval-region (point-min) (point-max)))
  (deactivate-mark))


(setq popwin:popup-window-position 'right)
(setq popwin:popup-window-dedicated-p t)
(setq popwin:popup-window-stuck-p t)
;(popwin:messages)


;(push '("*Messages*" :width 0.3 :position right :stick t :tail t ) popwin:special-display-config)

(defun test22 (&rest args)
  (popwin:messages))

; (advice-add 'message :after 'test22)

;; (popwin:display-buffer (get-buffer "*Messages*"))
;; (get-buffer "*Messages*")
;; (popwin:messages)
;(popwin:messages)

;; (defun my-popwin-display-message-buffer (&rest args)
;;   ""
;;   (let ((messages-buffer (get-buffer "*Messages*")))
;;     (when messages-buffer (progn   (popwin:display-buffer messages-buffer  ))  )
;;     )
;;   )

;; (advice-add 'message :after 'my-popwin-display-message-buffer)


;; (defun my-auto-scroll-messages-buffer (&rest args)
;;   "Scroll *Messages* buffer to the bottom after a message is logged."
;;   (let ((messages-buffer (get-buffer "*Messages*")))
;;     (when messages-buffer
;;       (with-current-buffer messages-buffer
;;         (goto-char (point-max))
;;         (unless (pos-visible-in-window-p (point-max))
;;           (set-window-point (get-buffer-window messages-buffer) (point-max)))))))

;; (advice-add 'message :after 'my-auto-scroll-messages-buffer)


;; (defun popwin-display-messages-buffer-right()
;;   (interactive) (popwin:display-buffer-1 (get-buffer "*Messages*")  :default-config-keywords '(:position right :width 0.3) ))
;; (add-hook 'emacs-startup-hook 'popwin-display-messages-buffer-right)

(klog--debug "common load done")
(provide 'common)
