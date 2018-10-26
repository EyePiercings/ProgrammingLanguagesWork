; bst of form (v l r) = (value left_tree right_tree)
(defun bst (v l r) (cons v (cons l (cons r nil))))
(defun get_v (tree) (car tree)) ;value/root
(defun get_l (tree) (car (cdr tree))) ;left_tree
(defun get_r (tree) (car (cdr (cdr tree)))) ;right_tree

(defun insert (tree v)
  (cond
   ((eq tree nil) (bst v nil nil))
   ((< v (get_v tree)) (bst (get_v tree) (insert (get_l tree) v) (get_r tree)))
   (t (bst (get_v tree) (get_l tree) (insert (get_r tree) v)))
   ))

(defun lookup (tree v)
  (cond
   ((eq tree nil) nil)
   ((eq v (get_v tree)) t)
   ((< v (get_v tree)) (lookup (get_l tree) v))
   (t (lookup (get_r tree) v))
   ))

#|
(B) Every recursive call of insert creates three cons cells because
exactly one call of bst is made during insert, and bst creates three 
cons cells. Inserting in a tree of depth n takes log(n) calls of 
insert, and thereby 3log(n) cons cells.
(C) No, because while replacd can replace an empty subtree with the value
nil, we would still need to call the bst function to create another subtree
for the new insertion. The number of cons cells would not change at all.
|#

