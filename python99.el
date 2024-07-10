(message "============load python99 start==============")







(unless (package-installed-p 'elpy)
  (package-install 'elpy))

(elpy-enable)





(message "=====================load python99 end ========================")
