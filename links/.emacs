;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(setq-default inhibit-startup-message t)
(setq initial-scratch-message "")
(fset 'yes-or-no-p 'y-or-n-p)
(global-font-lock-mode 1)
(which-func-mode)
(defalias 'perl-mode 'cperl-mode)

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; Show marked text
;;(setq transient-mark-mode '1)

;; Show empty lines at the end of the buffer
(setq default-indicate-empty-lines t)

;; enable this to get rid of those silly underscores
;;(setq cperl-invalid-face nil)

(fset 'BP
      "#!/usr/bin/perl\n\nuse strict;\nuse warnings;\n"
        )
;; M-x BP now inserts boiler plate

(xterm-mouse-mode t)
;; allows some mouse use in a xterm/putty session




;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

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
(require 'linum)
(global-linum-mode t)

;; row/col numbers in mode line
(line-number-mode 1)
(column-number-mode 1)

;; TABS/SPACES
(setq c-basic-offset 4)
(setq tab-width 4)
(setq indent-tabs-mode nil) 


;; PERLTIDY
;;(require 'perltidy)

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

;; Perl mode
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))

(eval-after-load "cperl-mode"
   '(define-key cperl-mode-map "\C-c\C-c"  'comment-region))
(eval-after-load "cperl-mode"
   '(define-key cperl-mode-map "\C-u\C-c"  'uncomment-region))

(show-paren-mode 1)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cperl-array-face ((((class color) (background light)) (:foreground "Yellow"))))
 '(cperl-hash-face ((((class color) (background light)) (:foreground "Yellow"))))
 '(mmm-default-submode-face ((((background light)) (:background "gray40"))))
 '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white" :bold)))))

;; CPERL-MODE

(setq cperl-indent-level 4)

(defface cperl-background-highlight-face
      '((((class color))
         ;; define your tastes (background, foreground)
         (
          :background "grey98" 
;         :underline "grey"
          )
         ))
      "My face for highlighting backgrounds in cperl-mode"
      :group 'cperl-mode)

(set-default 'cperl-invalid-face 'cperl-background-highlight-face)

(setq cperl-highlight-variables-indiscriminately t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(undo-limit 800000)
 '(undo-strong-limit 1200000))


;; PHP mode
(require 'php-mode)
(setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))


;; HIGHLIGHT CHARS
(require 'highlight-chars)
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)

