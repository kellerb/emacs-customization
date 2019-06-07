(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-rust-check-tests nil)
 '(package-selected-packages
   (quote
    (yasnippet helm-descbinds rust-mode helm-rg yaml-mode avy helm helm-projectile lsp-mode go-mode cquery racer geiser lsp-ui company-lsp json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company counsel swiper ivy exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; start ben modifications
(set-face-attribute 'default nil :height 80)

(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)

(delete-selection-mode 1)

(define-key helm-map [(control ?w)] #'backward-kill-word)
(global-set-key (kbd "C-w") #'backward-kill-word)
(global-set-key (kbd "<C-backspace>") #'kill-region)


(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )


; point at beginning of match after search if exit with return
; from http://endlessparentheses.com/leave-the-cursor-at-start-of-match-after-isearch.html
(define-key isearch-mode-map [(return)]
  #'isearch-exit-other-end)
(defun isearch-exit-other-end ()
  "Exit isearch, at the opposite end of the string."
  (interactive)
  (isearch-exit)
  (goto-char isearch-other-end))

(setq column-number-mode t)

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


(global-set-key (kbd "M-l") 'helm-mini)
(global-set-key (kbd "M-p") 'helm-projectile-find-file)
(global-set-key (kbd "M-m") 'helm-projectile-rg)


; Error during download request: Not Found
; M-x package-refresh-contents
