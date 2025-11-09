(defvar blog-note-path "~/liangzid.github.io/orgs/" "my path of take notes.")
(defun open-org-note()
  (interactive)
  (counsel-find-file blog-note-path))

(use-package ox-publish
  :ensure nil                 ; 内置库
  :defer t                    ; 不立即加载
  :config


(setq org-publish-project-alist
      '(
         ("blog-notes"
            :base-directory "~/liangzid.github.io/orgs/"
             :base-extension "org"
             :publishing-directory "~/liangzid.github.io/docs/"
             :recursive t
	     :htmlized-source t
	     :html-extension "html"
	     :body-only nil
	     :table-of-contents t
             :publishing-function org-html-publish-to-html
             :headline-levels 3
             :auto-preamble t
             :section-numbers t
             :author "Liang Zi"
             :email "liangzi20163933@qq.com"
	     ;; :exclude-tags "noshow"
             :auto-sitemap t                  ; 自动生成 sitemap.org 文件
             :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
             :sitemap-title "Zi's Blog"         ; ... with title 'Sitemap'.
             :sitemap-sort-files anti-chronologically
             :sitemap-file-entry-format "%t"
	     :sitemap-format-entry lz/org-publish-sitemap-with-time

	     ;; :html-head "<link rel='stylesheet' type='text/css' href='https://liangzid.github.io/orgcss/org.css'/>"
	;; :html-head "<link rel='stylesheet' type='text/css' href='https://gongzhitaao.org/orgcss/org.css'/>"

	     :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/styles.css\" /> <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/htmlize.css\" /> <script src=\"/scripts/script.js\"></script> <script src=\"/scripts/toc.js\"></script>"

	     :html-preamble t

	     :html-preamble-format (("en" "<nav class=\"nav\"> <a href=\"/index.html\" class=\"button\">Home</a> <a href=\"/about.html\" class=\"button\">About</a> <a href=\"/sitemap.html\" class=\"button\">Sitemaps</a> </nav> <hr>"))

	     :html-postamble t
	     :html-postamble-format (("en" "<hr class=\"Solid\"> <div class=\"info\"> <span class=\"author\">Author: %a (%e)</span> <span class=\"date\">Create Date: %d</span> <span class=\"date\">Last modified: %C</span> <span>Creator: %c</span> </div>"))
             )
	 
         ("blog-static"
             :base-directory "~/liangzid.github.io/orgs/"
             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
             :publishing-directory "~/liangzid.github.io/docs/"
	     ;; :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://liangzid.github.io/notes/css/worg.css\"/>"
             :recursive t
             :publishing-function org-publish-attachment
          )
         ("blog" :components ("blog-notes" "blog-static"))
        ))

  )

(defun lz/org-publish-sitemap-with-time (entry style project)
  "Format ENTRY for the RSS feed.
ENTRY is a file name.  STYLE is either 'list' or 'tree'.
PROJECT is the current project."
  (cond ((not (directory-name-p entry))
         (let* ((file (org-publish--expand-file-name entry project))
                (title (org-publish-find-title entry project))
                (date (format-time-string "%Y-%m-%d" (org-publish-find-date entry project)))
                (link (concat (file-name-sans-extension entry) ".html")))
	   (format "[[file:%s][%s_%s]]"
		   entry
		   date
		   title)))
        ((eq style 'tree)
         ;; Return only last subdir.
         (file-name-nondirectory (directory-file-name entry)))
        (t entry)))


(provide 'init-blog)
