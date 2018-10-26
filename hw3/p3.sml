Control.Print.printDepth := 100;
Control.Print.printLength := 500;
Control.Print.stringDepth := 500;

fun find (n, []) = ~1
  | find (n, (x::xs)) = if x = n then 0 else (* Now we check for the case that x != n *)
    let
	val a = find (n, xs) (* Assume find returns the correct index *)
    in
	if a = ~1 then ~1 else a+1 (* If the value returned by a is -1, we've reached the end of the list without finding n*)
				     (* else we add one to the index which is find (n, xs) *)
    end;


find(3, [1, 2, 3, 4, 5]);
find("cow", ["cow", "dog"]);
find("rabbit", ["cow", "dog"]);
