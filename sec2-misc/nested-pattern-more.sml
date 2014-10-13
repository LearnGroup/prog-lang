
fun nondecreasing xs =
	case xs of
		[] => true
		| _::[] => true
		| x1::(x2::xs) => x1 <= x2 andalso nondecreasing (x2::xs)

val nondec = nondecreasing [1, 2, 3, 3]
val dec = nondecreasing [4, 3, 1, 1]


datatype sgn = P | N | Z

fun multsign (x1, x2) = 
	let fun sign x = 
		if x = 0 then Z
		else if x < 0 then P
		else N
	in
		case (sign x1, sign x2) of
			  (Z, _) => Z
			| (_, Z) => Z
			| (P, P) => P
			| (N, N) => P
			| _ => N
	end
