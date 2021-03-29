use "homework2.sml";

val test1Ax1 = all_except_option("hi", ["hello", "you"]) = NONE
val test1Ax2 = all_except_option("hi", ["hi", "stranger"]) = SOME ["stranger"]
val test1Ax3 = all_except_option("hello", ["hello", "fellow", "sports", "person"]) = SOME ["fellow", "sports", "person"]
val test1Ax4 = all_except_option("sports", ["hello", "fellow", "sports", "person"]) = SOME ["hello", "fellow", "person"]

val test1Bx1 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val test1Bx2 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]