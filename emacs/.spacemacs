;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     elm
     php
     auto-completion
     better-defaults
     (clojure :variables
              clojure-enable-fancify-symbols nil)
     emacs-lisp
     csv
     django
     elm
     emacs-lisp
     haskell
     html
     javascript
     markdown
     org
     php
     python
     react
     ruby
     rust
     (syntax-checking :variables
                      syntax-checking-enable-by-default nil)
     vimscript
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     editorconfig
     ;nodejs-repl
     ;org-journal
     color-theme-solarized ;; https://github.com/syl20bnr/spacemacs/issues/1269#issuecomment-198309213
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     eldoc               ; too slow
     git                 ; keeps turning on version-control diff
     github
     smartparens
     toxi-theme          ; broken
     rainbow-delimeters  ; gets confused by unbalanced parens in html
     org-bullets         ; prefer plain-jane asterisks
     version-control     ; dislike diff in fringe/gutter
     yasnippet
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("DejaVu Sans Mono"
                               :size 10
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default
   evil-escape-key-sequence "~!"
   web-mode-enable-auto-closing t
   ))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq powerline-default-separator 'utf-8
        powerline-utf-8-separator-left ?\ue0b4
        powerline-utf-8-separator-right ?\ue0b6)

  ;; Don't use unicode symbols for diminished minor modes
  (setq dotspacemacs-mode-line-unicode-symbols nil)

  ;; https://github.com/syl20bnr/spacemacs/issues/6097
  ;(setq scroll-conservatively 101
  ;      scroll-margin 0
  ;      scroll-preserve-screen-position 't)

  (global-hl-line-mode -1)
  (set-default 'truncate-lines t)
  (setq evil-move-beyond-eol nil)
  ;; (global-diff-hl-mode -1)

  ;; make evil-matchit suck less
  ;; https://github.com/syl20bnr/spacemacs/issues/7982#issuecomment-267815038
  ;; https://github.com/redguardtoo/evil-matchit/issues/75
  (setq evilmi-always-simple-jump t)

  ;; customize company-mode to avoid idle completion, and start manual
  ;; completion with C-space
  (setq company-idle-delay nil)  ; no idle completion
  (define-key evil-insert-state-map (kbd "C-@") 'company-complete)

  ;; don't intercept clicks
  (xterm-mouse-mode -1)

  ;; https://github.com/syl20bnr/spacemacs/issues/3064
  ;; now default in Emacs 25
  ;; https://github.com/emacs-mirror/emacs/blob/master/etc/NEWS.25
  ;(require 'bracketed-paste)
  ;(bracketed-paste-enable)

  (require 'editorconfig)
  (editorconfig-mode 1)

  ;; https://www.emacswiki.org/emacs/OrgJournal
  ;(require 'org-journal)
  ;(setq org-journal-dir "~/Dropbox/Journal"
  ;      org-journal-file-format "%Y%m%d.org")
  ;(evil-leader/set-key
  ;  "jj" 'org-journal-new-entry)

  ;; Copy the Spacemacs bindings for org-mode to org-journal-mode. This has to
  ;; happen before adding new entries, since spacemacs//init-leader-mode-map
  ;; checks to see if the map exists already.
  (setq spacemacs-org-journal-mode-map (copy-keymap spacemacs-org-mode-map))
  (spacemacs//init-leader-mode-map 'org-journal-mode 'spacemacs-org-journal-mode-map)

  (evil-leader/set-key-for-mode 'org-journal-mode
    "jn" 'org-journal-open-next-entry
    "jp" 'org-journal-open-previous-entry)

  ;; Prefer the unindented original presentation
  (setq org-startup-indented nil)

  ;; Assume text files are markdown
  (add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))

  ;; Don't highlight smartparens overlays, because they seem to use the same
  ;; fg/bg so it's just unreadable.
  (setq sp-highlight-pair-overlay nil)
  (setq sp-highlight-wrap-overlay nil)
  (setq sp-highlight-wrap-tag-overlay nil)

  ;; Assume JS files are react, since this does ES6
  (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode))

  ;; These are defaults. They can be overridden if there's a .editorconfig
  ;; present.
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-style-padding 4)
  (setq web-mode-script-padding 4)
  (setq web-mode-block-padding 4)
  (setq web-mode-comment-style 2)  ; server comment
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))
  (setq js2-strict-missing-semi-warning nil)
  (setq js-switch-indent-offset 2)

  ;; Send region to nodejs repl
  (spacemacs/set-leader-keys "onr" 'nodejs-repl-send-region)

  ;; Include underscore as a word character.
  ;; http://daemianmack.com/?p=45 (though it doesn't get the hook
  ;; definition right) and comments in
  ;; https://gist.github.com/timcharper/5034251
  (defun underscore-is-word-char ()
    (modify-syntax-entry ?_ "w"))

  (add-hook 'change-major-mode-hook 'underscore-is-word-char)

  (defun agriffis/setenv-from-dir-locals ()
    (cond ((boundp 'agriffis/env)
           (make-local-variable 'process-environment)
           (dolist (kv agriffis/env)
             (setenv (car kv) (cdr kv))))
          ((local-variable-p 'process-environment)
           (kill-local-variable 'process-environment))))

  (add-hook 'hack-local-variables-hook 'agriffis/setenv-from-dir-locals)
  )

;; (defun frame-restore-background (frame)
;;   (unless (display-graphic-p frame)
;;     ;; Force the background color back to default, see
;;     ;; http://stackoverflow.com/questions/19054228/emacs-disable-theme-background-color-in-terminal
;;     (set-face-background 'default "unspecified-bg" frame)))
;; (defun restore-background (orig-fun &rest args)
;;   (let ((res (apply orig-fun args)))
;;     (dolist (frame (frame-list))
;;       (frame-restore-background frame))
;;     res))
;; (advice-add 'load-theme :around #'restore-background)
;; (add-hook 'after-make-frame-functions 'frame-restore-background)

;; http://emacs.stackexchange.com/questions/3112/how-to-reset-color-theme
(defadvice load-theme (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#bcbcbc" "#d70008" "#5faf00" "#875f00" "#268bd2" "#800080" "#008080" "#5f5f87"])
 '(custom-safe-themes
   (quote
    ("a276998eb08b2d51d1b4fe74e885c56e33124a44e56b9276e670a61f694f03a4" "016d14b6ac7cac14a33979d4d56bd15f5ae98db28f251ad85686373f4606431d" "be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194" "45712b65018922c9173439d9b1b193cb406f725f14d02c8c33e0d2cdad844613" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "3f78849e36a0a457ad71c1bda01001e3e197fe1837cb6eaa829eb37f0a4bdad5" "c35c0effa648fd320300f3d45696c640a92bdc7cf0429d002a96bda2b42ce966" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d725097d2547e9205ab6c8b034d6971c2f0fc64ae5f357b61b7de411ca3e7ab2" "3038a172e5b633d0b1ee284e6520a73035d0cb52f28b1708e22b394577ad2df1" default)))
 '(diff-hl-margin-mode nil)
 '(evil-want-Y-yank-to-eol t)
 '(global-diff-hl-mode t)
 '(global-git-gutter-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(js-switch-indent-offset 2)
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (org-bullets intero flycheck-rust paredit bind-key packed avy haskell-mode pcache alert log4e rust-mode haml-mode powerline spinner org highlight gh multiple-cursors inflections anzu async dash minitest hide-comnt helm-purpose window-purpose imenu-list yaml-mode yasnippet magit-popup clojure-mode pug-mode ac-ispell ace-jump-helm-line ace-link ace-window adaptive-wrap afternoon-theme aggressive-indent alect-themes ample-theme ample-zen-theme anaconda-mode anti-zenburn-theme apropospriate-theme auto-compile auto-complete auto-highlight-symbol auto-yasnippet badwolf-theme birds-of-paradise-plus-theme bracketed-paste bubbleberry-theme buffer-move bundler busybee-theme cherry-blossom-theme chruby cider cider-eval-sexp-fu clean-aindent-mode clj-refactor clojure-snippets clues-theme coffee-mode color-theme color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized colorsarenice-theme column-enforce-mode company company-anaconda company-quickhelp company-statistics company-tern company-web cyberpunk-theme cython-mode dactyl-mode dakrone-theme darkburn-theme darkmine-theme darkokai-theme darktooth-theme dash-functional define-word django-theme dracula-theme dumb-jump editorconfig elisp-slime-nav emmet-mode espresso-theme evil evil-anzu evil-args evil-ediff evil-escape evil-exchange evil-iedit-state evil-indent-plus evil-lisp-state evil-magit evil-matchit evil-mc evil-nerd-commenter evil-numbers evil-search-highlight-persist evil-surround evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar exec-path-from-shell expand-region eyebrowse f fancy-battery farmhouse-theme fill-column-indicator firebelly-theme flatland-theme flatui-theme flx-ido flycheck flycheck-pos-tip gandalf-theme gh-md gist git-commit git-link git-messenger git-timemachine gitattributes-mode gitconfig-mode github-browse-file github-clone github-search gnuplot golden-ratio google-translate gotham-theme grandshell-theme gruber-darker-theme gruvbox-theme hc-zenburn-theme helm helm-ag helm-c-yasnippet helm-company helm-core helm-css-scss helm-descbinds helm-flx helm-gitignore helm-make helm-mode-manager helm-projectile helm-pydoc helm-swoop helm-themes help-fns+ hemisu-theme heroku-theme highlight-indentation highlight-numbers highlight-parentheses hl-todo ht htmlize hungry-delete hy-mode hydra ido-vertical-mode iedit indent-guide inf-ruby info+ inkpot-theme ir-black-theme jade-mode jazz-theme jbeans-theme js-doc js2-mode js2-refactor json-mode json-reformat json-snatcher less-css-mode leuven-theme light-soap-theme link-hint linum-relative live-py-mode livid-mode lorem-ipsum lush-theme macrostep magit magit-gh-pulls magit-gitflow majapahit-theme markdown-mode markdown-toc material-theme minimal-theme mmm-mode moe-theme molokai-theme monochrome-theme monokai-theme move-text mustang-theme mwim naquadah-theme neotree niflheim-theme noctilux-theme obsidian-theme occidental-theme oldlace-theme omtose-phellack-theme open-junk-file org-download org-journal org-plus-contrib org-pomodoro org-present org-projectile org-repo-todo organic-green-theme orgit page-break-lines paradox pastels-on-dark-theme pcre2el persp-mode phoenix-dark-mono-theme phoenix-dark-pink-theme pip-requirements planet-theme pony-mode popwin professional-theme projectile purple-haze-theme py-isort py-yapf pyenv-mode pytest pyvenv quelpa railscasts-theme rainbow-delimiters rake rbenv request restart-emacs reverse-theme robe rspec-mode rubocop ruby-test-mode ruby-tools rvm s sass-mode scss-mode seti-theme simple-httpd skewer-mode slim-mode smartparens smeargle smooth-scrolling smyx-theme soft-charcoal-theme soft-morning-theme soft-stone-theme solarized-theme soothe-theme spacegray-theme spaceline spacemacs-theme stekene-theme subatomic-theme subatomic256-theme sublime-themes sunny-day-theme tagedit tango-2-theme tango-plus-theme tangotango-theme tao-theme tern toc-org tronesque-theme twilight-anti-bright-theme twilight-bright-theme twilight-theme ujelly-theme underwater-theme undo-tree use-package uuidgen vi-tilde-fringe vimrc-mode volatile-highlights web-beautify web-mode which-key window-numbering with-editor ws-butler yapfify zen-and-art-theme zenburn-theme zonokai-theme)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((python-shell-virtualenv-path . "/home/aron/.virtualenvs/pp")
     (python-shell-virtualenv-path . "/home/aron/.virtualenvs/fec-cms")
     (encoding . utf-8))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(diff-hl-change ((t (:foreground "yellow"))))
 '(diff-hl-delete ((t (:inherit diff-removed :foreground "red"))))
 '(diff-hl-insert ((t (:inherit diff-added :foreground "blue")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#bcbcbc" "#d70008" "#5faf00" "#875f00" "#268bd2" "#800080" "#008080" "#5f5f87"])
 '(custom-safe-themes
   (quote
    ("a276998eb08b2d51d1b4fe74e885c56e33124a44e56b9276e670a61f694f03a4" "016d14b6ac7cac14a33979d4d56bd15f5ae98db28f251ad85686373f4606431d" "be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194" "45712b65018922c9173439d9b1b193cb406f725f14d02c8c33e0d2cdad844613" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "3f78849e36a0a457ad71c1bda01001e3e197fe1837cb6eaa829eb37f0a4bdad5" "c35c0effa648fd320300f3d45696c640a92bdc7cf0429d002a96bda2b42ce966" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d725097d2547e9205ab6c8b034d6971c2f0fc64ae5f357b61b7de411ca3e7ab2" "3038a172e5b633d0b1ee284e6520a73035d0cb52f28b1708e22b394577ad2df1" default)))
 '(diff-hl-margin-mode nil)
 '(evil-want-Y-yank-to-eol t)
 '(global-diff-hl-mode t)
 '(global-git-gutter-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(js-switch-indent-offset 2)
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets winum unfill toml-mode symon string-inflection spaceline-all-the-icons all-the-icons memoize font-lock+ sayid ruby-refactor ruby-hash-syntax racer pippel phpunit phpcbf php-extras php-auto-yasnippets password-generator overseer org-category-capture gntp org-mime org-brain nameless importmagic epc ctable concurrent deferred impatient-mode hlint-refactor hindent parent-mode helm-hoogle haskell-snippets fuzzy pos-tip flycheck-haskell flycheck-elm flx evil-org evil-lion evil-cleverparens elm-mode drupal-mode dante csv-mode counsel-projectile counsel swiper ivy web-completion-data company-php ac-php-core xcscope php-mode company-ghci company-ghc ghc company-cabal cmm-mode clojure-cheatsheet edn seq peg eval-sexp-fu queue pkg-info epl cargo pythonic popup goto-chg diminish bind-map org-bullets intero flycheck-rust paredit bind-key packed avy haskell-mode pcache alert log4e rust-mode haml-mode powerline spinner org highlight gh multiple-cursors inflections anzu async dash minitest hide-comnt helm-purpose window-purpose imenu-list yaml-mode yasnippet magit-popup clojure-mode pug-mode ac-ispell ace-jump-helm-line ace-link ace-window adaptive-wrap afternoon-theme aggressive-indent alect-themes ample-theme ample-zen-theme anaconda-mode anti-zenburn-theme apropospriate-theme auto-compile auto-complete auto-highlight-symbol auto-yasnippet badwolf-theme birds-of-paradise-plus-theme bracketed-paste bubbleberry-theme buffer-move bundler busybee-theme cherry-blossom-theme chruby cider cider-eval-sexp-fu clean-aindent-mode clj-refactor clojure-snippets clues-theme coffee-mode color-theme color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized colorsarenice-theme column-enforce-mode company company-anaconda company-quickhelp company-statistics company-tern company-web cyberpunk-theme cython-mode dactyl-mode dakrone-theme darkburn-theme darkmine-theme darkokai-theme darktooth-theme dash-functional define-word django-theme dracula-theme dumb-jump editorconfig elisp-slime-nav emmet-mode espresso-theme evil evil-anzu evil-args evil-ediff evil-escape evil-exchange evil-iedit-state evil-indent-plus evil-lisp-state evil-magit evil-matchit evil-mc evil-nerd-commenter evil-numbers evil-search-highlight-persist evil-surround evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar exec-path-from-shell expand-region eyebrowse f fancy-battery farmhouse-theme fill-column-indicator firebelly-theme flatland-theme flatui-theme flx-ido flycheck flycheck-pos-tip gandalf-theme gh-md gist git-commit git-link git-messenger git-timemachine gitattributes-mode gitconfig-mode github-browse-file github-clone github-search gnuplot golden-ratio google-translate gotham-theme grandshell-theme gruber-darker-theme gruvbox-theme hc-zenburn-theme helm helm-ag helm-c-yasnippet helm-company helm-core helm-css-scss helm-descbinds helm-flx helm-gitignore helm-make helm-mode-manager helm-projectile helm-pydoc helm-swoop helm-themes help-fns+ hemisu-theme heroku-theme highlight-indentation highlight-numbers highlight-parentheses hl-todo ht htmlize hungry-delete hy-mode hydra ido-vertical-mode iedit indent-guide inf-ruby info+ inkpot-theme ir-black-theme jade-mode jazz-theme jbeans-theme js-doc js2-mode js2-refactor json-mode json-reformat json-snatcher less-css-mode leuven-theme light-soap-theme link-hint linum-relative live-py-mode livid-mode lorem-ipsum lush-theme macrostep magit magit-gh-pulls magit-gitflow majapahit-theme markdown-mode markdown-toc material-theme minimal-theme mmm-mode moe-theme molokai-theme monochrome-theme monokai-theme move-text mustang-theme mwim naquadah-theme neotree niflheim-theme noctilux-theme obsidian-theme occidental-theme oldlace-theme omtose-phellack-theme open-junk-file org-download org-journal org-plus-contrib org-pomodoro org-present org-projectile org-repo-todo organic-green-theme orgit page-break-lines paradox pastels-on-dark-theme pcre2el persp-mode phoenix-dark-mono-theme phoenix-dark-pink-theme pip-requirements planet-theme pony-mode popwin professional-theme projectile purple-haze-theme py-isort py-yapf pyenv-mode pytest pyvenv quelpa railscasts-theme rainbow-delimiters rake rbenv request restart-emacs reverse-theme robe rspec-mode rubocop ruby-test-mode ruby-tools rvm s sass-mode scss-mode seti-theme simple-httpd skewer-mode slim-mode smartparens smeargle smooth-scrolling smyx-theme soft-charcoal-theme soft-morning-theme soft-stone-theme solarized-theme soothe-theme spacegray-theme spaceline spacemacs-theme stekene-theme subatomic-theme subatomic256-theme sublime-themes sunny-day-theme tagedit tango-2-theme tango-plus-theme tangotango-theme tao-theme tern toc-org tronesque-theme twilight-anti-bright-theme twilight-bright-theme twilight-theme ujelly-theme underwater-theme undo-tree use-package uuidgen vi-tilde-fringe vimrc-mode volatile-highlights web-beautify web-mode which-key window-numbering with-editor ws-butler yapfify zen-and-art-theme zenburn-theme zonokai-theme)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((python-shell-virtualenv-path . "/home/aron/.virtualenvs/pp")
     (python-shell-virtualenv-path . "/home/aron/.virtualenvs/fec-cms")
     (encoding . utf-8))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(diff-hl-change ((t (:foreground "yellow"))))
 '(diff-hl-delete ((t (:inherit diff-removed :foreground "red"))))
 '(diff-hl-insert ((t (:inherit diff-added :foreground "blue")))))
)
