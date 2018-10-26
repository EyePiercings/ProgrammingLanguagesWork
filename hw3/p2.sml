Control.Print.printDepth := 100;
Control.Print.printLength := 500;
Control.Print.stringDepth := 500;

fun zip [] [] = []
  | zip [] xs = []
  | zip xl [] = []
  | zip (x::xl) (y::[]) = (x, y) :: zip xl (y :: [])
  | zip (x::[]) (y::xs) = (x, y) :: zip (x::[]) xs 
  | zip (x::xl) (y::xs) = (x, y) :: zip xl xs;


zip [1,3,5,7] ["a","b","c","de"];
zip [1,3,5,7] ["a","b"];
zip [1,3,5,7] [];


fun unzip [] = ([],[])
  | unzip ((x,y)::xs) =
    let
	val (a,b) = unzip xs (* Assume unzip xs works and returns two lists that are separated*)
			  (* Takes the two lists that are in the tuple and labels them a and b*)
    in	(* Append the two lists to the first two elements of the lists xs, x and y*)
	(x::a, y::b)                         
    end;
	
unzip [(1,"a"),(3,"b"),(5,"c"),(7,"de")];

fun zip3 [] [] [] = []
  | zip3 xs ys ls =
    let (* use zip twice to make a list of tuples that are pairs (tuple and element)*)
	val rs = zip (zip xs ys) ls
	fun separate [] = []
	  | separate (((c,d),e)::vs) =
	    let
		val fs = separate vs (* as with unzip, assume that separate vs separates all three values into a list of triples *)
	    in (* Append the list of triples to the first element c d e *)
		(c, d, e) :: fs
	    end

    in 
	separate rs
    end;


zip3 [1,3,5,7] ["a","b","c","de"] [1,2,3,4];

(*
(d) You can't write a function zip_any that has that property because
with pattern matching, you need a fixed n in order to know the amount
of variables one would need to keep account of when concatenating in
order to write the program. The function operands would not match the 
function operators as well which ML needs to match in order for the
function to work properly. If the function input is a list of lists 
where we don't know how many lists there are going to be and we're 
returning list of lists, type errors would naturally occur.
*)
