fun sum_triple2(triple : int * int * int) = 
	#1 triple + #2 triple + #3 triple

(* compile error, cuz compiler cannot tell 
	whether triple contain 3, 4 or more elements *)
(*fun sum_triple3 triple = 
	#1 triple + #2 triple + #3 triple*)

(* int * 'a * int -> int *)
fun partial_sum (x, y, z) = 
	x + z

(* ''a * ''a -> string *)
fun same_thing (x, y) =
	if x = y then "yes" else "no"

(* int -> string *)
fun is_three x =
	if x = 3 then "yes" else "no"
