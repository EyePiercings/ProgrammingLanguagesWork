(defun merge-list (l1 l2)
  (cond ((and (eq nil l1) (eq nil l2)) nil) ;if both lists are empty, return nil
	((eq nil l1) l2) ;if l1 is empty, return l2
	((eq nil l2) l1) ;if l2 is empty, return l1
	(t (cons (car l1) (cons (car l2) (merge-list (cdr l1) (cdr l2))))))) ;merge recursively


(merge-list '(A B C) '(1 2 3 4 5))
