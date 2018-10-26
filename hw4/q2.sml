Control.Print.printDepth := 100;
Control.Print.printLength := 100;


datatype 'a tree = LEAF of 'a |
		   NODE of 'a tree * 'a tree;

fun reduce f (LEAF x) = x
  | reduce f (NODE(l,r)) = f (reduce f l, reduce f r);

fun f(x:int,y:int) = x+y;

reduce f (NODE(NODE(LEAF 1, LEAF 2), LEAF 3));
