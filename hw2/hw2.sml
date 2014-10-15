(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun all_except_option (str, lst) = 
    case lst of
        [] => NONE
      | hd::tl_lst => 
            if same_string (str, hd)
            then SOME tl_lst
            else case all_except_option(str, tl_lst) of
                    NONE => NONE
                  | SOME tl_res => SOME (hd :: tl_res)

fun get_substitutions1(subs, name) = 
    case subs of
        [] => []
      | sub::tl_subs => 
            case all_except_option(name, sub) of
                NONE => get_substitutions1(tl_subs, name)
              | SOME sub_names => sub_names @ get_substitutions1(tl_subs, name)

fun get_substitutions2(subs, name) = 
    let fun aux(subs, acc) = 
            case subs of
                [] => acc
              | sub::tl_subs => case all_except_option(name, sub) of
                                    NONE => aux(tl_subs, acc)
                                  | SOME sub_names => aux(tl_subs, acc @ sub_names)
    in
        aux(subs, [])
    end

fun similar_names(subs, name) = 
    let 
        val {first=first_name, middle=middle_name, last=last_name} = name
        val first_names = get_substitutions2(subs, first_name)
        fun gen_names(lst) = 
            case lst of
                [] => []
              | hd::tl_lst => {first=hd, middle=middle_name, last=last_name}::gen_names(tl_lst)
    in
        name::gen_names(first_names)
    end

fun card_color (suit, _) = 
    case suit of
        Clubs => Black
      | Spades => Black
      | Diamonds => Red
      | Hearts => Red

fun card_value (_, rank) = 
    case rank of
        Jack => 10
      | Queen =>10
      | King => 10
      | Ace => 11
      | Num i => i

fun remove_card(cs, c, e) = 
    case cs of
        [] => raise e
      | hd::tl_cs => if hd = c 
                     then tl_cs
                     else hd::remove_card(tl_cs, c, e)

fun all_same_color(cs) = 
    case cs of
        [] => true
      | c::[] => true
      | c1::c2::css => if card_color(c1) = card_color(c2)
                       then all_same_color(c2::css)
                       else false

fun sum_cards(cs) = 
    let fun aux(cs, acc) = 
            case cs of
                [] => acc
              | c::css => aux(css, card_value(c) + acc)
    in
        aux(cs, 0)
    end

fun score(cs, goal) = 
    let
        val sum = sum_cards(cs)
        val pscore = if sum > goal then 3 * (sum - goal) else goal - sum
    in
        if all_same_color(cs) then pscore div 2 else pscore
    end

fun officiate(cs, mvs, goal) = 
    let fun play(held_cs, cs_left, mvs_left) = 
        case mvs_left of
            [] => held_cs
          | Discard c::tl_mvs => 
                play(remove_card(held_cs, c, IllegalMove), cs_left, tl_mvs)
          | Draw::tl_mvs => case cs_left of
                                [] => held_cs
                              | c::css => if sum_cards(c::held_cs) > goal 
                                          then c::held_cs
                                          else play(c::held_cs, css, tl_mvs)
    in
        score(play([], cs, mvs), goal)
    end

(* card list -> int list *)
fun sum_cards_challenge cs =
    let fun aux(cs) = 
        case cs of
            [] => [0]
          | c::css => case c of
                          (_, Ace) => sum_cards(cs)::(map (fn x => x + 1) (sum_cards_challenge(css)))
                        | _ => (map (fn x => x + card_value(c)) (sum_cards_challenge(css)))
    in
        aux(cs)
    end

fun score_challenge(cs, goal) = 
    let
        exception UnExpectedException
        fun list_min (ss) = 
            case ss of
                [] => raise UnExpectedException
              | s::[] => s
              | s::sss => Int.min(s, list_min(sss))
        val score = list_min (map (fn sum => if sum > goal 
                                              then 3 * (sum - goal) 
                                              else (goal - sum)) 
                                   (sum_cards_challenge(cs)))
    in
        if all_same_color(cs) then score div 2 else score
    end

fun officiate_challenge(cs, mvs, goal) = 
    let fun sum_cards_one(cs) = 
            case cs of
                [] => 0
              | c::css => case c of
                              (_, Ace) => 1 + sum_cards_one(css)
                            | _ => card_value(c) + sum_cards_one(css)
        fun play(held_cs, cs_left, mvs_left) = 
            case mvs_left of
                [] => held_cs
              | Discard c::tl_mvs => 
                    play(remove_card(held_cs, c, IllegalMove), cs_left, tl_mvs)
              | Draw::tl_mvs => case cs_left of
                                    [] => held_cs
                                  | c::css => if sum_cards_one(c::held_cs) > goal
                                              then c::held_cs
                                              else play(c::held_cs, css, tl_mvs)
    in
        score_challenge(play([], cs, mvs), goal)
    end







