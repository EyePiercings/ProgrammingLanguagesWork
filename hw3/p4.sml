Control.Print.printDepth := 100;
Control.Print.printLength := 100;

datatype IntTree = LEAF of int | NODE of (IntTree * IntTree);

fun sum (LEAF x) = x
  | sum (NODE(left, right)) = sum (left) + sum (right);

sum(LEAF 3);
sum(NODE(LEAF 2, LEAF 3));
sum(NODE(LEAF 2, NODE(LEAF 1, LEAF 1)));


(* I dont know what an empty tree would look like because a Leaf must includ 
an int so it can't be nil, so I don't handle the case of an empty subtree*) 
fun height (LEAF x) = 1
  | height (NODE(left,right)) = if (height(left) + 1) > (height(right) + 1) then height(left) + 1 else height(right)+1  ;

height(LEAF 3);
height(NODE(LEAF 2, LEAF 3));
height(NODE(LEAF 2, NODE(LEAF 1, LEAF 1)));

fun balanced (LEAF 3) = true
  | balanced (NODE(left, right)) = if (height(left) - height(right)) > 1 orelse (height(left) - height(right)) < ~1 then false else true ; 

balanced(LEAF 3);
balanced(NODE(LEAF 2, LEAF 3));
balanced(NODE(LEAF 2, NODE(LEAF 3, NODE(LEAF 1, LEAF 1))));


(*
 d. Using the height method is not optimal because the height method traverses
both the left and right subtrees to find the greatest height and even though 
it computes the height of the other subtree side, only the side of greater 
height is returned. Since we want to compare the heights of the left and 
right subtrees it would be more efficient if a function like height returned 
both the right and left subtree height (in a tuple) for easier comparison, 
rather than having to call height once for each side in the balanced function.
*)
