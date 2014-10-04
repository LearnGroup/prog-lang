
(* badly example *)
fun bad_max (xs : int list) = 
	if null xs 
	then 0
	else if null (tl xs)
	then hd xs
	else if hd xs > bad_max(tl xs)
	then hd xs
	else bad_max(tl xs)
(* we can use let to avoid repeat computation in the above function *)
