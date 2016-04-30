(* functional body can use more than the argument,can use any environment any scope *)
(* Lexical scope which environment? which scope? we use the environment where the function is defined not the environment where the function is called *)

val x = 1 (* x maps to 1 *)
fun f y = x + y (* f maps to function that adds 1 to its argument *)
val x = 2 (* x maps to 2 *)
val y = 3 (* y maps to 3 *)
val z = f(x+y) (* call the function defined on line 2 with 5 *)
(* add 1 to its argument and z maps to 6 *)

(* ?? How, if we shadowed x, the function used the old value of x  - Thats closure *)
(* @ L2 we created a closure, think about the symantex as (code,environment) *)
	 
(* Why would you have the symantecs of your language to have lexical scope ? *)
(* why dynamic scope used by other languages is a bad idea? *)
(* Idioms with higher order functions use lexical scope *)

val x = 1
fun f y =
    let
	val x = y + 1
    in
	fn z => x+y+z (* take z and return 2y+1 *)
    end

val x = 3 (* Irrelevant *)
val g = f 4 (* return a function that adds 9 to its environment *)
val y = 5 (* Irrelevant *)
val z = g 6 (* map z to 15 *)
	  
(* Another Example *)
	  
fun f g =
    let
	val x = 3 (* Irrelevant *)
    in
	g 2
    end
val x = 4
fun h y = x + y (* function h tat adds 4 to its argument *)
val z = f h (* z map to 6 not 7 *)		  
