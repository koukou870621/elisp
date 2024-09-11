
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



(defun my-iconv-convert (input-str from-encoding to-encoding)
""
  (let ((output-buffer (generate-new-buffer "*iconv-output*")))
  
    (call-process-region
     input-str nil "iconv" nil output-buffer nil
     "-f" from-encoding "-t" to-encoding)
  
    (with-current-buffer output-buffer
      (buffer-string))))

;òö?òé?
(defun copy-to-windows-cliboard (orig-fun &rest args)
  "copy the current kill ring content to the windows cliboard."
  ;(interactive)
  (let ((process-connection-type nil))
    (let ((proc (start-process "clip" "*Messages*" "wl-copy")))
     ; (setq bb )
      (process-send-string proc (encode-coding-string (current-kill 0) 'utf-8)  )
      ;(message "tt:%sb" (encode-coding-string (current-kill 0) 'utf-8))
;      (process-send-string proc  (current-kill 0)   )
      (process-send-eof proc)
      )
    )
  (message "xxxxx")
  )


(defun paste-from-windows-cliboard (orig-fun &rest args)
  "paste from windows clipboard using clip.exe and convert to utf-8."
  (let ((clipboard-content (string-trim (shell-command-to-string "wl-paste"))  ))
    
    (message "clipboard-content:%svvv" clipboard-content)
    (insert (decode-coding-string clipboard-content 'utf-8) )
    
    )
  
  )



;(message (encode-coding-string (current-kill 0) 'iso-charset) )
(provide 'jump-xml)
