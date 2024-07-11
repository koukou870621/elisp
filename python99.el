;(klog--debug "==python99==")
(unless (package-installed-p 'elpy)
  (package-install 'elpy))
(elpy-enable)

(provide 'python99)


(klog--debug "python99 load done")
