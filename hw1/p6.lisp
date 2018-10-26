(defun deep-rev (x)
  (cond ((eq x nil) nil)
        ((eq (listp x) nil) x)
	((eq (cdr x) nil)
	 (cond
	  ((eq (listp (car x)) t) (cons (deep-rev (car x)) nil))
	  (t x)))
	(t (append (deep-rev(cdr x)) (cons (deep-rev (car x)) nil)))))

(deep-rev '(1 2 ((3 4) 5)))
(deep-rev '(1 2 3 (3 4 5)))
(deep-rev '(A (B C) D))
(deep-rev nil)
(deep-rev 'A)
