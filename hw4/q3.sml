(* (a) *)

(* Curry *)
fun Curry(f) = fn g => fn h => f(g,h);

(* Uncurry *)
fun UnCurry(f) = fn (g,h) => f g h;

					    
		      
