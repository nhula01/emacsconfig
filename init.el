
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;;install use-package
;;download usepackage first
;e(add-to-list 'load-path "~/src/org-mode/lisp")
;
;(straight-use-package 'org)


;; download auctex
(use-package auctex
  :ensure t
  :hook
  (LaTex-mode) .
  (lambda ()
    (push (list 'output-pdf "Zathura")
	  TeX-view-program-selection)))


;;download latex on terminal and latex-dvi preview on emacs
;; let preview in latex cc cx cl
(setq org-preview-latex-default-process 'dvisvgm)

;; add reference at start

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
;;download yas and yas-snipe -> snippets file
;; make sure yasnippet is installed
(add-to-list 'load-path
              "~/.emacs.d/packages/yasnippet")
(require 'yasnippet)


;;install yasnippets

;;;install snippets collection located in elpa for all common modes
;;;found here: https://github.com/AndreaCrotti/yasnippet-snippets/tree/master/snippets/latex-mode

;;now we add our personal yasnippets

;;when we define a new snippet
(setq yas-snippet-dirs
      '("/home/phihungnguyen/.emacs.d/snippets"                 ;; personal snippet
 	))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

(yas-define-snippets 'text-mode
  '(("email" "`user-mail-address`" "User's email address")
    ("time" "`(current-time-string)`" "Current Time")
    ("foo" "blablablabla")))

(yas-define-snippets 'org-mode 
  '(("email" "`user-mail-address`" "User's email address")
    ("time" "`(current-time-string)`" "Current Time")
    ("foo" "blablablabla")
    ("=>" "\\implies" "implies")
    ("=<" "\\impliedby" "implied by")
    ("Iff" "\\iff")
    ("beg"
     "\\begin{$1}
	$0
\\end{$1}")
    ("..." "\
\ldots")
    ("table" "\\begin{table}[${1:htpb}]
	\\centering
	\\caption{${2:caption}}
	\\label{tab:${3:label}}
	\\begin{tabular}{${5:c}}
	\\end{tabular}
\\end{table}")
    ("enum"
"\begin{enumerate}
	\item $0
\end{enumerate}")
    ("item" "\\begin{itemize}\n\t\\item $0\n\\end{itemize}" "Itemize")
    ("it" "\\item[$1)] \n $2")
    ("proof" "\\begin{proof} \n \t
$0
 \\end{proof}")
    ("desc" "\\begin{description}\n\t\\item[${1}] $0\n\\end{description}" "Description")
    ("pac" "\\usepackage[${1:options}]{${2:package}}$0" "Package")
    ("ali" "\\begin{align*}\n\t${1:${VISUAL}}\n\\end{align*}" "Align")
    ("/" "\\frac{${1:numerator}}{${2:denominator}}$0" "Fraction")
    ("==" "&= ${1:\\$2} \\\\" "Equals")
    ("!=" "\\neq " "Not Equals")
    ("ceil" "\\left\\lceil $1 \\right\\rceil $0" "Ceiling")
    ("floor" "\\left\\lfloor $1 \\right\\rfloor$0" "Floor")
    ("pmat" "\\begin{pmatrix}\n $1 \n \\end{pmatrix} $0" "Matrix (pmatrix)")
    ("bmat" "\\begin{bmatrix} \n  $1\n  \\end{bmatrix} $0" "Matrix (bmatrix)")
    ("()" "\\left( ${1:${VISUAL}} \\right) $0" "Left and Right Parentheses1")
    ("lr(" "\\left( ${1:${VISUAL}} \\right) $0" "Left and Right Parentheses2")
    ("lr|" "\\left| ${1:${VISUAL}} \\right| $0" "Left and Right Absolute Value")
    ("lr{" "\\left\\{ ${1:${VISUAL}} \\right\\} $0" "Left and Right Curly Braces")
    ("lrb" "\\left\\{ ${1:${VISUAL}} \\right\\} $0" "Left and Right Braces")
    ("lr[" "\\left[ ${1:${VISUAL}} \\right] $0" "Left and Right Square Brackets")
    ("lra" "\\left<${1:${VISUAL}} \\right>$0" "Left and Right Angle Brackets")
    ("conj" "\\{$1}^\\dagger$0" "Conjugate")
    ("sum" "\\sum_{n=${1:1}}^{${2:\\infty}} ${3:a_n z^n}" "Summation")
    ("qsum" "\\sum_{${1:x} ${2:\\in} {0,1}^{$3}} ${4:
}")
    ("taylor" "\\sum_{${1:k}=${2:0}}^{${3:\\infty}} ${4:c_$1} (x-a)^$1 $0" "Taylor Series")
    ("lim" "\\lim_{${1:n} \\to ${2:\\infty}} " "Limit")
    ("limsup" "\\limsup_{${1:n} \\to ${2:\\infty}} " "Limit Superior")
    ("prod" "\\prod_{${1:n=${2:1}}}^{${3:\\infty}} ${4:${VISUAL}} $0" "Product")
    ("part" "\\frac{\\partial ${1:V}}{\\partial ${2:x}} $0" "Partial Derivative")
    ("sq" "\\sqrt{${1:${VISUAL}}} $0" "Square Roo
t")
    ("sr" "$1^2$0" "Square")
    ("cb" "^3" "Cube")
    ("td" "^{$1}$0" "To the Power")
    ("rd" "^{($1)}$0" "To the Power (with parentheses)")
    ("__" "_{$1}$0" "Subscript")
    ("ooo" "\\infty" "Infinity")
    ("<= " "\\le " "Less than or equal to")
    (">= " "\\ge " "Greater than or equal to")
    ("EE" "\\exists " "Existential Quantifier")
    ("AA" "\\forall " "Universal Quantifier")
    ("xnn" "x_{n}" "Subscript x_n")
    ("ynn" "y_{n}" "Subscript y_n")
    ("xii" "x_{i}" "Subscript x_i")
    ("yii" "y_{i}" "Subscript y_i")
    ("xjj" "x_{j}" "Subscript x_j")
    ("yjj" "y_{j}" "Subscript y_j")
    ("xp1" "x_{n+1}" "Subscript x_{n+1}")
    ("xmm" "x_{m}" "Subscript x_{m}")
    ("mcal" "\\mathcal{$1}$0" "Mathcal")
    ("lll" "\\ell" "Script L (ell)")
    ("nabl" "\\nabla " "Nabla")
    ("xx" "\\times " "Cross (times)")
    ("**" "\\cdot " "Centered Dot (cdot)")
    ("norm" "\\|${1:${VISUAL}}\\|$0" "Norm")
    ("dint" "\\int_{${1:-\\infty}}^{${2:\\infty}} ${3:${VISUAL}} $0" "Definite Integral")
    ("->" "\\to " "To")
    ("<->" "\\leftrightarrow " "Left-Right Arrow")
    ("!>" "\\mapsto " "Mapsto")
    ("invs" "^{-1}" "Inverse")
    ("compl" "^{c}" "Complement")
    ("\\\\" "\\setminus" "Setminus")
    (">>" "\\gg" "Much Greater Than")
    ("<<" "\\ll" "Much Less Than")
    ("~~" "\\sim " "Similar To")
    ("set" "\\{${1:${VISUAL}}\\} $0" "Set")
    ("||" " \\mid " "Mid")
    ("cc" "\\subset " "Subset")
    ("notin" "\\not\\in " "Not In")
    ("inn" "\\in " "In")
    ("NN" "\\N " "Set of Natural Numbers")
    ("Nn" "\\cap " "Intersection")
    ("UU" "\\cup " "Union")
    ("uuu"
     "\\bigcup_{${1:i \\in ${2:I}}} $0" "Big Union")
    ("nnn" "\\bigcap_{${1:i \\in ${2:I}}} $0" "Big Intersection")
    ("iden" "\\mathbf{I}")
    ("ket" "\\ensuremath{\\left| ${1:\\psi} \\right\\rangle}$0")
    ("k" "\\ket{${1:\\psi}}$0")
    ("b" "\\bra{${1:\\phi}}$0
")
    ("bra" "\\ensuremath{\\left\\langle ${1:\\phi} \\right|}$0")
    ("braket" "\\ensuremath{\\left\\langle ${1:\\phi} | ${2:\\psi} \\right\\rangle}$0")
    ("bk" "\\braket{${1:\\psi}}{${2:\\phi}}$0")
    ("ts" "\\otimes" "Tensor")
 ))


(yas-define-snippets 'LaTeX-mode 
  '(("email" "`user-mail-address`" "User's email address")
    ("time" "`(current-time-string)`" "Current Time")
    ("foo" "blablablabla")
    ("=>" "\\implies" "implies")
    ("=<" "\\impliedby" "implied by")
    ("iff" "\\iff")
    ("beg"
     "\\begin{$1}
	$0
\\end{$1}")
    ("..." "\
\ldots")
    ("table" "\\begin{table}[${1:htpb}]
	\\centering
	\\caption{${2:caption}}
	\\label{tab:${3:label}}
	\\begin{tabular}{${5:c}}
	\\end{tabular}
\\end{table}")
    ("enum"
"\begin{enumerate}
	\item $0
\end{enumerate}")
    ("item" "\\begin{itemize}\n\t\\item $0\n\\end{itemize}" "Itemize")
    ("it" "\\item[$1)] \n $2")
    ("proof" "\\begin{proof} \n \t
$0
 \\end{proof}")
    ("desc" "\\begin{description}\n\t\\item[${1}] $0\n\\end{description}" "Description")
    ("pac" "\\usepackage[${1:options}]{${2:package}}$0" "Package")
    ("ali" "\\begin{align*}\n\t${1:${VISUAL}}\n\\end{align*}" "Align")
    ("/" "\\frac{${1:numerator}}{${2:denominator}}$0" "Fraction")
    ("==" "&= ${1:\\$2} \\\\" "Equals")
    ("!=" "\\neq " "Not Equals")
    ("ceil" "\\left\\lceil $1 \\right\\rceil $0" "Ceiling")
    ("floor" "\\left\\lfloor $1 \\right\\rfloor$0" "Floor")
    ("pmat" "\\begin{pmatrix}\n $1 \n \\end{pmatrix} $0" "Matrix (pmatrix)")
    ("bmat" "\\begin{bmatrix} \n  $1\n  \\end{bmatrix} $0" "Matrix (bmatrix)")
    ("()" "\\left( ${1:${VISUAL}} \\right) $0" "Left and Right Parentheses1")
    ("lr(" "\\left( ${1:${VISUAL}} \\right) $0" "Left and Right Parentheses2")
    ("lr|" "\\left| ${1:${VISUAL}} \\right| $0" "Left and Right Absolute Value")
    ("lr{" "\\left\\{ ${1:${VISUAL}} \\right\\} $0" "Left and Right Curly Braces")
    ("lrb" "\\left\\{ ${1:${VISUAL}} \\right\\} $0" "Left and Right Braces")
    ("lr[" "\\left[ ${1:${VISUAL}} \\right] $0" "Left and Right Square Brackets")
    ("lra" "\\left<${1:${VISUAL}} \\right>$0" "Left and Right Angle Brackets")
    ("conj" "\\{$1}^\\dagger$0" "Conjugate")
    ("sum" "\\sum_{n=${1:1}}^{${2:\\infty}} ${3:a_n z^n}" "Summation")
    ("qsum" "\\sum_{${1:x} ${2:\\in} {0,1}^{$3}} ${4:
}")
    ("taylor" "\\sum_{${1:k}=${2:0}}^{${3:\\infty}} ${4:c_$1} (x-a)^$1 $0" "Taylor Series")
    ("lim" "\\lim_{${1:n} \\to ${2:\\infty}} " "Limit")
    ("limsup" "\\limsup_{${1:n} \\to ${2:\\infty}} " "Limit Superior")
    ("prod" "\\prod_{${1:n=${2:1}}}^{${3:\\infty}} ${4:${VISUAL}} $0" "Product")
    ("part" "\\frac{\\partial ${1:V}}{\\partial ${2:x}} $0" "Partial Derivative")
    ("sq" "\\sqrt{${1:${VISUAL}}} $0" "Square Roo
t")
    ("sr" "$1^2$0" "Square")
    ("cb" "^3" "Cube")
    ("td" "^{$1}$0" "To the Power")
    ("rd" "^{($1)}$0" "To the Power (with parentheses)")
    ("__" "_{$1}$0" "Subscript")
    ("ooo" "\\infty" "Infinity")
    ("<= " "\\le " "Less than or equal to")
    (">= " "\\ge " "Greater than or equal to")
    ("EE" "\\exists " "Existential Quantifier")
    ("AA" "\\forall " "Universal Quantifier")
    ("xnn" "x_{n}" "Subscript x_n")
    ("ynn" "y_{n}" "Subscript y_n")
    ("xii" "x_{i}" "Subscript x_i")
    ("yii" "y_{i}" "Subscript y_i")
    ("xjj" "x_{j}" "Subscript x_j")
    ("yjj" "y_{j}" "Subscript y_j")
    ("xp1" "x_{n+1}" "Subscript x_{n+1}")
    ("xmm" "x_{m}" "Subscript x_{m}")
    ("mcal" "\\mathcal{$1}$0" "Mathcal")
    ("lll" "\\ell" "Script L (ell)")
    ("nabl" "\\nabla " "Nabla")
    ("xx" "\\times " "Cross (times)")
    ("**" "\\cdot " "Centered Dot (cdot)")
    ("norm" "\\|${1:${VISUAL}}\\|$0" "Norm")
    ("dint" "\\int_{${1:-\\infty}}^{${2:\\infty}} ${3:${VISUAL}} $0" "Definite Integral")
    ("->" "\\to " "To")
    ("<->" "\\leftrightarrow " "Left-Right Arrow")
    ("!>" "\\mapsto " "Mapsto")
    ("invs" "^{-1}" "Inverse")
    ("compl" "^{c}" "Complement")
    ("\\\\" "\\setminus" "Setminus")
    (">>" "\\gg" "Much Greater Than")
    ("<<" "\\ll" "Much Less Than")
    ("~~" "\\sim " "Similar To")
    ("set" "\\{${1:${VISUAL}}\\} $0" "Set")
    ("||" " \\mid " "Mid")
    ("cc" "\\subset " "Subset")
    ("notin" "\\not\\in " "Not In")
    ("inn" "\\in " "In")
    ("NN" "\\N " "Set of Natural Numbers")
    ("Nn" "\\cap " "Intersection")
    ("UU" "\\cup " "Union")
    ("uuu"
     "\\bigcup_{${1:i \\in ${2:I}}} $0" "Big Union")
    ("nnn" "\\bigcap_{${1:i \\in ${2:I}}} $0" "Big Intersection")
    ("iden" "\\mathbf{I}")
    ("ket" "\\ensuremath{\\left| ${1:\\psi} \\right\\rangle}$0")
    ("k" "\\ket{${1:\\psi}}$0")
    ("b" "\\bra{${1:\\phi}}$0
")
    ("bra" "\\ensuremath{\\left\\langle ${1:\\phi} \\right|}$0")
    ("braket" "\\ensuremath{\\left\\langle ${1:\\phi} | ${2:\\psi} \\right\\rangle}$0")
    ("bk" "\\braket{${1:\\psi}}{${2:\\phi}}$0")
    ("ts" "\\otimes" "Tensor")
 ))

;;;load yasnippet-snippets

(require 'yasnippet)

(defconst yasnippet-snippets-dir
  (expand-file-name
   "/home/phihungnguyen/.emacs.d/elpa/yasnippet-snippets-20240221.1621/snippets/"
   (file-name-directory 
    ;; Copied from ‘f-this-file’ from f.el.
    (cond
     (load-in-progress load-file-name)
     ((and (boundp 'byte-compile-current-file) byte-compile-current-file)
      byte-compile-current-file)
     (:else (buffer-file-name))))))

;;;###autoload
(defun yasnippet-snippets-initialize ()
  "Load the `yasnippet-snippets' snippets directory."
  ;; NOTE: we add the symbol `yasnippet-snippets-dir' rather than its
  ;; value, so that yasnippet will automatically find the directory
  ;; after this package is updated (i.e., moves directory).
  (unless (member 'yasnippet-snippets-dir yas-snippet-dirs)
    (add-to-list 'yas-snippet-dirs 'yasnippet-snippets-dir t)
    (yas--load-snippet-dirs)))

(defgroup yasnippet-snippets nil
  "Options for yasnippet setups.

This is useful for customizing options declared in
“.yas-setup.el” files.  For example, you could declare a
customizable variable used for a snippet expansion.

See Info node `(elisp)Customization Types'."
  :group 'yasnippet)

(defun yasnippet-snippets--no-indent ()
  "Set `yas-indent-line' to nil."
  (set (make-local-variable 'yas-indent-line) nil))

;;;###autoload
(eval-after-load 'yasnippet
   '(yasnippet-snippets-initialize))


(provide 'yasnippet-snippets)

;;; yasnippet-snippets.el ends here


;;custom theme
(set-frame-parameter (selected-frame) 'alpha '(80 80))

(add-to-list 'default-frame-alist '(alpha 80 80))

(set-face-attribute 'default nil :background "black"
		    :foreground "white" :height 160)
;;dowloand icons
(use-package all-the-icons
  :ensure t)
;;update dashboard
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-startup-banner "/home/phihungnguyen/emacssync/image3.png")
    (setq dashboard-banner-logo-title "My Workflow")
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-items '((recents . 5)
			    (projects . 5))))
  :config
  (dashboard-setup-startup-hook)
 )


(setq next-line-add-newlines t)


;;;install org mode
;;download c compiler first download" msys2 package
;;https://www.orgroam.com/manual.html#C-Compiler-for-Windows add the path

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t) ;;ignoree warning
  :custom
  (org-roam-completion-everywhere t) ;;finish linking fast
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n l" . org-roam-buffer-toggle)
         :map org-mode-map
	 ("C-c a p" . completion-at-point))
  :config
  (org-roam-setup))

;;set the roam folder
(setq org-roam-directory (file-truename "/home/phihungnguyen/quartz/content/"))
;;file head leads me to the diretory where the org roam files are created
;;hugo base + content + section for where to be saved
;;if i create a file here
(setq org-roam-capture-templates
      '(("o" "moc" plain
         "\n*Link*:  %?\n\n"
         :if-new (file+head "/home/phihungnguyen/quartz/content/${slug}.org" "#+title: ${title}\n#+filetags: :moc: \n#+hugo_base_dir: /home/phihungnguyen/quartz \n#+hugo_section: notes\n#+date: %u\n#+hugo_lastmod: %u\n#+hugo_tags: noexport\n")
         :immediate-finish t
         :unnarrowed t
         :empty-lines-after 1)))
;;set the autosync
(org-roam-db-autosync-mode) ;;available at the start

;;set  end and begin of buffer

(global-set-key (kbd "ESC .") 'end-of-buffer)
(global-set-key (kbd "ESC ,") 'beginning-of-buffer)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(preview-dvisvgm latex-math-preview org-roam-ql org-roam-ui org-download ox-hugo all-the-icons dashboard which-key-posframe which-key yasnippet-snippets yasnippet-classic-snippets use-package org-roam-bibtex emacsql-sqlite-module emacsql-sqlite auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;install hugo
(with-eval-after-load 'ox
  (require 'ox-hugo))



;https://hugocisneros.com/blog/my-org-roam-notes-workflow/
;https://medium.com/@magstherdev/github-pages-hugo-86ae6bcbadd#:~:text=Publish%20your%20blog%20to%20GitHub%20Pages&text=To%20do%20that%2C%20we%20need,them%20to%20the%20GitHub%20repository.

; view interactions here: http://127.0.0.1:35901/ with https://github.com/org-roam/org-roam-ui

;; org-roam-ui-mode


;;hugo 







