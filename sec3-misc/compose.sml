fun sqrt_dull i = Math.sqrt (Real.fromInt(abs i))

val sqrt = Math.sqrt o Real.fromInt o abs

val x = sqrt 3

(* fn : ('a -> 'b) * ('c -> 'a) -> 'c -> 'b *)
fun compose(f, g) = fn x => f (g x)
