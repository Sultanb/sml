(* Data Type binding is a 3rd kind of bindings (val, fun, datatype) *)
datatype mytype = TwoInts of int*int | Str of string | Pizza
(* TwoInts: int*int -> mytype *)
val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts (1+2,3+4)
val e = a
(* Case expressions used to access types identified by data types*)
fun f (x:mytype) =
    case x of
	Pizza => 3 
     | Str S  => 8
     | TwoInts (i1, i2) => i1+i2

datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp
				     
				  
fun eval e =
    case e of
    Constant i => i
  | Negate e2 => ~(eval e2)
  | Add (e1,e2) => (eval e1)+(eval e2)
  | Multiply (e1,e2) => (eval e1) * (eval e2)
					
				  
fun number_of_adds e =
    case e of
    Constant i => i
  | Negate e2 => number_of_adds e2
  | Add (e1,e2) => 1 + number_of_adds e1 + number_of_adds e2
  | Multiply (e1,e2) => number_of_adds e1 + number_of_adds e2
							   
		  
fun max_constant e =
    case e of
	Constant i => i
      | Negate e2  => max_constant e2
      | Add (e1,e2) => Int.max (max_constant e1, max_constant e2)
      | Multiply (e1,e2) => Int.max (max_constant e1, max_constant e2)

val test_exp = Add (Constant 19, Negate (Constant 4))
val nineteen = max_constant test_exp

datatype my_int_list = Empty
		     | cons of int * my_int_list
 Val x = cons (4, cons (23, cons (2008,empty))
fun append_my_list (xs,ys) =
    case xs of
	Empty => ys
      | cons (x,xs') => cons (x, append_my_list (xs',ys))

			     
