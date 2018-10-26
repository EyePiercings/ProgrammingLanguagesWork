Control.Print.printDepth := 100;
Control.Print.printLength := 500;
Control.Print.stringDepth := 500;
fun sumSquares (0)= 0
  | sumSquares(x)  =   x*x + sumSquares(x-1);

fun listDup(ls, 0) = nil
  | listDup (ls, n) = ls :: listDup(ls, n-1);  

(*
c. 'a * int => 'a list means that my function takes something of any type and
an int and returns a list of whatever type the first parameter is. This is an
appropriate type because we want the function to be able to handle any type 
of first parameter. 
 *)

(* tests *)
sumSquares(4);
sumSquares(5);

listDup("moo", 4);
listDup(1, 2);
listDup(listDup("cow", 2), 2);
