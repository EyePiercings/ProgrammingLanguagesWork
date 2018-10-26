(* ML maps for trees *)

Control.Print.printDepth := 100;
Control.Print.printLength := 100;


datatype 'a tree = LEAF of 'a |
		   NODE of 'a tree * 'a tree;

fun maptree f (LEAF x) = (LEAF (f x))
  | maptree f (NODE(l,r)) = (NODE(maptree f l, maptree f r));


fun addone x = x+1;

maptree addone (NODE(NODE(LEAF 1,LEAF 2),LEAF 3));
				    
