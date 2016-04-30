(* The real value of signature is to hide coding detail - used bysw companies *)

signature MATHLIB =
sig
    val fact : int -> int
    val half_pi: real
    (* val doubler : int->int * hide bindings from clients *)
end

structure MyMathlib :> MATHLIB =
struct
fun fact x =
    if x = 0
    then 1
    else x * fact(x-1)
val half_pi = Math.pi / 2.0
fun doubler y = y + y
val eight = doubler 4
end
    
