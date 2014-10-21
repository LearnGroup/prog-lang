fun sorted3_nicer x y z = z >= y andalso y >= x
val is_nonnegative = sorted3_nicer 0 0 
val t1 = is_nonnegative 12
val t2 = is_nonnegative ~1
