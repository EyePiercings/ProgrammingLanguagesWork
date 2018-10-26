(defvar grades '((Riley (90.0 33.3))
		   (Jessie (100.0 85.0 97.0))
		   (Quinn (70.0 100.0))))
;sums up a list x
(defun summer (x)
  (cond ((eq x nil) 0)
	(t (+ (car x) (summer (cdr x))))))

;returns the average of a student's grades
(defun student-avg (x)
  (/ (summer x) (list-length x)))

;returns grades for a specific student
(defun lookup (name g)
  (cond ((eq g nil) nil)
	((eq name (car (car g))) (car (cdr (car g))))
	(t (lookup name (cdr g)))))

;returns the list of student average scores
(defun averages (g)
  (mapcar #'(lambda (x) (cons (car x) (cons (student-avg (car (cdr x))) nil))) g)
  )

;takes two student/average lists as parameters and returns true if a < b and nil otherwise
(defun compare-students (a b)
  (cond ((< (car (cdr a)) (car (cdr b))) t) (t nil))
  )

(sort (averages grades) #'compare-students)
