(* apply a function to every element in the list *)
fun map (f,xs) =
    case xs of
	[]=>[]
      | x::xs' => (f x)::map(f,xs')

(* affinity rules to the cloud infrastructure *)
(* We need to define the affinity function and apply it to a cluster of VMs *)
val x1 = map ((fn affinity => affinity +1), [4,8,12,6]);
val x2 = map (hd, [[1,2],[3,4],[5,6,7]]);

(* f returns true or false, filter any elements of XS where f returns false *)
(* Fault Tolerance case alarms received from the VMs *)

fun filter (f,xs) =
    case xs of
	[] =>[]
      | x::xs' => if f x
		  then x::filter(f,xs')
		  else filter (f,xs')

(* Define some functions that use filters as hyperfunction *)
(* function that takes list of integers and return only even numbers in the list *)
fun is_even v =
    (v mod 2 = 0)

fun all_even xs = filter (is_even,xs)
fun all_even_2nd xs = filter ((fn(_,v) => is_even v),xs)
