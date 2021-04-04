use "homework2.sml";

val test1Ax1 = all_except_option("hi", ["hello", "you"]) = NONE
val test1Ax2 = all_except_option("hi", ["hi", "stranger"]) = SOME ["stranger"]
val test1Ax3 = all_except_option("hello", ["hello", "fellow", "sports", "person"]) = SOME ["fellow", "sports", "person"]
val test1Ax4 = all_except_option("sports", ["hello", "fellow", "sports", "person"]) = SOME ["hello", "fellow", "person"]

val test1Bx1 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val test1Bx2 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"]
val test1Bx3 = get_substitutions1([], "hi") = []

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

val test2Ax1 = card_color(Spades, Ace) = Black

val test2Bx1 = card_value(Spades, Ace) = 11
val test2Bx2 = card_value(Spades, King) = 10
val test2Bx3 = card_value(Spades, Num 4) = 4

val test2Cx1 = remove_card([(Spades, Ace), (Spades, Num 4)], (Spades, Num 4), IllegalMove) = [(Spades, Ace)]
val test2Cx2 = remove_card([(Spades, Ace), (Spades, Num 4)], (Spades, Ace), IllegalMove) = [(Spades, Num 4)]

val test2Dx1 = all_same_color([(Spades, Ace), (Hearts, Ace)]) = false
val test2Dx2 = all_same_color([(Hearts, Num 3), (Hearts, Ace)]) = true

val test2Ex1 = sum_cards([(Spades, Ace), (Spades, Num 4), (Spades, Ace)]) = 26

val test2Fx1 = score([(Spades, Ace), (Spades, Num 4), (Spades, King)], 10) = 22

val test2Gx1 = officiate([(Spades, Ace), (Spades, Num 4), (Spades, King)], [Draw, Discard (Spades, Ace)], 10) = 5
val test2Gx2 = officiate([(Spades, Ace), (Spades, Num 4), (Spades, King)], [Draw, Draw, Draw, Discard (Spades, King)], 10) = 7
val test2Gx3 = officiate([(Spades, Ace), (Hearts, Num 4), (Spades, King)], [Draw, Draw, Draw, Discard (Spades, Ace)], 10) = 12
val test2Gx4 = officiate([(Spades, Ace), (Hearts, Num 4), (Spades, King)], [Draw, Draw, Draw, Draw, Draw], 1) = 72