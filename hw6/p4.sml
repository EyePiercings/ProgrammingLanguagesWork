datatype Five =
	   VarF  of int
	 | Add   of Five * Five
	 | Sub   of Five * Five
	 | Times of Five * Five
	 | Div   of Five * Five;

datatype intlist = nil | (int * intList);


(*Build functions*)

fun buildF() = VarF;
fun buildAdd(f1,f2) = Add(f1,f2);
fun buildSub(f1,f2) = Sub(f1,f2);
fun buildTimes(f1,f2) = Times(f1,f2);
fun buildDiv(f1,f2) = Div(f1,f2);

(* eval: Five -> int*int -> int *)

fun eval (f:Five)(x:int,y:int) =
  case f of
      VarF => 5
    | Add(f1,f2) => eval (f1) (x,y) + eval (f2) (x,y)
    | Sub(f1,f2) => eval (f1) (x,y) - eval (f2) (x,y)
    | Times(f1,f2) => eval (f1) (x,y) * eval (f2) (x,y)
    | Div(f1,f2) =>  eval (f1) (x,y) div eval (f2) (x,y) handle div => ~1;

(* for: int * int * (int -> unit) -> unit
   Applies the function f to all the integers between high and low
   inclusive; the results get thrown away.
 *)
fun for (high,low,f) =
  let
      val i = ref high
  in      
      while (!i => low) do
	    (
	      f (!i);
	      i := !i - 1
	    );
      ()
  end;

fun combo n 0 = 1
  | combo n 1 = 1
  | combo n r = combo (n-1) (r-1) + combo (n-1) r;

(* fiveBuilder:
   Builds an expression tree.
*)
(* Our plan for a was to enter in a list [5,5,5,5,5] and use a while loop to systematically change which operation we were using (1-4) and recursively call fiveBuilder on the remaining 5's in the list to try and build a comprehensive list of the different operations, but we got confused about how to implement this... This challenge problem beat us :( *)
fun fiveBuilder (int:fiveNum, []) =
  let
      val n = (fiveNum-1) ^ (fiveNum-1)
      fun pickFive _ f1::nil = f1
	| pickFive 1 f1::f2 = buildAdd(f1,f2)
	| pickFive 2 f1::f2 = buildSub(f1,f2)
	| pickFive 3 f1::f2 = buildTimes(f1,f2)
	| pickFive 4 f1::f2 = buildDiv(f1, fiveBuilder 1 f2)
  in
      			  
  end
      
(************** Add Testing Code Here ***************)
