(* fn : ('a * 'b -> 'c) -> 'a -> 'b -> 'c *)
fun curry f x y = f (x, y)
(* switch two arguments of other functions *)
fun other_curry f x y = f y x
(* fn : ('a -> 'b -> 'c) -> 'a * 'b -> 'c *)
fun uncurry f(x, y) = f x y
(* fn : int * int -> int list *)
fun range (i, j) = if i > j then [] else i :: range (i + 1, j)

val countup = curry range 1
val xs = countup 7
