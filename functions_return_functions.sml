(* functions that passing multiple functions and return function *)

fun double_or_triple f = (* (int -> bool) -> (int -> int) *)
    if f 7
    then fn x => 2 * x
    else fn x => 3 * x
val double = double_or_triple (fn x => x-3 = 4)
val nine = (double_or_triple (fn x => x=42))3
					    
(* t1->t2->t3->t4 means a function t1 that returns t2 that returns t3 .... *)

(* Higher Order Functions are very good to process recursive data structures *)

datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp

(* Given an expression, Is every constant in it is an even number *)

fun true_of_all_constants (f,e) = (* (int->bool) * exp -> bool *)
    case e of
	Constant i => f i
      | Negate e1 => true_of_all_constants(f,e1)
      | Add (e1,e2) => true_of_all_constants(f,e1) andalso true_of_all_constants(f,e2)
      | Multiply (e1,e2) => true_of_all_constants(f,e1) andalso true_of_all_constants(f,e2)

fun all_even e = true_of_all_constants ((fn x => x mod 2 = 0),e) (* exp -> bool *)

(* function for multitenancy up to 1000 tenant *)
