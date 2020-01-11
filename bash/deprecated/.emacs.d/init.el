; Proxy
; (setq url-proxy-services '(("http" . "proxy.example.com:8080")))

; Package (An error occurs if the melpa URL does not have a slash in the end)
(defalias 'lp 'list-packages)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

; Encoding
(prefer-coding-system 'utf-8)

; Debuggable
(setq debug-on-error t)

; Tab size
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

; Color
(global-font-lock-mode t)
; Highlight selected areas
(transient-mark-mode t)
; Highlight parentheses
(show-paren-mode t)

; Display column number at mode line
(column-number-mode 1)

; Disable menu bar
(menu-bar-mode 0)
; Disable startup message
(setq inhibit-startup-message t)
; Disable backup files
(setq backup-inhibited 0)
; Delete auto-saved files when quitting
(setq delete-auto-save-files t)

; Ctrl-c h to display the help
(global-set-key "\C-ch" 'help-for-help)
; Ctrl-h to delete a character
(global-set-key "\C-h" 'delete-backward-char)
; Ctrl-l to go to a speficied line
(global-set-key "\C-cl" 'goto-line)
; Ctrl-m (= hit enter) to go to new line and indent (no need to explicitly type C-m)
(global-set-key "\C-m" 'newline-and-indent)

; Alt-h to delete a word
(global-set-key (kbd "M-h") 'backward-kill-word)
; Alt-g to jump to a line
(global-set-key (kbd "M-g") 'goto-line)