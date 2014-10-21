use "hw3.sml";

val test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test2 = only_capitals ["Add","B","C"] = ["Add","B","C"]
val test3 = only_capitals [] = []
val test4 = only_capitals ["fuck you"] = []

val test5 = longest_string1 ["A","bc","C"] = "bc"
val test6 = longest_string1 [] = ""
val test7 = longest_string1 ["a"] = "a"
val test8 = longest_string1["A","bc", "ac","C"] = "bc"

val test9 = longest_string2 ["A","bc","C"] = "bc"
val test10 = longest_string2 [] = ""
val test11 = longest_string2 ["a"] = "a"
val test12 = longest_string2["A","bc", "db", "ac","C"] = "ac"

val test13 = longest_string3 ["A","bc","C"] = "bc"
val test14 = longest_string3 [] = ""
val test15 = longest_string3 ["a"] = "a"
val test16 = longest_string3 ["A","bc", "ac","C"] = "bc"

val test17 = longest_string4 ["A","bc","C"] = "bc"
val test18 = longest_string4 [] = ""
val test19 = longest_string4 ["a"] = "a"
val test20 = longest_string4 ["A","bc", "db", "ac","C"] = "ac"

val test21 = longest_capitalized ["A","bc","C"] = "A";
val test22 = longest_capitalized ["a","bc","C", "B"] = "C";
val test22 = longest_capitalized [] = "";

val test23 = rev_string "abc" = "cba";
val test24 = rev_string "" = "";
val test25 = rev_string "a" = "a";

val test26 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val test28 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test29 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1, 1, 1, 1, 1] = SOME [1, 1, 1, 1, 1]
val test30 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME [] 
val test31 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [1, 2, 3, 4, 5] = NONE
val test32 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2, 3, 4, 5] = SOME [2, 3, 4, 5]

val test33 = count_wildcards Wildcard = 1
val test34 = count_wildcards (TupleP [Wildcard, Variable "s", Wildcard]) = 2
val test35 = count_wildcards (TupleP [Wildcard, Variable "s", TupleP []]) =1
val test36 = count_wildcards (TupleP [Wildcard, Variable "s", TupleP [Wildcard]]) = 2

val test9b1 = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b2 = count_wild_and_variable_lengths (TupleP [Wildcard, Variable "sa", TupleP [Wildcard]]) = 4

val test9c1 = count_some_var ("x", Variable("x")) = 1;
val test9c2 = count_some_var ("sa", TupleP [Wildcard, Variable "sa", Variable "sa", Variable "sas", TupleP [Wildcard]]) = 2;

val test10_1 = check_pat (Variable("x")) = true
val test10_2 = check_pat (TupleP [Wildcard, Variable "sa", Variable "sa", Variable "sas", TupleP [Wildcard]]) = false

val test11_1 = match (Const(1), UnitP) = NONE
val test11_2 = match (Unit, Wildcard) = SOME []
val test11_3 = match (Unit, Variable "sa") = SOME [("sa", Unit)]
val test11_4 = match (Unit, UnitP) = SOME []
val test11_5 = match (Const 12, ConstP 12) = SOME []
val test11_6 = match (Const 12, ConstP 13) = NONE
val test11_7 = match (Tuple [Unit, Unit, Tuple []], TupleP [Wildcard, Variable "s", TupleP []]) = SOME [("s", Unit)]
val test11_8 = match (Constructor ("sa", Tuple [Unit, Unit, Tuple []]), ConstructorP ("sa", TupleP [Wildcard, Variable "s", TupleP []])) = SOME [("s", Unit)]
val test11_9 = match (Constructor ("sa1", Tuple [Unit, Unit, Tuple []]), ConstructorP ("sa", TupleP [Wildcard, Variable "s", TupleP []])) = NONE

val test12_1 = first_match Unit [UnitP] = SOME []
val test12_2 = first_match Unit [] = NONE
val test12_3 = first_match Unit [Variable "sa"] = SOME [("sa", Unit)]
val test12_4 = first_match Unit [ConstP 12] = NONE





