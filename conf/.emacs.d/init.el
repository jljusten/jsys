(package-initialize)

(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/.emacs.d/local")

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/tmp/backup"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
;(setq-default indent-tabs-mode nil)
(setq sentence-end-double-space nil)
(setq column-number-mode t)
(menu-bar-mode -1)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

(require 'editorconfig)
;(editorconfig-mode 1)

(add-to-list 'auto-mode-alist '("\\.[ch]\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.pigpy\\'" . python-mode))

; Set up mesa and piglit conventions
(dir-locals-set-class-variables 'mesa
  '((c-mode . ((indent-tabs-mode . nil)
         (tab-width . 8)
         (fill-column . 78)
         (c-basic-offset . 3)))
    (c++-mode . ((indent-tabs-mode . nil)
         (tab-width . 8)
         (fill-column . 78)
         (c-basic-offset . 3)))))

(dir-locals-set-directory-class "~/src/fdo/mesa" 'mesa)
(dir-locals-set-directory-class "~/src/vk/mesa" 'mesa)
;(dir-locals-set-directory-class "~/src/fdo/mesa/src/glsl" 'mesa)

; Set up mesa and piglit conventions
(dir-locals-set-class-variables 'sanity
  '((c-mode . ((indent-tabs-mode . nil)
         (tab-width . 8)
         (fill-column . 78)
         (c-basic-offset . 4)))
    (c++-mode . ((indent-tabs-mode . nil)
         (tab-width . 8)
         (fill-column . 78)
         (c-basic-offset . 4)))))

(dir-locals-set-directory-class "~/src/SDL" 'sanity)
(dir-locals-set-directory-class "~/dev/sdlgt" 'sanity)

(dir-locals-set-directory-class "~/src/fdo/waffle" 'sanity)

(dir-locals-set-class-variables 'use_tabs8
  '((nil . ((indent-tabs-mode . t)
      (tab-width . 8)
      (c-basic-offset . 8)))))

(dir-locals-set-class-variables 'piglit
  '((nil . ((indent-tabs-mode . t)
            (tab-width . 8)
            (c-basic-offset . 8)))
    (python-mode . ((indent-tabs-mode . nil)
                (tab-width . 8)
                (fill-column . 78)
                (c-basic-offset . 4)))))

(dir-locals-set-directory-class "~/src/fdo/piglit" 'piglit)

(dir-locals-set-directory-class "~/src/fdo/fips" 'use_tabs8)
(dir-locals-set-directory-class "~/src/fdo/drm" 'use_tabs8)
(dir-locals-set-directory-class "~/src/linux" 'use_tabs8)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(notmuch-search-oldest-first nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
