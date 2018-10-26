(*
 * expr.sml
 * cs334
 *)

(* Magic constant to make datatypes print out fully *)
Control.Print.printDepth:= 100;
Control.Print.printLength:= 100;

datatype Expr = 
    VarX
  | VarY
  | Sine     of Expr
  | Cosine   of Expr
  | Average  of Expr * Expr
  | Times    of Expr * Expr
  | One 
  | Zero
  | CS3Average of Expr * Expr * Expr;


(* build functions:
     Use these helper functions to generate elements of the Expr
     datatype rather than using the constructors directly.  This
     provides a little more modularity in the design of your program
*)
fun buildX()             = VarX;
fun buildY()             = VarY;
fun buildSine(e)         = Sine(e);
fun buildCosine(e)       = Cosine(e);
fun buildAverage(e1,e2)  = Average(e1,e2);
fun buildTimes(e1,e2)    = Times(e1,e2);
fun buildOne()           = One;
fun buildZero()          = Zero;
fun buildCS3Average(e1,e2,e3)      = CS3Average(e1,e2,e3);


(* exprToString : Expr -> string
   Complete this function to convert an Expr to a string 
 *)

fun exprToString (e:Expr) =
  case e of
      VarX => "x"
    | VarY => "y" 
    | Sine(e) => "sin(pi*" ^ exprToString(e) ^ ")"
    | Cosine(e) => "cos(pi*" ^ exprToString(e) ^ ")" 
    | Times(x,y) => exprToString(x) ^ "*" ^ exprToString(y)
    | Average(x,y) => "(" ^ exprToString(x) ^ "+" ^ exprToString(y) ^ ")/2"
    | One => "1"
    | Zero => "0"
    | CS3Average(e1,e2,e3)  => "(cos(pi*" ^ exprToString(e1) ^ ")+sin(pi*" ^ exprToString(e2) ^ ")+" ^ exprToString(e3) ^ ")/3.0"; 
		     
    
(* eval : Expr -> real*real -> real
   Evaluator for expressions in x and y
 *)
fun eval (e:Expr)(x:real,y:real) =
  case e of
      VarX => x
    | VarY => y
    | Sine(e) =>  Math.sin(Math.pi * eval (e) (x,y))
    | Cosine(e) => Math.cos(Math.pi * eval (e) (x,y))
    | Average(e1,e2) => (eval (e1) (x,y) + eval (e2) (x,y))/2.0
    | Times(e1,e2) => eval (e1) (x,y) * eval (e2) (x,y)
    | One => 1.0
    | Zero => 0.0
    | CS3Average(e1,e2,e3) => (Math.cos(Math.pi * eval (e1) (x,y)) + Math.sin(Math.pi * eval (e2) (x,y)) + eval (e3) (x,y))/3.0;
	
val sampleExpr =
      buildCosine(buildSine(buildTimes(buildCosine(buildAverage(buildCosine(
      buildX()),buildTimes(buildCosine (buildCosine (buildAverage
      (buildTimes (buildY(),buildY()),buildCosine (buildX())))),
      buildCosine (buildTimes (buildSine (buildCosine
      (buildY())),buildAverage (buildSine (buildX()), buildTimes
      (buildX(),buildX()))))))),buildY())));

(************** Add Testing Code Here ***************)
exprToString sampleExpr;
exprToString (Times(Sine(VarX),Cosine(Times(VarX,VarY))));
exprToString (Times(Sine(VarX),Cosine(Average(VarX,VarY))));
exprToString (CS3Average(VarX, Cosine(Average(VarX,VarY)), Zero));
exprToString (Zero);
exprToString (One);

eval (CS3Average(VarX, VarY, One)) (0.5, 0.0);
