fun reverse(xs) = 
    let fun aux(xs, acc) = 
            case xs of
                [] => acc
              | x::xss => aux(xss, x::acc)
    in
        aux(xs, [])
    end

val x = [1, 2, 3, 4]
val y = append (x)
