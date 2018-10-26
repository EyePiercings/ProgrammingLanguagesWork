(* (a) *)
fun concatWords (l:string list):string = foldl (fn (x,acc) => acc^x) "" l;

concatWords ["Three", "Short", "Words"];


(* (b) *)
fun words_length (l:string list):int = foldl (fn (x,acc) => acc+size x) 0 l;

words_length ["Three", "Short", "Words"];

(* (c) *)
(* No, we cannot use foldl in place of foldr all of the time but assume we could. Lets have a function f that
concatenates words just like concatWords above. Given an initial value "" and list ["Three", "Short", "Words"],
using foldl gives us "ThreeShortWords" and using foldr gives us "WordsShortThree". The order is in reverse showing,
that foldr has different behavior than foldl since it starts at the end of the list instead of the head.
*)

(* (d) *)
fun count u l = foldl (fn (x,acc) => if (u = x) then acc+1 else acc) 0 l;

count "sheep" ["cow", "sheep", "sheep", "goat"];
count 4 [1,2,3,4,1,2,3,4,1,2,3,4];

(* (e) *)
fun partition x l = foldr (fn (y,(acc1,acc2)) => if (x < y) then (acc1,y::acc2) else  (y::acc1,acc2)) ([],[]) l;

partition 10 [1,4,55,2,44,55,22,1,3,3];

(* (f) *)
fun poly l x = foldr (fn (a,acc) => a+(x*acc)) 0.0 l;

val g = poly [1.0, 2.0];
g(3.0);
val f = poly [1.0, 2.0, 3.0];
f(2.0);
