; this is the helper function for fastexp
(defun square (x) (* x x))

#|
Note: All logs are in base 2.

Theorem: For e >= 1, a call to (fastexp b e) will take at most 2log(e) multiplication operations.

Base Case (e = 1): Because  e equals 1, we do not multiply at all in our function and just return b, the base. log(1) = 0.

Induction Hypothesis: Assume the theorem holds for all k <= e. 

Inductive step: Prove (fastexp b e+1) takes at most log(e+1) multiplication operations.
(fastexp b e+1) -->

(if (e+1) is even): We would get +1 multiplations and run (fastexp b (/ (+ e 1) 2)) where the value e is now (e+1)/2. The exponent 
(e+1)/2 is less than e and therefore is k. Now we have it in the form 1 + 2log(e/2).
Reducing it further...
log(2) + 2log(e/2)
log(2) + log((e^2)/4)
log((e^2)/2)
2log(e/sqrt(2))
Hence, it should take 2log(e/sqrt(2)) multiplications which is less than 2log(e+1).

(if (e+1) is odd): We would get +1 multiplications and run (fastexp b (- e 1)) which is equal to (fastexp b e). Since we know from our
induction hypothesis that (fastexp b e) takes 2log(e) multiplications, then the number of multiplications now takes the form 1 + 2log(e).
From the even case, we can substitute 2log(e) with 1 + 2log(e/2) thus making the expression, 1 + 1 + 2log(e/2) = 2 + 2log(e/2). 
Reducing it further...
log(4) + 2log(e/2)
log(4) + log((e^2)/4)
log(e^2)
2log(e)
Hence, it should take 2log(e) operations which is less than 2log(e+1).

Therefore, for e >= 1, a call to (fastexp b e) will take at most 2log(e) multiplication operations.
|#

(defun fastexp (b e)
  (cond ((eq e 1) b) ;0 mult
	((eq 0 (mod e 2)) (square (fastexp b (/ e 2)))) ;1 mult
	       (t (* b (fastexp b (- e 1)))))); 1 mult



(fastexp 2 2)
(fastexp 2 3)
(fastexp 2 4)
(fastexp 5 7)

(defun superfastexp (b e)
  (cond ((eq e 1) b) ;0 mult
	((eq 0 (mod e 2)) (square (fastexp b (/ e 2)))) ;1 mult
	       (t (* b (square (fastexp b (/ (- e 1) 2))))))) ;2 mult but saves a mult by doing the even operation in it so actually 1
