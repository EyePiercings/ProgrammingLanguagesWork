(* Convert one character to a numeric digit. *)
fun charToNum c = if (ord c) < 48 orelse (ord c) > 58 then ~1
		  else ord c - ord #"0";

fun calcList (nil,n) = n
  | calcList (fst::rest,n) =
    if charToNum fst > ~1 then  
    calcList(rest,10 * n + charToNum fst) else ~1;

(* Convert a string of digits to a number. The explode function
converts a string to a list of characters. *)
fun stringToNum s = calcList(explode s, 0);

stringToNum "578" ;
stringToNum "578a" ;

(* 
c. We prefer the exception method because our method of catching an error 
in part b requires calling charToNum an extra time everytime calcList is 
called, which seems inefficient compared to raise one exception and catching
it in StringToNum.

 
