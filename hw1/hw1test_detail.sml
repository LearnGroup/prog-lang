use "hw1.sml";

val test1 = is_older((1,2,3),(2,3,4)) = true
val test2 = is_older((2, 1, 3), (2, 2, 2)) = true
val test3 = is_older((2, 2, 3), (2, 2, 3)) = false
val test4 = is_older((2, 2, 3), (2, 2, 4)) = true
val test5 = number_in_month([(2012,2,28),(2013,2,1)],2) = 2
val test6 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test7 = dates_in_month([(2012,2,28),(2014,2,9),(2013,12,1)],2) = [(2012,2,28),(2014,2,9)]
val test8 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test9 = get_nth(["hi", "there", "how", "are", "you"], 3) = "how"
val test10 = date_to_string((2014, 1, 1)) = "January 1, 2014"
val test11 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3
val test12 = number_before_reaching_sum(15, [1,2,3,4,5]) = 4
val test13 = number_before_reaching_sum(10, [1,2,3,3,5]) = 4
val test14 = number_before_reaching_sum(1, [1,2,3,4,5]) = 0
val test15 = what_month(70) = 3
val test16 = what_month(59) = 2
val test17 = what_month(365) = 12
val test18 = month_range(31, 34) = [1,2,2,2]
val test19 = month_range(59, 60) = [2,3]
val test20 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test21 = oldest([]) = NONE
val test22 = oldest([(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val test23 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2]) = 1
val test24 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,3,31),(2011,4,28)],[2,2,3]) = 3
val test25 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val test26 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1,1,1]) = 0

val test27 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test28 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,3,4,12]) = [(2012,2,28),(2011,3,31),(2011,4,28),(2013,12,1)]
val test29 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,3]) = [(2012,2,28),(2011,3,31)]
val test30 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1,2,3,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test31 = dates_in_months_challenge([],[2,3,4]) = []
val test32 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31)],[]) = []

val test33 = reasonable_date((2012, 2, 29)) = true

val test34 = remove_dup([2, 2, 2]) = [2]
val test35 = remove_dup([2, 2, 2, 3]) = [2, 3]
