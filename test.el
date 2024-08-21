
(defun find-file-recursively (dir filename)
  "再帰的にファイルを検索し、ファイルへのパスを返します。"
  (let ((full-path (expand-file-name filename dir)))
    (if (file-exists-p full-path)
        full-path
      (let ((subdirs
             (directory-files dir
                              t directory-files-no-dot-files-regexp)))
        (catch 'found
          (dolist (subdir subdirs)
            (when (and (file-directory-p subdir)
                       (not
                        (member
                         (file-name-nondirectory subdir)
                         '("." ".."))))
              (let ((result (find-file-recursively subdir filename)))
                (when result
                  (throw 'found result))))))))))



(defun my-around-advice (orig-fun &rest args)
  "mapper.javaの場合はxmlの該当箇所へジャンプします。"
  (message "this is the new function")
  (setq original-file-name (buffer-name))
  (message "%s" original-file-name)
  (setq file-name (car (split-string original-file-name "\\.")))
  (message "file-name:%s" file-name)
  (setq file-name (concat file-name ".xml"))
  (message "file-name:%s" file-name)
  (setq file-full-path
        (find-file-recursively (projectile-project-root) file-name))
  (setq word (thing-at-point 'word))
  (message "word:%s" word)
  (setq word (concat "id=\"" word "\""))
  (find-file file-full-path)
  (message "%s" (buffer-name))
  (search-forward word nil t))




(advice-add 'xref-find-definitions :around #'my-around-advice)


(xref-find-definitions)
