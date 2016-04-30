(* Polymorphic data type alpha Beta *)
datatype 'a option = NONE | SOME of 'a
datatype 'a mylist = Empty | cons of 'a * 'a mylist
datatype ('a,'b) tree = Node of 'a * ('a,'b) tree * ('a,'b) tree | leaf of 'b


fun sum_tree tr =
    case tr of
	leaf i => i
     | Node (i,lft,rgt) => i + sum_tree lft + sum_tree rgt 

fun sum_leaves tr =
    case tr of
	leaf i => i
     | Node (i,lft,rgt) => sum_tree lft + sum_tree rgt 

fun sum_list xs =
    case xs of
	[] => 0
      | x::xs' => x + sum_list xs'

fun append (xs,ys) =
    case xs of
	[] => ys
      | xs::xs' => x::append (xs',ys)
			     
