(defun rev (x)
  (cond ((eq (listp x) nil) x) ;if x isn't a list (an atom), return x
	((eq (cdr x) nil) x) ;if cdr(x) is nil (end of list) return x
	(t (append (rev(cdr x )) (cons (car x) nil))))) ;recursively reverse values

(rev '(1 2 3))

