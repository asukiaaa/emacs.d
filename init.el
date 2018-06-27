(cond (window-system
(setq x-select-enable-clipboard t)
))
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; theme setting
;; (load-theme 'manoj-dark t)

;; magic commentの停止
;; # -​*- coding: utf-8 -*​-
(setq ruby-insert-encoding-magic-comment nil)

;; backup file 作成中止
(setq make-backup-files nil)

;; タブの表示幅の指定&タブを使うのを抑止 
(setq-default indent-tabs-mode nil)
;; set indent width as 2 spaces
(setq-default tab-width 2)
(setq js-indent-level 2)
(add-hook 'java-mode-hook'
          (lambda() (setq c-basic-offset 2)))
(add-hook 'sh-mode-hook'
          (lambda() (setq sh-basic-offset 2)))
(add-hook 'typescript-mode-hook'
          (lambda() (setq typescript-indent-level 2)))
(add-hook 'css-mode-hook
          (lambda() (setq css-indent-offset 2)))

;; 行番号を表示
(custom-set-variables
'(global-linum-mode t)
)

; フレームサイズ・位置・色など
(setq initial-frame-alist
       (append (list
;                  '(foreground-color . "white")         ;; 文字色
;                  '(background-color . "#336666")       ;; 背景色
;                 '(border-color . "black")             ;; 挙動が変なのでコメント
                  '(mouse-color . "white")
                  '(cursor-color . "white")
                  '(width . 210)                        ;; フレームの幅
                  '(height . 40)                        ;; フレームの高さ
                  '(top . 0)                           ;; Y 表示位置
                  '(left . 0)                          ;; X 表示位置
                  )
               initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;;scss-mode
(add-to-list 'load-path "~/.emacs.d/scss-mode-master")

(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(defun scss-custom ()
  (setq indent-tabs-mode nil)
  (setq css-indent-offset 2)
  (setq scss-compile-at-save nil)
)

(add-hook 'scss-mode-hook
  '(lambda() (scss-custom)))

;;rhtml mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)

;;auto indent
(add-hook 'lisp-mode-hock '(lambda()
  (local-set-key (kdd "RET") 'newline-and-indent)))

;;window devide
(split-window-horizontally)

;;word-count
(add-to-list 'load-path (expand-file-name "~/.emacs.d/word-count"))
(require 'word-count)

;;Rainbow Delimiters
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisps"))
(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(global-rainbow-delimiters-mode)

;; for clojure
(require 'clojure-mode)
(add-to-list 'exec-path "~/bin")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;; for paredit
(require 'paredit)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'slime-repl-mode-hook 'paredit-mode)
(add-hook 'racket-mode-hook 'paredit-mode)
(add-hook 'racket-repl-mode-hook 'paredit-mode)

;; set alt as meta key
(setq x-alt-keysym 'meta)

;; set cpp for arduino file
(add-to-list 'auto-mode-alist '("\\.ino" . c++-mode))

;; haml mode
(require 'haml-mode)

;; ejs
(add-to-list 'auto-mode-alist '("\\.ejs" . html-mode))

;; pug-mode
(require 'pug-mode)

;; cargo for rust
;(add-to-list 'exec-path (expand-file-name "~/.cargo/bin"))
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; opan FreeCAD macro with python format
(add-to-list 'auto-mode-alist '("\\.FCMacro$" . python-mode))

;; magit shortcut
(global-set-key (kbd "C-x g") 'magit-status)

;; Japanese font setting for ubuntu17.10
(set-fontset-font nil 'japanese-jisx0208 "TakaoPGothic")
(add-to-list 'face-font-rescale-alist '(".*Takao P.*" . 0.9)) ; 日本語を少し小さく

;; company-mode (auto fill)
;; http://company-mode.github.io/
(add-hook 'after-init-hook 'global-company-mode)
(set 'company-dabbrev-downcase nil) ; disable replacing words to lowercase style

;; slime for roswell
(load (expand-file-name "~/.roswell/helper.el"))

;; web-mode config
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-attr-indent-offset nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq indent-tabs-mode nil)
  (setq tab-width 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)
(add-hook 'web-mode-hook 'prettier-js-mode)

;; ctp as web-mode
(add-to-list 'auto-mode-alist '("\\.ctp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))

;; launch as xml-mode for ROS
(add-to-list 'auto-mode-alist '("\\.launch" . xml-mode))
