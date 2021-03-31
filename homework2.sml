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