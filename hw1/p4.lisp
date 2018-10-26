(defun censor-word (word)
  (cond ((eq (member word '(extension algorithms graphics AI midterm)) nil) nil)
  (t t)))

(censor-word 'wow)
(censor-word 'algorithms)


(defun censor (list)
  (mapcar #'(lambda (x) (cond ((eq (censor-word x) t) 'XXXX)
			    (t x))) list))

(censor '(weow what a day I wish I did algorithms))
(censor '(algorithm))
