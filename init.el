(cond (window-system
(setq x-select-enable-clipboard t)
))

;; backup file 作成中止
(setq make-backup-files nil)

;; タブの表示幅の指定&タブを使うのを抑止 
(setq-default indent-tabs-mode nil)

;; set indent width as 2 spaces
(setq-default tab-width 2)
;;(setq indent-line-function 'insert-tab)
(setq js-indent-level 2)
(add-hook 'java-mode-hook' (lambda()
                             (setq c-basic-offset 2)))

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

;;yasnipet
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/yasnippet"))
(require 'yasnippet)
(yas-global-mode 1)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")
(yas/load-directory "~/.emacs.d/snippets/yasnippets-rails")

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

;;auto-complete
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-complete"))
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
;;(ac-config-default)

