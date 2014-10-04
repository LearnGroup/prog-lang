fun pow(x : int, y : int)  = 
    if y = 0
    then 1
    else x * pow(x, y - 1)

fun cube(x : int) = pow(x, 3)

val x = 7

val sixtyfour = cube(4)

fun pow2(x : int) = 
	pow(x, 2)

val d = pow2(12)
