(use-package lsp-java
:hook ((java-mode) . (lambda() (require 'lsp-java) (lsp)))
:config (setq lsp-java-server-install-dir "/home/huanghao/soft/jdtls"
            lsp-file-watch-ignored-directories '(".idea" "node_modules" ".git" ".svn" "build" "temlate" "resurces")
            lsp-java-autobuild-enabled t
            lsp-java-import-gradle-enabled t
            lsp-java-import-maven-enabled t
            lsp-java-completion-enabled t
       )
)
(use-package dap-java :ensure nil)
(setq lsp-java-vmargs
      `("-Xmx4G"
        "-XX:+UseG1GC"
        ,(concat "-javaagent:" (expand-file-name "~/lombok-1.18.30.jar"))
        "-Xbootclasspath/a:"))


(add-hook 'java-mode-hook #'hs-minor-mode)
