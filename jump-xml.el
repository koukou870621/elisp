
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
  (setq tail-str (substring file-name (- (length file-name) 6)))

  (message "tail-str:%s" tail-str)
  (if (string-equal tail-str "Mapper")
      (progn
        (xref-push-marker-stack)
        (setq file-name (concat file-name ".xml"))
        (message "file-name:%s" file-name)
        (setq file-full-path
              (find-file-recursively
               (projectile-project-root) file-name))
        (setq word (thing-at-point 'word))
        (message "word:%s" word)
        (setq word (concat "id=\"" word "\""))
        (find-file file-full-path)
        (message "%s" (buffer-name))
        (search-forward word nil t))
    (apply orig-fun args)))

(defun copy-to-windows-cliboard (orig-fun &rest args)
  "copy the current kill ring content to the windows cliboard."
  (let ((process-connection-type nil))
    (let ((proc (start-process "clip" "*Messages*" "wl-copy")))
      (process-send-string
       proc (encode-coding-string (current-kill 0) 'utf-8))
      (process-send-eof proc))))


;================
(defun paste-from-windows-cliboard (orig-fun &rest args)
  "paste from windows clipboard using clip.exe and convert to utf-8."
  (message "=== paste-from-windows-cliboard ====")
  (let ((clipboard-content
         (string-trim (shell-command-to-string "wl-paste"))))
    (message "clipboard-content:%s" clipboard-content)
    (if (string-empty-p clipboard-content)
        (setq clipboard-content (car kill-ring))
      (message "clipboard-content:%s" clipboard-content))
    (message "clipboard-content:%s" clipboard-content)
    (insert (decode-coding-string clipboard-content 'utf-8))))


(defun copy-jsp-to-tomcat-webapps (&rest args)
  "copy jsp to tomcat webapps"
  (message "--copy-jsp-to-tomcat-webapps --")
  (setq suffix (get-current-file-extension))
  (if (string-equal suffix "jsp")
      (progn
        (setq current-project-name (get-current-project-name))
        (setq tomcat-home "/home/huanghao/soft/apache-tomcat-7.0.79")
        (setq webapps (concat tomcat-home "/webapps"))
        (setq current-file-path (buffer-file-name))
        (setq tomcat-project-path
              (concat webapps "/" current-project-name))
        (message tomcat-project-path)
        (setq dist-path
              (concat
               tomcat-project-path "/"
               (get-absolute-path-file-under-tomcat
                current-project-name tomcat-home current-file-path)))
        (message (concat "current-file-path:" current-file-path))
        (message (concat "dist-path:" dist-path))
        (copy-file current-file-path dist-path t))))


(defun get-absolute-path-file-under-tomcat
    (current-project tomcat-home current-file-path)
  ""
  (message (concat "current-project:" current-project))
  (message (concat "tomcat-home:" tomcat-home))
  (message (concat "current-file-path:" current-file-path))
  (message
   (concat
    "project-web-root-map:" (prin1-to-string project-web-root-map)))
  (message "type of current-project: %s" (type-of current-project))
  (setq web-root-map (assoc current-project project-web-root-map))
  (message (concat "web-root:" (prin1-to-string web-root-map)))
  (setq web-root (cdr web-root-map))
  (setq start (string-match web-root current-file-path))
  (if start
      (substring current-file-path start)
    (concat web-root "not found in the path.")))


(defun get-current-filename ()
  "Return the name of the current buffer's file."
  (if buffer-file-name
      (file-name-nondirectory buffer-file-name)
    "Buffer is not visiting a file."))


(defun get-current-project-name ()
  "Get the name of the current project."
  (let ((project (project-current)))
    (if project
        (file-name-nondirectory
         (directory-file-name (project-root project)))
      (message "Not in a project"))))


(defun get-current-file-extension ()
  "Return the extension of the current buffer's file."
  (if buffer-file-name
      (file-name-extension buffer-file-name)
    "Buffer is not visiting a file."))


(defun get-path-after-web-inf (path)
  "Return the substring of PATH starting from 'WEB-INF'."
  (let ((start (string-match "WEB-INF" path)))
    (if start
        (substring path start)
      "WEB-INF not found in the path.")))


(defun get-path-after-web-root (path)
  "Return the substring of PATH starting from 'WebRoot'."
  (let ((start (string-match "jsp" path)))
    (if start
        (substring path start)
      "WEB-INF not found in the path.")))


(provide 'jump-xml)
