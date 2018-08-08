(require 'package)

(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(customize-set-variable
  'vc-follow-symlinks t "follow symlinks w/o asking")
(org-babel-load-file "~/.emacs.d/config.org")
