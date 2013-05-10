;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

(add-to-list 'load-path "~/.emacs.d/site-lisp")


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

;; Perl mode
(setq auto-mode-alist (cons '("\\.t$" . perl-mode) auto-mode-alist))

(eval-after-load "perl-mode"
   '(define-key perl-mode-map "\C-c\C-c"  'comment-region))
(eval-after-load "perl-mode"
   '(define-key perl-mode-map "\C-u\C-c"  'uncomment-region))

