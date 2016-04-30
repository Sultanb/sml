(* function that sums the integers in a list *)

fun sum_list (xs : int list)=
    if null xs
    then 0
    else hd xs + sum_list (tl xs)

(* function that lists the values in a list *)
fun countdown (x:int)=
    if x=0
    then []
    else x::countdown(x-1)

(* function that takes 2 lists and return one list combining both lists *)
fun append (xs: int list, ys: int list)=
    if null xs
    then ys
	     else (hd xs)::append((tl xs),ys)

(* function that sums a pair of lists *)
fun sum_pair_list(xs:(int*int)list)=
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)
					      
(* function the takes the firsts of each list *)
fun firsts (xs: (int*int) list) =
    if null xs
    then []
    else (#1 (hd xs)::firsts(tl xs))

(* function that takes the seconds of each list *)
fun seconds (xs: (int*int)list) =
	    if null xs
	    then []
		     else ((#2 (hd xs))::seconds(tl xs))
	     
(* function - another way to sum a list of pairs *)
fun sum_pair_list2 (xs:(int*int) list)=
    (sum_list (firsts xs)) + (sum_list (seconds xs))
				 
