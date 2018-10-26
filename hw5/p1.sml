fun Cond(test, trueCase, falseCase) = if test then trueCase else falseCase;

(* (a) *) fun f x = Cond(x>0, x, x div 0);
(* (b) *) fun g x = if x>0 then x else x div 0;

g 2;
f 2;
