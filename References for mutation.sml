(* Some situation needs mutation, in ML this done by new types Ref or Reference *)
val x = ref 42
val y = ref 42
val z = x
val _ = x:= 43
val w = (!y)+(!z) (* Value is 85 *)
		 
