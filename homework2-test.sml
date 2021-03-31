use "homework2.sml";

val test1Ax1 = all_except_option("hi", ["hello", "you"]) = NONE
val test1Ax2 = all_except_option("hi", ["hi", "stranger"]) = SOME ["stranger"]
val test1Ax3 = all_except_option("hello", ["hello", "fellow", "sports", "person"]) = SOME ["fellow", "sports", "person"]
val test1Ax4 = all_except_option("sports", ["hello", "fellow", "sports", "person"]) = SOME ["hello", "fellow", "person"]

val test1Bx1 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val test1Bx2 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test1Cx1 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val test1Cx2 = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test1Dx1 = similar_names([
       ["Fred","Fredrick"],
       ["Elizabeth","Betty"],
       ["Freddie","Fred","F"]
    ], {first="Fred", middle="W", last="Smith"})
     = 
    [
        {first="Fred", last="Smith", middle="W"},
        {first="Fredrick", last="Smith", middle="W"},
        {first="Freddie", last="Smith", middle="W"},
        {first="F", last="Smith", middle="W"}
    ]