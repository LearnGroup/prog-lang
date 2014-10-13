fun hd xs = 
    case xs of
        [] => raise List.Empty
      | x::_ => x


exception MyUndesirableCondition

exception MyOtherException of int * int 

val x = hd [] handle List.Empty => 2;

fun excep e = 
    raise e

val y = excep MyUndesirableCondition handle MyUndesirableCondition => 12
