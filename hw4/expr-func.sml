(*
 * expr-sml.sml
 * cs334
 *)

(* Magic constant to make datatypes print out fully *)
Control.Print.printDepth:= 100;
Control.Print.printLength:= 100;

(* Expr is now a function that takes a pair of reals
     and returns a real.   
*)
type Expr = real * real -> real;

(* build functions:
     Use these helper functions to generate elements of the Expr
     type.  They are identical in signature to those in expr.sml.
     You will need to add additional functions for the expression
     forms that you added.
*)
fun buildX()             = fn (x,y) => x;
fun buildY()             = fn (x,y) => y;
fun buildSine(e)         = fn (x,y) => Math.sin(e(x,y));
fun buildCosine(e)       = fn (x,y) => Math.cos(e(x,y));
fun buildAverage(e1,e2)  = fn (x,y) => (e1(x,y)+ e2(x,y))/2.0;
fun buildTimes(e1,e2)    = fn (x,y) => e1(x,y) * e2(x,y) * 1.0;
fun buildOne()           = 1.0;
fun buildZero()          = 0.0;
fun buildCS3Average(e1,e2,e3) = fn (x,y) =>
				(Math.sin(e1(x,y)) + Math.cos(e2(x,y)) + e3(x,y))/3.0;     

(* exprToString : Expr -> string
   Complete this function to convert an Expr to a string 
 *)

fun exprToString (e:Expr) = "<function>";
		 
	       
(* eval : Expr -> real*real -> real
   Evaluator for expressions in x and y
 *)
fun eval e (x,y) = e (x,y);
	
val sampleExpr =
       buildCosine(buildSine(buildTimes(buildCosine(buildAverage(buildCosine(
       buildX()),buildTimes(buildCosine (buildCosine (buildAverage
       (buildTimes (buildY(),buildY()),buildCosine (buildX())))),
       buildCosine (buildTimes (buildSine (buildCosine
       (buildY())),buildAverage (buildSine (buildX()), buildTimes
       (buildX(),buildX()))))))),buildY())));

(************** Add Testing Code Here ***************)
eval sampleExpr (0.5, 0.0);
