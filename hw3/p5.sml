Control.Print.printDepth := 100;
Control.Print.printLength := 100;
datatype OpCode =
	 PUSH of real
       | ADD
       | MULT
       | SUB
       | DIV
       | SWAP
;

fun eval (nil,a::st) = a
    | eval (PUSH(n)::ops,st) = eval (ops, n::st)
    | eval (ADD::ops,a::b::st) = eval (PUSH(a+b)::ops, st)
    | eval (SUB::ops,a::b::st) = eval (PUSH(b-a)::ops, st) 
    | eval (MULT::ops,a::b::st) = eval (PUSH(b*a)::ops, st)
    | eval (DIV::ops,a::b::st) = eval (PUSH(b/a)::ops, st)
    | eval (SWAP::ops,a::b::st) = eval (ops, b::a::st) 
    | eval (_,_) = 0.0 ;

eval([PUSH(2.0)],[]);
eval([PUSH(2.0),PUSH(1.0),SUB],[]);
eval([PUSH(2.0),PUSH(1.0),ADD],[]);
eval([PUSH(2.0),PUSH(5.0),MULT],[]);
eval([PUSH(6.0),PUSH(2.0),DIV],[]);
eval([PUSH(6.0),PUSH(2.0),SWAP,DIV],[]);

  
  


	 
