fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* return NONE if list does not contain str *)
(* return SOME with str removed from strs *)
fun all_except_option(str, strs) =
    case strs of
        (* obv no match if strs is empty *)
        [] => NONE
      | x::xs' =>
        if same_string(str, x)
        (* if we found the string we were looking for, just return the rest of the list *)
        then SOME xs'
        else
            (* keep looking for str in list, this time via options *)
            case all_except_option(str, xs') of
                NONE => NONE
              | SOME ls => SOME (x::ls)

fun get_substitutions1(subs, str) =
    case subs of
        [] => []
      | x::xs =>
        case all_except_option(str, x) of
            NONE => get_substitutions1(xs, str)
          | SOME ls => ls@get_substitutions1(xs, str)

fun get_substitutions2(subs: string list list, s: string) =
    let
      fun aux(subs, s, acc) =
        case subs of
           [] => acc
         | x::xs => case all_except_option(s, x) of
            NONE => aux(xs, s, acc)
          | SOME ls => aux(xs, s, acc@ls)
    in
        aux(subs, s, [])
    end

(* get_subs -> {org name record} + (name list -> records) *)
fun similar_names(names: string list list, {first: string, middle: string, last: string}) =
    let
        val xs = first::get_substitutions2(names, first)
        fun aux(names, acc) =
            case names of
                [] => acc
              | x::xs =>
                ({ first=x, middle=middle, last=last })::aux(xs, acc)
    in
      aux(xs, [])
    end

datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun card_color(suit, rank) =
    case suit of
        Clubs => Black
      | Spades => Black
      | Diamonds => Red
      | Hearts => Red

fun card_value(suit, rank) =
    case rank of
        Num i => i
      | Ace => 11
      | _ => 10

fun remove_card(cs, c, ex) =
    case cs of
        [] => raise(ex)
      | x::xs => if x = c
      then xs
      else x::remove_card(xs, c, ex)

(* get first card color -> check if remaining cards are that color *)
fun all_same_color(cards) =
        case cards of
            (*  no cards = same color *)
            [] => true
          | _::[] => true
          | head::(neck::rest) =>
                if card_color(head) = card_color(neck)
                then all_same_color(neck::rest)
                else false

fun sum_cards(cards) =
    let
      fun aux(cards) =
        case cards of
            [] => 0
          | x::xs => card_value(x) + aux(xs)
    in
      aux(cards)
    end

(* sum cards -> if sum > goal then score = 3 x (sum - goal) else goal - sum, if same color -> div 2 *)
fun score(cards, goal) =
    let
      val sum = sum_cards(cards) 
      val prel_score = if sum > goal then 3 * (sum - goal) else (goal - sum)
      val score_finalizer = if all_same_color(cards) then 2 else 1
    in
      prel_score div score_finalizer
    end

fun officiate(cards, moves, goal) =
    let
      fun play(cards, moves, held) =
        case moves of
           [] => held
         | x::xs => case x of
            Discard c => play(cards, xs, remove_card(held, c, IllegalMove))
          | Draw => case cards of
            [] => held
          | y::ys => play(ys, xs, y::held)
    in
      score(play(cards, moves, []), goal)
    end