fun silly1 (z : int) = 
	let 
		val x = if z > 0 then z else 34
		val y = x + z + 9
	in
		if x > y then 90 else 100
	end

fun silly2 () = 
	let 
		val x = 1
	in
		(* 3 + 5 + 2 = 10 *)
		(let val x = 2 in x + 1 end) + (let val y = x + 4 in y + 2 end)
	end

val x = silly2();
