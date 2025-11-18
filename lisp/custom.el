(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4"
    "#F8F8F2"])
 '(cnblogs-blog-id "frostliangzi")
 '(cnblogs-server-url
   "http://www.cnblogs.com/frostliangzi/services/metaweblog.aspx")
 '(cnblogs-user-name "frostliangzi")
 '(cnblogs-user-passwd "liangzi227302875")
 '(compilation-message-face 'default)
 '(connection-local-criteria-alist
   '(((:machine "10.21.20.141") 10.21.20.141-vars)
     ((:machine "158.132.150.215") 158.132.150.215-vars)
     ((:machine "158.132.150.226") 158.132.150.226-vars)
     ((:application tramp :protocol "plink") remote-bash)
     ((:application tramp)
      tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((10.21.20.141-vars (company-gtags--executable-connection))
     (158.132.150.215-vars (company-gtags--executable-connection))
     (158.132.150.226-vars (company-gtags--executable-connection))
     (remote-bash (explicit-shell-file-name . "/bin/bash")
		  (explicit-bash-args . "-i"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
					"pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
					"-o" "state=abcde" "-o"
					"ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
					  (euid . number)
					  (user . string)
					  (egid . number) (comm . 52)
					  (state . 5) (ppid . number)
					  (pgrp . number)
					  (sess . number)
					  (ttname . string)
					  (tpgid . number)
					  (minflt . number)
					  (majflt . number)
					  (time . tramp-ps-time)
					  (pri . number)
					  (nice . number)
					  (vsize . number)
					  (rss . number)
					  (etime . tramp-ps-time)
					  (pcpu . number)
					  (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
					"pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
					"-o" "stat=abcde" "-o"
					"ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number)
					  (user . string)
					  (group . string) (comm . 52)
					  (state . 5) (ppid . number)
					  (pgrp . number)
					  (ttname . string)
					  (time . tramp-ps-time)
					  (nice . number)
					  (etime . tramp-ps-time)
					  (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
					"pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
					"-o"
					"state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
					  (euid . number)
					  (user . string)
					  (egid . number)
					  (group . string) (comm . 52)
					  (state . string)
					  (ppid . number)
					  (pgrp . number)
					  (sess . number)
					  (ttname . string)
					  (tpgid . number)
					  (minflt . number)
					  (majflt . number)
					  (time . tramp-ps-time)
					  (pri . number)
					  (nice . number)
					  (vsize . number)
					  (rss . number)
					  (etime . number)
					  (pcpu . number)
					  (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh") (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":") (null-device . "/dev/null"))))
 '(custom-safe-themes
   '("08e1b320892fc3dc3699e092765982a05d87ecd0f5efad5b6415065145d45be9"
     "37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf"
     "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66"
     "0170347031e5dfa93813765bc4ef9269a5e357c0be01febfa3ae5e5fcb351f09"
     "3f1dcd824a683e0ab194b3a1daac18a923eed4dba5269eecb050c718ab4d5a26"
     "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b"
     "2f8eadc12bf60b581674a41ddc319a40ed373dd4a7c577933acaff15d2bf7cc6"
     "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948"
     "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0"
     "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71"
     "5f2d57be4183165dd79fc7aa88d54136c77fdd27ee507c794e092b26d8f7113a"
     "2a2c4b8f3877094ffc639ae9616f491c90456c997a9a9630a0458665052b81e7"
     "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8"
     "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78"
     "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b"
     "e8567ee21a39c68dbf20e40d29a0f6c1c05681935a41e206f142ab83126153ca"
     "11cc65061e0a5410d6489af42f1d0f0478dbd181a9660f81a692ddc5f948bf34"
     "9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3"
     "f00a605fb19cb258ad7e0d99c007f226f24d767d01bf31f3828ce6688cbdeb22"
     "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041"
     "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163"
     "d6844d1e698d76ef048a53cefe713dbbe3af43a1362de81cdd3aefa3711eae0d"
     "e2c926ced58e48afc87f4415af9b7f7b58e62ec792659fcb626e8cba674d2065"
     "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b"
     "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d"
     "353ffc8e6b53a91ac87b7e86bebc6796877a0b76ddfc15793e4d7880976132ae"
     "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae"
     "fc48cc3bb3c90f7761adf65858921ba3aedba1b223755b5924398c666e78af8b"
     "bb74a01bb5fd37151299f560cdc6b015ed5947c2c573861d7ab223085c90bbf1"
     "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045"
     "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da"
     "03336a06e95a977ce3d67f849b93d492736d6bd11d61dddc424c81d7819c8ad1"
     "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3"
     "f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8"
     "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c"
     "eb785a887e90c10848466a1f825fcb57f61672c0b70e2f0fd7c62610ad044277"
     "7d062fbc4a6b42e3db5c8ad011c8182de69c0521df3f4577f893d9941a7af5e2"
     "78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27"
     "f76b5717f04b34542972fb4d320df806d9a465f16c07b31b4bd6e79e4feb1794"
     "d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279"
     default))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0) ("#679A01" . 20) ("#4BBEAE" . 30) ("#1DB4D0" . 50)
     ("#9A8F21" . 60) ("#A75B00" . 70) ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(magit-diff-use-overlays nil)
 '(org-agenda-files nil)
 '(package-selected-packages
   '(all-the-icons all-the-icons-completion all-the-icons-dired
		   almost-mono-themes ample-theme avy beacon
		   benchmark-init challenger-deep-theme
		   challenger-deeper-theme company company-box
		   company-prescient counsel-tramp darcula-theme
		   dockerfile-mode doom-modeline doom-themes
		   dracula-theme ef-themes eglot fantom-theme
		   format-all git-gutter go-translate gruvbox-theme
		   haskell-mode inkpot-theme ivy-posframe jinx
		   kaolin-themes langtool lsp-grammarly lsp-ltex
		   lsp-mode magit marginalia modus-themes mwim
		   nerd-icons nimbus-theme org-alert
		   org-dynamic-bullets org-fragtog org-modern
		   org-pomodoro org-pomotoro org-promotoro org-reveal
		   org-superstar org-visual-indent
		   org-visual-indent-mode ox-reveal pangu-spacing
		   posframe pyim pyim-basedict rg rime solarized-theme
		   standard-themes straight sublime-themes tao-theme
		   telega tramp use-package valign vue-mode winum
		   wucuo zenburn-theme zoom zoom-window))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672") (40 . "#CF4F1F") (60 . "#C26C0F") (80 . "#E6DB74")
     (100 . "#AB8C00") (120 . "#A18F00") (140 . "#989200")
     (160 . "#8E9500") (180 . "#A6E22E") (200 . "#729A1E")
     (220 . "#609C3C") (240 . "#4E9D5B") (260 . "#3C9F79")
     (280 . "#A1EFE4") (300 . "#299BA6") (320 . "#2896B5")
     (340 . "#2790C3") (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D"
		 "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF"
		 "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2"
		 "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
