;; (require 'ox-publish)
;; (require 'ox-rss)


(defvar blog-note-path "~/liangzid.github.io/notes/" "my path of take notes.")

(defun open-org-note()
  (interactive)
  (counsel-find-file blog-note-path))

(setq org-publish-project-alist
      '(
         ("blog-notes"
            :base-directory "~/liangzid.github.io/notes/"
             :base-extension "org"
             :publishing-directory "~/liangzid.github.io/"
             :recursive t
	     :htmlized-source t
	     :html-extension "html"
	     :body-only nil
	     :table-of-contents t
             :publishing-function org-html-publish-to-html
             :headline-levels 5
             :auto-preamble t
             :section-numbers t
             :author "LiangZi"
             :email "liangzid@stu.xjtu.edu.cn"
	     ;; :exclude-tags "noshow"
             :auto-sitemap t                  ; 自动生成 sitemap.org 文件
             :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
             :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
             :sitemap-sort-files anti-chronologically
             :sitemap-file-entry-format "%d %t"
	     ;; :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://liangzid.github.io/notes/css/worg.css\"/>"

         )
         ("blog-static"
             :base-directory "~/liangzid.github.io/notes/"
             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
             :publishing-directory "~/liangzid.github.io/"
	     ;; :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://liangzid.github.io/notes/css/worg.css\"/>"
             :recursive t
             :publishing-function org-publish-attachment
          )
         ("blog" :components ("blog-notes" "blog-static"))

	("blog-rss"
	    :base-directory "~/liangzid.github.io/notes/"
	    :base-extension "org"
	    ;; :exclude '(regexp-opt '("sitemap.org" "index.org"))
	    :recursive nil
	    :publishing-function rw/org-rss-publish-to-rss
	    :publishing-directory "~/liangzid.github.io/"
	    :rss-extension "xml"
	    ;; :html-link-home rw-url
	    :html-link-use-abs-url t
	    :html-link-org-files-as-html t
	    :auto-sitemap t
	    :sitemap-filename "rss.org"
	    :sitemap-title "liangzi-title"
	    :sitemap-style list
	    :sitemap-sort-files anti-chronologically
	    ;; :sitemap-function rw/format-rss-feed
	    :sitemap-format-entry rw/format-rss-feed-entry)
        ))


(defun rw/org-rss-publish-to-rss (plist filename pub-dir)
  "Publish RSS with PLIST, only when FILENAME is 'rss.org'.
PUB-DIR is when the output will be placed."
  (if (equal "rss.org" (file-name-nondirectory filename))
      (org-rss-publish-to-rss plist filename pub-dir)))

(defun rw/format-rss-feed (title list)
  "Generate RSS feed, as a string.
TITLE is the title of the RSS feed.  LIST is an internal
representation for the files to include, as returned by
`org-list-to-lisp'.  PROJECT is the current project."
  ;; (message "title: %s" title)
  ;; (message "input list: %s" list)
  (concat "#+TITLE: " title "\n\n"
          (org-list-to-subtree list '(:icount "" :istart ""))))

(defun rw/format-rss-feed-entry (entry style project)
  "Format ENTRY for the RSS feed.
ENTRY is a file name.  STYLE is either 'list' or 'tree'.
PROJECT is the current project."
  (cond ((not (directory-name-p entry))
         (let* ((file (org-publish--expand-file-name entry project))
                (title (org-publish-find-title entry project))
                (date (format-time-string "%Y-%m-%d" (org-publish-find-date entry project)))
                (link (concat (file-name-sans-extension entry) ".html")))
           (with-temp-buffer
             (insert (format "* [[file:%s][%s]]\n" file title))
             (org-set-property "RSS_PERMALINK" link)
             (org-set-property "PUBDATE" date)
             (insert-file-contents file)
             (buffer-string))))
        ((eq style 'tree)
         ;; Return only last subdir.
         (file-name-nondirectory (directory-file-name entry)))
        (t entry)))

;; (defgroup org-export-rss nil
;;   "Options specific to RSS export back-end."
;;   :tag "Org RSS"
;;   :group 'org-export
;;   :version "24.4"
;;   :package-version '(Org . "8.0"))

;; (defcustom org-rss-extension "xml"
;;   "File extension for the RSS 2.0 feed."
;;   :group 'org-export-rss
;;   :type 'string)


;; (defun org-rss-publish-to-rss (plist filename pub-dir)
;;   "Publish an org file to RSS.
;; FILENAME is the filename of the Org file to be published.  PLIST
;; is the property list for the given project.  PUB-DIR is the
;; publishing directory.
;; Return output file name."
;;   (let ((bf (get-file-buffer filename)))
;;     (if bf
;; 	  (with-current-buffer bf
;; 	    (org-icalendar-create-uid filename 'warn-user)
;; 	    (org-rss-add-pubdate-property)
;; 	    (write-file filename))
;;       (find-file filename)
;;       (org-icalendar-create-uid filename 'warn-user)
;;       (org-rss-add-pubdate-property)
;;       (write-file filename) (kill-buffer)))
;;   (org-publish-org-to
;;    'rss filename (concat "." org-rss-extension) plist pub-dir))

;; (defun org-rss-add-pubdate-property ()
;;   "Set the PUBDATE property for top-level headlines."
;;   (let (msg)
;;     (org-map-entries
;;      (lambda ()
;;        (let* ((entry (org-element-at-point))
;; 	      (level (org-element-property :level entry)))
;; 	 (when (= level 1)
;; 	   (unless (org-entry-get (point) "PUBDATE")
;; 	     (setq msg t)
;; 	     (org-set-property
;; 	      "PUBDATE" (format-time-string
;; 			 (cdr org-time-stamp-formats)))))))
;;      nil nil 'comment 'archive)
;;     (when msg
;;       (message "Property PUBDATE added to top-level entries in %s"
;; 	       (buffer-file-name))
;;       (sit-for 2))))

(provide 'init-blog)
