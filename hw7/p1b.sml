val callcc = SMLofNJ.Cont.callcc;
val throw = SMLofNJ.Cont.throw;

fun bubble_inner [] k = throw k []
  | bubble_inner [a] k = throw k [a]
  | bubble_inner (a::b::xs) k = if b < a then b::(callcc(bubble_inner (a::xs))) else a::(callcc(bubble_inner (b::xs)));

(*
fun bubble_outer [] k = k []
| bubble_outer (x::xs) k = bubble_outer xs (fn y => (callcc(bubble_inner (k(x::y)))));
*)

fun bubble_outer [] k = throw k []
  | bubble_outer (x::xs) k = callcc(bubble_inner (x::(callcc(bubble_outer xs))));

fun bubblesort xs = callcc(bubble_outer xs);

val xs = [3,7,1,0,0,45,1001,2,~100];
bubblesort xs;

(* 
(c)
One reason we may want to use continuation styple passing is because it makes control flow explicit.

(d)
Because all CPS style functions are tail recursive, meaning that they can often be automatically optimized by the compiler, so evaluation takes constant space.
*)
