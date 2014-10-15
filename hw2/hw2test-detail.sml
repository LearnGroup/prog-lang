use "hw2.sml";

val test0 = all_except_option("string", []) = NONE
val test1 = all_except_option("string", ["string"]) = SOME []
val test2 = all_except_option("string", ["string1"]) = NONE
val test3 = all_except_option("string", ["string", "FUCK", "shit"]) = SOME ["FUCK", "shit"]

val test4 = get_substitutions1([["foo"],["there"]], "foo") = []
val test5 = get_substitutions1([["foo", "jack"],["there"]], "foo") = ["jack"]
val test6 = get_substitutions1([["foo", "jack"],["foo", "there"]], "foo") = ["jack", "there"]
val test7 = get_substitutions1([["foo", "jack"],["foo", "jack"]], "foo") = ["jack", "jack"]
val test8 = get_substitutions1([], "foo") = []
val test9 = get_substitutions1([[], []], "foo") = []

val test10 = get_substitutions2([["foo"],["there"]], "foo") = []
val test11 = get_substitutions2([["foo", "jack"],["there"]], "foo") = ["jack"]
val test12 = get_substitutions2([["foo", "jack"],["foo", "there"]], "foo") = ["jack", "there"]
val test13 = get_substitutions2([["foo", "jack"],["foo", "jack"]], "foo") = ["jack", "jack"]
val test14 = get_substitutions2([], "foo") = []
val test15 = get_substitutions2([[], []], "foo") = []

val test16 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}] 


val test17 = card_color((Clubs, Num 2)) = Black
val test18 = card_color((Diamonds, Num 2)) = Red
val test19 = card_color((Hearts, Num 2)) = Red
val test20 = card_color((Spades, Num 2)) = Black

val test21 = card_value((Clubs, Num 2)) = 2
val test22 = card_value((Clubs, Num 3)) = 3
val test23 = card_value((Clubs, Num ~2)) = ~2
val test24 = card_value((Clubs, Jack)) = 10
val test25 = card_value((Clubs, King)) = 10
val test26 = card_value((Clubs, Queen)) = 10
val test27 = card_value((Clubs, Ace)) = 11

val test28 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test29 = remove_card([(Hearts, Ace),(Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Hearts, Ace)]
val test30 = ((remove_card([(Hearts, Ace)], (Diamonds, Ace), IllegalMove); false) handle IllegalMove => true)

val test31 = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true
val test32 = all_same_color([(Hearts, Ace), (Diamonds, Ace)]) = true
val test33 = all_same_color([(Hearts, Ace), (Spades, Ace)]) = false
val test34 = all_same_color([(Hearts, Ace), (Spades, Ace), (Spades, Ace)]) = false
val test35 = all_same_color([(Clubs, Ace), (Spades, Ace), (Spades, Ace)]) = true
val test36 = all_same_color([]) = true
val test37 = all_same_color([(Clubs, Ace)]) = true

val test38 = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4
val test39 = sum_cards([]) = 0
val test40 = sum_cards([(Clubs, Jack),(Clubs, Num 2)]) = 12
val test41 = sum_cards([(Clubs, King),(Clubs, Num 2)]) = 12
val test42 = sum_cards([(Clubs, Queen),(Clubs, Num 2)]) = 12

val test43 = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test44 = score([(Hearts, Num 10),(Clubs, Num 4)],10) = 12
val test45 = score([(Hearts, Num 10),(Diamonds, Num 4)],10) = 6
val test46 = score([(Hearts, Num 10),(Hearts, Num 4)],10) = 6
val test47 = score([(Hearts, Num 6),(Hearts, Num 4)],10) = 0

val test50 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test51 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3

val test52 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)

val test53 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Discard(Clubs,Ace),Discard(Spades,Ace),Discard(Clubs,Ace),Discard(Spades,Ace)],
                       42)
             = 3 (* (44 - 42) * 3 / 2 = 3 *)

val test54 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Num 7)],
                       [Draw,Draw,Draw,Draw,Discard(Clubs,Ace),Discard(Spades,Ace),Discard(Clubs,Ace),Discard(Spades,Num 7)],
                       42)
             = 21 

val test60 = sum_cards_challenge([(Clubs, Ace),(Clubs, Ace),(Clubs, Num 2)]) = [24, 14, 4]
val test61 = sum_cards_challenge([]) = [0]
val test62 = sum_cards_challenge([(Clubs, Ace),(Clubs, Num 2)]) = [13, 3]
val test63 = sum_cards_challenge([(Clubs, King),(Clubs, Num 2)]) = [12]
val test64 = sum_cards_challenge([(Clubs, Queen),(Clubs, Ace),(Clubs, Ace),(Clubs, Ace)]) = [43, 33, 23, 13]

val test65 = score_challenge([(Hearts, Num 2),(Clubs, Ace)],10) = 7
val test66 = score_challenge([(Hearts, Num 10),(Clubs, Num 4)],10) = 12
val test67 = score_challenge([(Hearts, Num 10),(Diamonds, Num 4)],10) = 6
val test68 = score_challenge([(Hearts, Num 10),(Hearts, Ace)],10) = 1 
val test69 = score_challenge([(Hearts, Num 6),(Hearts, Ace)],10) = 1 

val test70 = officiate_challenge([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test71 = officiate_challenge([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       3)
             = 1

val test72 = ((officiate_challenge([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)

val test73 = officiate_challenge([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Discard(Clubs,Ace),Discard(Spades,Ace),Discard(Clubs,Ace),Discard(Spades,Ace)],
                       42)
             = 21

val test74 = officiate_challenge([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Num 7)],
                       [Draw,Draw,Draw,Draw,Discard(Clubs,Ace),Discard(Spades,Ace),Discard(Clubs,Ace),Discard(Spades,Num 7)],
                       42)
             = 21 
