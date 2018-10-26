fun mult (a,b) =
  if (a = 0) then 0 else
  let
      val x = ref a
      val y = ref b
      val sum = ref 0
  in
      while (!x >= 1) do (sum := !y + !sum;x := !x - 1);
	    !sum
  end;

mult(2,3);
mult(0,4);
mult(6,7);
mult(2,0);

