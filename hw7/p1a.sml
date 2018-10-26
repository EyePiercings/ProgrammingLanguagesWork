(*
fun bubble_inner [] = []
  | bubble_inner [a] = [a]
  | bubble_inner (a::b::xs) =
    if b < a then b::(bubble_inner(a::xs)) else a::(bubble_inner(b::xs));
*)

fun bubble_inner [] k = k []
  | bubble_inner [a] k = k [a]
  | bubble_inner (a::b::xs) k = if b < a then bubble_inner (a::xs) (fn y => k(b::y)) else bubble_inner (b::xs) (fn z => k(a::z));
(*
fun bubble_outer [] = []
  | bubble_outer (x::xs) = bubble_inner (x::(bubble_outer xs)) (fn x => x);
*)

fun bubble_outer [] k = k []
| bubble_outer (x::xs) k = bubble_outer xs (fn y => (bubble_inner (k(x::y)) (fn x => x)));

fun bubblesort xs = bubble_outer xs (fn x => x);

val xs = [3,7,1,0,0,45,1001,2,~100];
bubblesort xs;
