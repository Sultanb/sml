
(* OOP like python handle callbacks with objects, functional languages with closures*)
(* Usecase1: When a disaster recovery event occurs *)
(* Usecase2: In case someone tried to access the cloud systems and didnt succeed *)

(* onKeyEvent When a key event occurs, takes an int->unit and the side effect call you back later - Thats the interface and needs library t be implemented *)

val cbs : (int->unit) list ref = ref []

fun onKeyEvent f = cbs := f::(!cbs) (* !cbs previous content of cbs *)

fun onEvent i =
    let fun loop fs =
	    case fs of
		[] => ()
	      | f::fs' => (f i; loop fs')
    in
	loop (!cbs) end

val timesPressed = ref 0
val _ = onKeyEvent (fn _ => timesPressed := (!timesPressed)+1)
fun printIfPressed i =
    onKeyEvent (fn j => (* thats the key that is pressed *)
		   if i=j then print ("you pressed" ^ Int.toString i ^ "\n") else ())
	       
val _ = printIfPressed 4
val _ = printIfPressed 11
val _ = printIfPressed 23
val _ = printIfPressed 4
	    
