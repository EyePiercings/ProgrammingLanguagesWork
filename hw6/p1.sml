(* (a) *)
exception DotProd;

fun prod [] [] acc = acc
  | prod (x::xs) (y::ys) acc = if (List.length xs - List.length ys) = 0 then prod xs ys (acc + x * y) else raise DotProd;

fun dotprod [] [] = 0
  | dotprod xs ys = prod xs ys 0;

dotprod [1,2,3] [~1,5,3];
dotprod [] [];

(* (b) *)

fun fibtail 1 acc1 acc2 = acc2
  | fibtail x acc1 acc2 = fibtail (x-1) acc2 (acc1+acc2);

fun fast_fib 0 = 0
  | fast_fib 1 = 1
  | fast_fib x = fibtail x 0 1;
					
fast_fib 0;
fast_fib 1;
fast_fib 5;
fast_fib 10;
