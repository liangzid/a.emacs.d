(require 'ox-publish)
(setq org-publish-project-alist
      '(
         ("blog-notes"
            :base-directory "~/liangzid.github.io/notes/"
             :base-extension "org"
             :publishing-directory "~/liangzid.github.io/"
             :recursive t
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
	     :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://liangzid.github.io/notes/css/worg.css\"/>"

         )
         ("blog-static"
             :base-directory "~/liangzid.github.io/notes/"
             :base-extension "css|js|png|jpg|gif|pdf|mp3|ogg|swf"
             :publishing-directory "~/liangzid.github.io/"
	     :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://liangzid.github.io/notes/css/worg.css\"/>"
             :recursive t
             :publishing-function org-publish-attachment
          )
         ("blog" :components ("blog-notes" "blog-static"))

        ;; 把各部分的配置文件写到这里面来

        ))

(provide 'init-blog)


