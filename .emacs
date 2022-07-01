;; set window geometry
(when window-system (set-frame-size (selected-frame) 150 50))

;; indentation with c, c++, java
(setq c-default-style "user"
      indent-tabs-mode t
      tab-width 4)

(setq-default c-basic-offset 4
	     tab-width 4
	     indent-tabs-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tao-yang))
 '(custom-safe-themes
   '("801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "dc6d3dbbfc3dde0a6d04b86a2659e208474646a5b559f05c95f2c450742fffb7" default))
 '(package-selected-packages
   '(company-go tao-theme elpher lsp-mode rustic company-web company evil))
 '(tool-bar-mode nil))

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;;(package-initialize)
;;(package-refresh-contents)

;; Download Evil
;;(unless (package-installed-p 'evil)
;;  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; evil to normal mode with jk
(defun my-jk ()
  (interactive)
  (let* ((initial-key ?j)
         (final-key ?k)
         (timeout 0.5)
         (event (read-event nil nil timeout)))
    (if event
        ;; timeout met
        (if (and (characterp event) (= event final-key))
            (evil-normal-state)
          (insert initial-key)
          (push event unread-command-events))
      ;; timeout exceeded
      (insert initial-key))))

(define-key evil-insert-state-map (kbd "j") 'my-jk)

;; display line numbers when in programming mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)


;; enabling company : auto completion
(global-company-mode t)

;; Changing key mapping to navigate in company
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(setq company-idle-delay 0.0)

;; electric pair mode for auto closing parenthesis
(electric-pair-mode t)
;; (setq electric-pair-preserve-balance nil)

;; setting tab width
(setq default-tab-width 4)



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width semi-condensed :foundry "FBI " :family "Input")))))

;; default theme and options backup

;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(default ((t (:inherit nil :extend nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "ADBO" :family "Input")))))
