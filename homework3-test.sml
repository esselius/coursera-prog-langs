use "homework3.sml";

val test1x1 = only_capitals(["abc", "qwe", "zxc", "Peter"]) = ["Peter"]

val test2x1 = longest_string1([]) = ""
val test2x2 = longest_string1(["hej"]) = "hej"
val test2x3 = longest_string1(["hej", "a", "qweqwe"]) = "qweqwe"
val test2x4 = longest_string1(["hejhej", "a", "qweqwe"]) = "hejhej"

val test3x1 = longest_string2([]) = ""
val test3x2 = longest_string2(["hej"]) = "hej"
val test3x3 = longest_string2(["hej", "a", "qweqwe"]) = "qweqwe"
val test3x4 = longest_string2(["hejhej", "a", "qweqwe"]) = "qweqwe"

val test4x1 = longest_string_helper (fn (a, b) => a > b) ["a", "ab", "abc"] = "abc"
val test4x2 = longest_string3(["hejhej", "a", "qweqwe"]) = "hejhej"
val test4x3 = longest_string4(["hejhej", "a", "qweqwe"]) = "qweqwe"

val test5x1 = longest_capitalized(["helloyou", "Peter", "lol", "Adam"]) = "Peter"

val test6x1 = rev_string("hejsan") = "nasjeh"

val test7x1 = (first_answer (fn _ => SOME 0) [] handle NoAnswer => 0) = 0
val test7x2 = first_answer (fn i => SOME i) [0] = 0
val test7x3 = first_answer (fn i => if i = 1 then SOME i else NONE) [0,1] = 1

val test8x1 = all_answers (fn _ => NONE) [] = SOME []
val test8x2 = all_answers (fn _ => SOME [0]) [] = SOME []
val test8x3 = all_answers (fn _ => NONE) [0] = NONE
val test8x4 = all_answers (fn i => SOME [i]) [0] = SOME [0]

val test9Ax1 = count_wildcards Wildcard = 1
val test9Ax2 = count_wildcards (Variable "hi") = 0
val test9Ax3 = count_wildcards (TupleP [Wildcard, Wildcard]) = 2
val test9Ax4 = count_wildcards (ConstructorP("helo", Wildcard)) = 1

val test9Bx1 = count_wild_and_variable_lengths (TupleP [Wildcard, Variable "abc"]) = 4

val test9Cx1 = count_some_var("hey", Variable "you") = 0
val test9Cx2 = count_some_var("hey", TupleP [Wildcard, Variable "hey", TupleP [Variable "hey"]]) = 2
val test9Cx3 = count_some_var("hey", Wildcard) = 0