(* (a) *)
(* Convert one character to a numeric digit. *)

exception wow;

fun charToNum c = if ord c < 48 orelse ord c > 58 then raise wow else (ord c - ord #"0");

fun calcList (nil,n) = n
  | calcList (fst::rest,n) = calcList(rest,10 * n + charToNum fst);

(* Convert a string of digits to a number. The explode function
converts a string to a list of characters. *)
fun stringToNum s = calcList(explode s, 0) handle wow => ~1;


stringToNum "578";
stringToNum "9a";



