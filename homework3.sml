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

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(* 1. *)

fun only_capitals(xs) =
    List.filter (fn x => (Char.isUpper o String.sub)(x, 0)) xs

(* 2. *)

fun longest_string1(xs: string list) =
    case xs of
        [] => ""
      | ls => List.foldl (fn (x, acc) => if String.size(x) > String.size(acc) then x else acc) "" ls

(* 3. *)

fun longest_string2(xs: string list) =
    case xs of
        [] => ""
      | ls => List.foldl (fn (x, acc) => if String.size(x) >= String.size(acc) then x else acc) "" ls

(* 4. *)

val longest_string_helper = fn f => List.foldl (fn (x, acc) => if f(String.size(x),String.size(acc)) then x else acc) ""

val longest_string3 = longest_string_helper (fn (a,b) => a > b)
val longest_string4 = longest_string_helper (fn (a,b) => a >= b)

val longest_capitalized = (longest_string1 o only_capitals)

val rev_string = (String.implode o rev o String.explode)

fun first_answer f ls =
    case ls of
        [] => raise NoAnswer
      | x::xs => if isSome (f x)
                 then valOf (f x)
                 else first_answer f xs

(* A => [B] option -> [A] -> [B] option *)

(* take f and ls, apply f to ls item, get SOME(items) or NONE then
 concat SOME(items) with SOME(items) to get SOME(items) *)

fun all_answers f ls =
    let
        fun aux(ls, acc) = case ls of
            [] => SOME acc
          | x::xs => case f x of
            SOME ls1 => aux(xs, ls1@acc)
          | NONE => NONE
    in
        aux(ls, []) 
    end

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

val count_wildcards = g (fn _ => 1) (fn _ => 0)

val count_wild_and_variable_lengths = g (fn _ => 1) (fn x => String.size x)

val count_some_var = fn (x,p) => g (fn _ => 0) (fn y => if x = y then 1 else 0) p

fun check_pat p =
    let
        fun vars(p, acc) =
            case p of
                Variable x => x::acc
              | ConstructorP(_, p) => vars(p, acc)
              | TupleP ps => List.foldl (fn (p, acc) => vars(p, []) @ acc) [] ps
              | _ => []
        fun noRepeats(ps) =
            case ps of
                [] => true
              | x::xs =>
                  if List.exists (fn y => x = y) xs
                  then false
                  else noRepeats(xs)
    in
      (noRepeats o vars)(p, [])
    end

    fun match(v: valu, p: pattern): (string * valu) list option =
        case p of
            UnitP => NONE
          | Wildcard => SOME []
          | Variable x => SOME [(x, v)]