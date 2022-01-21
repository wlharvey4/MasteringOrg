TERMSERVER := $(EMACS_TERMSERVER) --socket-name=termserver --suppress-output
boot:
	@$(TERMSERVER) \
	  --eval \
		"(let ((rsrcdir \"resources\") \
		       (subdirs (list \"tools\" \"images\" \"source\"))) \
		   (mkdir rsrcdir t) \
		   (dolist (subdir subdirs) (mkdir (concat rsrcdir \"/\" subdir) t)))" \
	   --eval \
		"(with-current-buffer \
		   (car (find-file-noselect \"./*.org\" nil nil t)) \
		      (save-excursion \
			 (goto-char (point-min)) \
			 (let ((re-search-str \"\\(?::tangle\\|load-file \\(?:[\\]*\\)?[\\\"]\\)\s*\\(.*?/\\[dD\\]ev\\)/\") \
				(dev (getenv \"DEV\"))) \
			    (while \
			       (re-search-forward re-search-str nil t) \
			       (replace-match dev t nil nil 1))) \
			  (save-buffer) \
			  (org-babel-tangle)))"
git:
	git add . && git commit -m "After running boot-template Makefile" && git push origin master
all: boot git
