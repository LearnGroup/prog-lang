fun sum_triple triple = 
	case triple of 
		(x, y, z) => x + y +z

fun full_name r = 
	case r of 
		{first = x, middle = y, last = z} =>
			x ^ " " ^ y ^ " " ^ z

fun sum_triple triple = 
	let val (x, y, z) = triple
	in
		x + y + z
	end

fun full_name r = 
	let val {first = x, middle = y, last = z} = r
	in
		x ^ " " ^ y ^ " " ^ z
	end

fun sum_triple (x, y, z) = 
	x + y + z

fun full_name {first = x, middle = y, last = z} = 
	x ^ " " ^ y ^ " " ^ z

val name = full_name {first = "Jack", middle = "wei", last = "sun"}
val six = sum_triple (1, 2, 3)
