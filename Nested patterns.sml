(* Function that zip 3 lists *)
fun zip3 list_triple =
    case list_triple of
	([],[],[]) => []
      | (hd1::tl1,hd2::tl2,hd3::tl3) => (hd1,hd2,hd3)::zip3(tl1,tl2,tl3)
     
fun unzip3 lst =
    case lst of
	[] => ([],[],[])
      | (a,b,c)::tl => let val (l1,l2,l3) = unzip3 tl
		       in
			   (a::l1, b::l2, c::l3)
		       end
			   
(* More Nested Functions *)

fun nondecreasing xs = (*int list -> bool *)
    case xs of
	[] => true
      | _::[] => true
      | head::(neck::rest) => head <= neck
			     andalso nondecreasing (neck::rest)
						   
			   
datatype sgn = p | n | z (* 3 signs +/-/0 *)

fun multsign (x1,x2)=
    let fun sign x =
	    if x = 0 then z else if x > 0 then p else n
     in
       case (sign x1, sign x2) of
       (z,_)=>z
     | (_,z) =>z
     | (p,p) =>p
     | (n,n) => p 
     | _ =>n
     end

(* Function that computes the length of a list *)
fun len xs =
    case xs of
	[] => 0
     | _::XS' => 1 + len XS'  
