fun sorted3_tupled (x, y, z) = z >= y andalso y >= x

val t1 = sorted3_tupled (7, 9 , 11)

val sorted3 = fn x => fn y => fn z => z >= y andalso y >= x

val t2 = sorted3 7 8 9

fun sorted3_nicer x y z = z >= y andalso y >= x

fun fold f acc xs = 
	case xs of
		[] => acc
	  | x::xs' => fold f (f(acc, x)) xs'
