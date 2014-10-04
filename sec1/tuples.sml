fun swap(x : int * bool) = (#2 x, #1 x)

fun add_vector(v1 : int * int, v2 : int * int) =
	(#1 v1 + #1 v2, #2 v1 + #2 v2)

val x = (1, false)

val y = swap(x)

val vec = add_vector((1, 3), (1, 2))
