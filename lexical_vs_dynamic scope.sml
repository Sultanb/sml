(* Why lexical scope? *)
(* 1- the meaning of the function doesnt depend on the variable names used *)
(* Lexical scope : use environment where function is defined *)
(* Dynamic scope: use environment where function is called *)

fun f1 y =
    let
	val x = y + 1
    in
	fn z => x+y+z
    end

fun f2 y =
    let
	val q = y + 1
    in
	fn z => q + y + z
    end

val x = 17 (* Irrelevant *)
val a1 = (f1 7) 4 (* adds 15 to the environment -> a1 maps to 19 *)
val a2 = (f2 7) 4 (* adds 15 to the environment -> a2 maps to 19 *)
(* In dynamic scope a1 use the x=17 and a2 end with undefined variable q *)
		
(* 2- Functions can be type-checked and reasoned about where defined *)
(* 3- closures are very powerful store whatever data we need *)

(* function that takes a function and list, returns a list that contains f true *)
fun filter (f,xs) =
    case xs of
    [] => []
  | x::xs' => if f x then x::(filter(f,xs'))
	      else filter(f,xs')

(* Here is the lexical scope function takes x and returns function that takes y and return true if y>x *)

fun greaterThanx x = fn y => y > x (* int -> (int -> int) *)
fun noNegatives xs = filter (greaterThanx~1,xs) (* filter the function over the listand returns a list of no negatives *)
fun allGreater (xs,n) = filter (fn x => x>n,xs)
			       
(* Resilience, PUE, Greater than 80% less than 20% use cases *)

(* Why do we need dynamix scope then? Dynamic scope is convenient is some languages such as Racket*)

			       (* we are also using dynamic scope in ML. if you squint a little bit, exceptions are ike dynamic scope -> raise e in the current handler in the code stack. For exceptions, dynamic scope is a better default *)

(* Closures and Recomputation  - Avoid unneccessary computaton *)
(* Use function filter above *)

(* Alternative 1 not efficient - we call the function for every string *)
fun allShorterThan1 (xs,s) = (* string list * string -> string list *)
    filter (fn x => String.size x < (print "!"; String.size s), xs)

(* Alternative add a variabe + fn to avoid calling the fun for every string *)
fun allShorterThan2 (xs, s) =
    let
	val i = (print "!"; String.size s)
    in
	filter (fn x => String.size x<i, xs)
    end

(* In order to test the different add a print "!" above to the operation *)

val _ = print "\nwithallShorterThan1: "
val x1 = allShorterThan1(["1","333","22","4444"],"xxx")
val _ = print "\nwithallShorterThan2: "
val x2 = allShorterThan2(["1","333","22","4444"],"xxx")
val _ = print "\n"
