(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
         | Variable of string
         | UnitP
         | ConstP of int
         | TupleP of pattern list
         | ConstructorP of string * pattern

datatype valu = Const of int
          | Unit
          | Tuple of valu list
          | Constructor of string * valu

fun g f1 f2 p =
    let 
    val r = g f1 f2 
    in
    case p of
        Wildcard          => f1 ()
      | Variable x        => f2 x
      | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
      | ConstructorP(_,p) => r p
      | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
         | UnitT
         | IntT
         | TupleT of typ list
         | Datatype of string

(**** you can put all your code here ****)
val only_capitals = 
    List.filter (Char.isUpper o (fn str => String.sub (str, 0))) 

val longest_string1 = 
    foldl (fn (x, acc) => if String.size x > String.size acc then x else acc) ""

val longest_string2 = 
    foldl (fn (x, acc) => if String.size x >= String.size acc then x else acc) ""

fun longest_string_helper f xs = 
    foldl (fn (x, acc) => if f (String.size x, String.size acc) then x else acc) "" xs

val longest_string3 = longest_string_helper (fn (x, acc) => x > acc)

val longest_string4 = longest_string_helper (fn (x, acc) => x >= acc)

val longest_capitalized = longest_string1 o only_capitals

val rev_string = String.implode o rev o String.explode

fun first_answer f xs = 
    case xs of
        [] => raise NoAnswer
      | x::xs' => case f x of
                      NONE => first_answer f xs'
                    | SOME v => v

fun all_answers f xs = 
    case xs of
        [] => SOME []
      | x::xs' => case f x of
                      NONE => NONE
                    | SOME v => case all_answers f xs' of
                                    NONE => NONE
                                  | SOME lst => SOME (v @ lst)

val count_wildcards = g (fn () => 1) (fn _ => 0)

val count_wild_and_variable_lengths = g (fn () => 1) String.size

fun count_some_var (str, p) = g (fn () => 0) (fn x => if str = x then 1 else 0) p

val check_pat = 
    let fun all_variables p = 
            case p of
                Variable v => [v]
              | TupleP ps => foldl (fn (p, acc) => all_variables p @ acc) [] ps
              | ConstructorP (s1, p) => all_variables p
              | _ => []

        fun no_dup xs = case xs of
                            [] => true
                          | x::[] => true
                          | x::xs' => not (List.exists (fn y => y = x) xs') andalso no_dup xs'
    in
        no_dup o all_variables
    end

fun match (v, p) = 
    case p of
        Wildcard => SOME []
      | Variable s => SOME [(s, v)]
      | UnitP => (case v of Unit => SOME [] | _ => NONE)
      | ConstP x => (case v of 
                         Const y => if x = y then SOME [] else NONE
                       | _ => NONE)
      | TupleP ps => (case v of 
                          Tuple vs => ((all_answers (fn x => match x) (ListPair.zipEq (vs, ps))) handle UnequalLengths => NONE)
                        | _ => NONE)
      | ConstructorP (s1, p) => (case v of 
                                     Constructor (s2, v) => if s1 = s2 then match (v, p) else NONE
                                   | _ => NONE)

fun first_match v ps = 
    (SOME (first_answer (fn p => match (v, p)) ps) handle NoAnswer => NONE)

