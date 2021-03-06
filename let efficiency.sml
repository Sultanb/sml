(* return [from,from+1,.......,to]*)
fun countup (from:int,to:int)=
    if from = to
    then to::[]
    else from::countup(from + 1 , to)

(*return [from,from-1,.......,to]*)
fun countdown (from:int,to:int)=
    if from = to
    then to::[]
    else from::countdown(from-1,to)

(* function that takes a list of integers and return the maximum number in the list*)
fun bad_max (xs:int list)=
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max (tl xs)
    then hd xs
    else bad_max (tl xs)
		 
(* As the bad max is taking long time to purse, that will kill the computer process*)
fun good_max (xs:int list)=
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
	let val tl_ans = good_max(tl xs)
	in
	    if hd xs > tl_ans
	    then hd xs
	    else tl_ans
	end
	    
 (* Options - ( NONE SOME isSOME and valof) to represent a code above for max *)

(* function : int list -> int option *)
fun max1 (xs : int list)=
    if null xs
    then NONE
    else
	let val tl_ans = max1(tl xs)
	in
	    if isSome tl_ans andalso valOf tl_ans > hd xs
	    then tl_ans
	    else SOME (hd xs)
	end
	    
