(* function to swap 2 values integer and boolean*)
fun swap (pr : int * bool)=
    (#2pr, #1pr)
(* function to sum 2 pairs (int*int)*(int*int) -> int *)
fun sum_two_pairs(pr1:int*int, pr2:int*int)=
    (#1pr1)+(#2pr1)+(#1pr2)+(#2pr2)
(* function that divides 2 numbers and return the value with denominator *)
fun div_mod(x:int,y:int)=
    (x div y, x mod y)
(* function that sorts pair of integers *)
fun sort_pair (pr: int*int)=
    if (#1pr)<(#2pr)
    then pr
    else (#2pr,#1pr)
	     
