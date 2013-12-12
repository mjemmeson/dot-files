;; .emacs

;; GENERAL / EMACS
(setq-default inhibit-startup-message t)
(setq initial-scratch-message "")
(fset 'yes-or-no-p 'y-or-n-p)

(xterm-mouse-mode t)                     ;; allows some mouse use in a xterm/putty session

(setq frame-title-format                 ;; default to better frame titles
      (concat  "%b - emacs@" (system-name)))


;; PATHS
(add-to-list 'load-path "~/.emacs.d-site-lisp")
(add-to-list 'load-path "~/share/emacs/site-lisp")

;; BACKUP FILES
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist (quote ((".*" . "~/.emacs_backups")))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; LINE NUMBERS
(require 'linum)                         ;; line numbers in left margin
(global-linum-mode t)
(line-number-mode 1)                     ;; row/col numbers in mode line
(column-number-mode 1)                   ;; 

;; TABS/SPACES
(setq c-basic-offset 4)
(setq tab-width 4)
(setq indent-tabs-mode nil) 
(setq-default indent-tabs-mode nil) 

;; TEXT EDITING
(setq transient-mark-mode t)             ;; enable visual feedback on selections
(setq default-indicate-empty-lines t)    ;; Show empty lines at the end of the buffer
(setq require-final-newline 'query)      ;; always end a file with a newline
(setq diff-switches "-u")                ;; default to unified diffs
;; (require 'un-define)                  ;; uncomment for CJK utf-8 support for non-Asian users

;; MODES
(global-font-lock-mode 1)                ;; enable colors
(which-func-mode)                        ;; show current function name in mode line
(show-paren-mode 1)                      ;; highlight parentheses under cursor
(setq show-parent-delay 0)               ;; remove delay

;; PERL
(defalias 'perl-mode 'cperl-mode)
(require 'perl-find-library)
(fset 'BP
      "#!/usr/bin/perl\n\nuse strict;\nuse warnings;\n"
        )
;; M-x BP now inserts boiler plate

(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))

(eval-after-load "cperl-mode"
   '(define-key cperl-mode-map "\C-c\C-c"  'comment-region))
(eval-after-load "cperl-mode"
   '(define-key cperl-mode-map "\C-u\C-c"  'uncomment-region))

(setq cperl-indent-level 4)

;; PERLTIDY
(defun perltidy ()
    "Run perltidy on the current region or buffer."
    (interactive)
    ; Inexplicably, save-excursion doesn't work here.
    (let ((orig-point (point)))
      (unless mark-active (mark-defun))
      (shell-command-on-region (point) (mark) "perltidy -q" nil t)
      (goto-char orig-point)))
(global-set-key "\C-ct" 'perltidy)

;; MODES

;; MMM Mode
;;(require 'mmm-auto)
;;(setq mmm-global-mode 'maybe)
;;(add-to-list 'auto-mode-alist '("/opt/projects/mj4/platform/site" . sgml-mode))
;;(mmm-add-mode-ext-class 'sgml-mode "/opt/projects/mj4/platform/site" 'mason)


;; PHP mode
(require 'php-mode)
(setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))


;; TT-mode
(autoload 'tt-mode "tt-mode")
(setq auto-mode-alist
 (append '(("\\.tt$" . tt-mode))  auto-mode-alist ))


;; HIGHLIGHT CHARS
(require 'highlight-chars)
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)


;; AUTO-COMPLETE
(require 'auto-complete-config)
(ac-config-default)
(require 'popup)
(setq-default ac-sources '(
    ac-source-words-in-buffer
;;    ac-source-features
;;    ac-source-functions
;;    ac-source-yasnippet
;;    ac-source-variables
;;    ac-source-symbols
    ac-source-abbrev
    ac-source-dictionary
    ac-source-words-in-same-mode-buffers
))


;; FONT / HIGHLIGHTING

; perl
(setq cperl-highlight-variables-indiscriminately t)

(defface cperl-background-highlight-face
      '((((class color))
         (:background "orange")
         ))
      "My face for highlighting backgrounds in cperl-mode"
      :group 'cperl-mode)
(set-default 'cperl-invalid-face 'cperl-background-highlight-face) ;; trailing spaces


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.

  ; general
  '(mmm-default-submode-face ((((background light)) (:background "gray40"))))
  '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white" :bold))))
  ; perl
  '(cperl-array-face ((((class color) (background light)) (:foreground "Yellow"))))
  '(cperl-hash-face  ((((class color) (background light)) (:foreground "Yellow"))))

)

;; OTHER VARIABLES (from customize)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(undo-limit 800000)
 '(undo-strong-limit 1200000))

