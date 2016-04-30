(* the standard way to write functions without functional programming *)

(*fun increment_n_times_lame (n,x) = 
    if n=0
    then x
    else 1 + increment_n_times_lame(n-1,x)

fun double_n_times_lame (n,x) =
    if n=0
    then x
    else 2 * double_n_times_lame(n-1,x)

fun nth_tail_lame (n,xs) =
    if n=0
    then xs
    else tl (nth_tail_lame(n-1,xs))*)

fun n_times (f,n,x) =
    if n=0
    then x
    else f (n_times(f,n-1,x))

fun increment x = x+1			
fun double x = x + x
		       
val x1 = n_times(double,4,7)
val x2 = n_times(increment,4,7)
val x3 = n_times(tl,2,[4,8,12,16])
		 
fun addition (n,x) = n_times(increment,n,x)
fun double_n_times (n,x) = n_times (double,n,x)
fun nth_tail (n,x) = n_times (tl,n,x)

fun triple x = 3 * x
fun triple_n_times (n,x) = n_times(triple,n,x)
				  
(* Not all higher order functions are polymorhic *)
(* function takes a function f and argument x, returns how many times you need to have f(f(f(f....x))) t have 0 *)
(* (int->int)*int->int i.e only works with integer so not polymorphic*)		  
fun times_until_zero (f,x) =
    if x = 0 then 0 else 1+times_until_zero(f, f x)
			
(* Not all polymorphic functions are higher order *)
(* Function takes a list and return an onteger *)
					   
fun len xs =
    case xs of
	[] => 0
     |  x::xs'=> 1+len xs'

			    
(* Anonymous functions functions with no names - take the triple fun above *)

(* Version 2 triple n times *)
fun triple_n_timesv2 (n,x) =
    let
	fun triple x = 3 * x
    in
	n_times (triple,n,x)
    end

(* Version 3 triple n times *)
fun triple_n_timesv3 (n,x) =
    n_times(let fun triple x = 3 * x in triple end,n,x)

(* Version 4 triple n times with anonymous function fn#fun *)
fun triple_n_timesv4 (n,x) =
    n_times(fn x=>3*x,n,x)
	   
