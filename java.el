
(use-package projectile)
(projectile-mode +1)
(setq projectile-enable-caching t)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(setq lsp-enable-completion t)
(setq lsp-completion-provider :capf)
(setq lsp-disabled-clients '(semgrep-ls))
(use-package hydra)
(use-package
 company
 :ensure t
 :config
 (setq
  company-minimum-prefix-length 1
  company-idle-delay 0.3)
 (global-company-mode 1))
(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package which-key :config (which-key-mode))
(use-package
 dap-mode
 :after lsp-mode
 :config (dap-auto-configure-mode))
(use-package helm-lsp)
(use-package helm :config (helm-mode))
(use-package lsp-treemacs)


(use-package
 lsp-java
 :hook
 ((java-mode)
  .
  (lambda ()
    (require 'lsp-java)
    (lsp)))
 :config
 (setq
  lsp-java-server-install-dir "~/elisp_work/elisp/java/jdtls-1.40.0"
  lsp-file-watch-ignored-directories '(".idea" "node_modules" ".git" ".svn" "build" "temlate" "resurces")
  lsp-java-autobuild-enabled t
  lsp-java-import-gradle-enabled t
  lsp-java-import-maven-enabled t
  lsp-java-import-gradle-wrapper-enabled t
  ;  lsp-java-import-gradle-home (getenv "GRADLE_HOME")

  lsp-java-completion-enabled t)
 (setq lsp-enable-file-watchers nil)
 (setq lsp-enable-symbol-highlighting nil)
 (setq lsp-idle-delay 0.5)
 (setq lsp-log-io t)
 )
(use-package
 dap-java
 :ensure nil
 )
(setq lsp-java-vmargs
      `("-Xmx4G" "-XX:+UseG1GC"
        ,(concat
          "-javaagent:"
          (expand-file-name
           "~/elisp_work/elisp/java/lombok-1.18.30.jar"))
        "-Xbootclasspath/a:"))
(add-hook 'java-mode-hook #'hs-minor-mode)


(klog--debug "java load done")
(provide 'java)
