; -*- coding: utf-8 -*-

; Définitions des fonctions
; count-occurences
(defun count-occurences (string)
  "Counts the number of occurences of STRING in the buffer."
  (interactive (list (read-string "Count: ")))
  (let ((point (point))
	(counter 0))
    (beginning-of-buffer)
    (loop with pos = t
	  until (not (search-forward string (point-max) t))
	  do (incf counter))
    (goto-char point)
    (message (format "%d occurences" counter))
    counter))
; line-empty?
(defun line-empty? ()
  "Returns true if the current line is empty."
  (eq (line-beginning-position) (line-end-position)))

					; unfill-region
(defun unfill-region (min max)
  "Joins the lines in the paragraphs inside a
region defined by MIN and MAX. If this is called
interactively then the mark and point are used to
define the region."
  (interactive (list (mark)
		     (point)))
  (if (> min max)
      (let ((temp min))
	(setq min max)
	(setq max temp)))
  (goto-char min)
  (message (format "%d %d" min max))
  (let ((empty nil))
    (message "Unfilling...")
    (loop with end = min
	  always (< end max)
	  do
	  (setq end (line-end-position))
	  (setq empty (line-empty?))
	  (next-line 1)
	  (if (not empty)
	      (if (not (line-empty?))
		  (join-line))))
    (message "Unfilled")))

; unfill-buffer
(defun unfill-buffer ()
  "Joins the lines of all the paragraphs of a buffer."
  (interactive)
  (let ((point (point)))
    (unfill-region (point-min) (point-max))
    (goto-char point)))

; insert-path-here
(defun insert-path-here (arg)
  "Insert a string giving the relative path of a file. With argument, give absolute path."
  (interactive "P")
  (let ((path (read-file-name "Please select a file : "
                              (file-name-directory (buffer-file-name)))))
    (insert (if arg path (file-relative-name path)))))

; kill-to-beginning-of-line
(defun kill-to-beginning-of-line ()
  "Same as \\[universal-argument] 0 \\[kill-line]."
  (interactive "*")
  (kill-line 0))

; comment-or-uncomment-line
(defun comment-or-uncomment-line (&optional lines)
  "Comment current line. Argument gives the number of lines
forward to comment"
  (interactive "P")
  (comment-or-uncomment-region
   (line-beginning-position)
   (line-end-position lines)))

(defun comment-or-uncomment-region-or-line (&optional lines)
  "If the line or region is not a comment, comments region
if mark is active, line otherwise. If the line or region
is a comment, uncomment."
  (interactive "P")
  (if mark-active
      (if (< (mark) (point))
	  (comment-or-uncomment-region (mark) (point))
	(comment-or-uncomment-region (point) (mark))
	)
    (comment-or-uncomment-line lines)))

(defun scroll-up-one-line ()
  "Scroll one line up"
  (interactive)
  (scroll-up 1))

(defun scroll-down-one-line ()
  "Scroll one line down"
  (interactive)
  (scroll-down 1))

(defun ispell-check ()
  "Check region or buffer"
  (interactive)
  (if mark-active
      (if (< (mark) (point))
	    (ispell-region (mark) (point))
	(ispell-region (point) (mark)))
    (ispell-buffer)))

(defun newline-and-indent-end-of-line ()
  "Create a new line from anywhere on the current line."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun insert-char-opening-closing (open &optional close)
  "Insert character open and character close and go between them
if there is a space after the point. If there is any other
character after the point, only insert the opening. If close is
not set then open is used instead of close."
  (interactive)
  (cond ((string-match (concat "[\t \n]")
		       (char-to-string (following-char)))
	 (insert open)
	 (if close
	     (insert close)
	   (insert open))
	 (backward-char 1))
	(t (insert open))))

(defun insert-braces ()
  "insert curly braces and go between them"
  (interactive)
  (insert-char-opening-closing "{" "}"))

(defun insert-quotes ()
  "insert quotes and go between them"
  (interactive)
  (insert-char-opening-closing "\""))

(defun insert-parentheses ()
  "insert parentheses and go between them"
  (interactive)
  (insert-char-opening-closing "(" ")"))

(defun insert-brackets ()
  "insert brackets and go between them"
  (interactive)
  (insert-char-opening-closing "[" "]"))

(defun make (directory)
  "Invoke make"
  (interactive "DRun 'make' in directory: ")
  (compile (format "make -C %s" directory)))

(defun make-clean (directory)
  "Invoke make clean"
  (interactive "DRun 'make clean' in directory: ")
  (compile (format "make -C %s clean" directory)))

(defun compilation-close-if-no-error (buf str)
  "Closes the compilation buffer if no error occured during compilation"
  (if (string-match "exited abnormally" str)
      ;;there were errors
      (message "Errors during compilation, press C-x ` to visit")
    ;;no errors, make the compilation window go away in 0.5 seconds
    (run-at-time 0.5 nil 'delete-windows-on buf)
    (message "No compilation error.")))

(defun select-next-window ()
  "Select the next window."
  (interactive)
  (other-window 1))

(defun select-previous-window ()
  "Select the previous window."
  (interactive)
  (other-window -1))

;; end of fonction definition

