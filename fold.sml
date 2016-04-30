(* functions recursively traverse over data structures and return single answer *)
(* Fold function pass a function f, initial value acc, and list xs *)
(* It accumulates an answer by repeatedly applying f to the answer *)
(* Apply f to the accumulator in the 1st element of the list, take the result and pass it to f with 2nd element in the list, take a result and pass it to f with 3rd eement of the list and so on until you reach the end of list *)

fun fold (f,acc,xs) = (* ('a * 'b -> 'a) * 'a * 'b list -> 'a *)
    case xs of
	[] => acc
     | x::xs => fold(f,f(acc,x),xs) 

(* Why fold? Separate of concerns - One group of people can worry about writing fold for more complicated data structure - Another group can worry about how to compute over particular result. Iterator-like function that is not built into the language *)

(* Use fold to separate the duties or responsibilities in the cloud operation *)
(* Use fold for giving user rights and privileges in the cloud *)

fun f1 xs = fold ((fn(x,y) => x + y), 0, xs) (* Summing the elements of a list *)
fun f2 xs = fold ((fn(x,y) => x andalso y>=0),true,xs) (* Are all list elements non negative *)

(* The power of closures - using private data *)
		      
(* Call to f3 with initial acc 0 where x is the current acc and y is the next element of the list -> adding 1 if y >= low andalso y<= high *)
fun f3 (xs,low,high) =
    fold ((fn(x,y) => x + (if y >= low andalso y <= high then 1 else 0)),0,xs)
		      
(* Apply the above to scaling if less than 20% or higher than 80% the f scaling *)
	 
fun f4 (xs,s) =
    let
	val i = String.size s
    in
	fold ((fn(x,y) => x andalso String.size y<i),true,xs)
    end
(* Generic function takes in a function g and list xs and check if its true *)
fun f5 (g,xs) = fold ((fn(x,y) => x andalso g y),true,xs)

fun f4again (xs,s) =
    let
	val i = String.size s
    in
	f5(fn y => String.size y < i, xs)
    end


fold ((fn(x,y) => x+y),0,[1,2,3,4]); (* Val = 10 *)
