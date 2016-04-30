(* Closure Idiom # 2 - Combining functions basic concept in computer science *)

fun compose (f,g) = fn x => f(g x)
			     
fun sqrt_of_abs i = Math.sqrt (Real.fromInt(abs i))
fun sqrt_of_abs i = (Math.sqrt o Real.fromInt o abs)i
val sqrt_of_abs = Math.sqrt o Real.fromInt o abs
						   
(* The program reads from left to right 1-abs 2-Real.fromInt 3-sqrt *)
(* To have it from right to left we define infix !> *)

fun backup1 (f,g) = fn x => case f x of
				NONE => g x
			     | SOME y => y
			
(* VM Migration *)
					     
fun image (f,g) = fn x => case f x of
			      NONE => g x
			    | SOME y => y
					    
										   
