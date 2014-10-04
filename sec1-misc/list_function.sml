fun sum_list(xs : int list) = 
	if null xs
	then 0
	else hd xs + sum_list(tl xs);

fun list_product(xs : int list) = 
	if null xs
	then 1
	else hd xs * list_product(tl xs);

fun countdown(x : int) = 
	if x = 0 
	then []
	else x :: countdown(x - 1);

fun append(xs : int list, ys : int list) = 
	if null xs
	then ys
	else (hd xs) :: append(tl xs, ys);

fun firsts (xs : (int * int) list) = 
	if null xs 
	then []
	else (#1 (hd xs)) :: firsts(tl xs);

fun seconds (xs : (int * int) list) = 
	if null xs 
	then []
	else (#1 (hd xs)) :: seconds(tl xs);

fun f_s (func : (int * int ) -> int, xs : (int * int) list) = 
	if null xs
	then []
	else (func (hd xs)) :: f_s(func, tl xs);

fun firsts(xs : (int * int) list) = f_s(#1, xs);
fun seconds(xs : (int * int) list) = f_s(#2, xs);

val res = sum_list [1, 2, 3];

val prod1 = list_product [];
val prod2 = list_product [5];
val prod3 = list_product [2, 4, 2]

val cd = countdown 10

val app = append([1, 2, 3], [4, 5, 6])

val fir = firsts [(1, 3), (2, 3), (3, 3)]
val sec = seconds [(1, 3), (2, 3), (3, 3)]
