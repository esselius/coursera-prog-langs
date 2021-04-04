use "homework1.sml";

val test01x1 = is_older((2020,1,1),   (2021,12,31)) = true
val test01x2 = is_older((2020,12,1),  (2021,12,31)) = true
val test01x3 = is_older((2021,1,1),   (2021,12,31)) = true
val test01x4 = is_older((2021,12,30), (2021,12,31)) = true
val test01x5 = is_older((2022,1,1),   (2021,12,31)) = false
val test01x6 = is_older((2022,12,1),  (2021,12,31)) = false
val test01x7 = is_older((2022,12,30), (2021,12,31)) = false
val test01x8 = is_older((2022,12,31), (2021,12,31)) = false

val test02x1 = number_in_month([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], 2) = 1
val test02x2 = number_in_month([(2022,1,31), (2022,2,31), (2022,3,31), (2022,4,31)], 2) = 1
val test02x3 = number_in_month([(2022,4,31), (2022,4,31), (2022,4,31), (2022,4,31)], 4) = 4
val test02x4 = number_in_month([(2022,4,31), (2022,4,31), (2022,4,31), (2022,4,31)], 8) = 0
val test02x5 = number_in_month([], 1) = 0

val test03x1 = number_in_months([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], [1, 2]) = 3
val test03x2 = number_in_months([(2022,1,31), (2022,2,31), (2022,3,31), (2022,4,31)], [3, 4]) = 2
val test03x3 = number_in_months([(2022,4,31), (2022,4,31), (2022,4,31), (2022,4,31)], [4]) = 4
val test03x4 = number_in_months([(2022,4,31), (2022,4,31), (2022,4,31), (2022,4,31)], [3]) = 0
val test03x5 = number_in_months([(2022,4,31), (2022,4,31), (2022,4,31), (2022,4,31)], []) = 0
val test03x6 = number_in_months([], [3]) = 0
val test03x7 = number_in_months([], []) = 0

val test04x1 = dates_in_month([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], 1) = [(2022,1,31), (2022,1,31)]
val test04x2 = dates_in_month([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], 2) = [(2022,2,31)]
val test04x3 = dates_in_month([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], 4) = []
val test04x4 = dates_in_month([], 1) = []

val test05x1 = dates_in_months([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], [1]) = [(2022,1,31), (2022,1,31)]
val test05x2 = dates_in_months([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], [2, 3]) = [(2022,2,31), (2022,3,31)]
val test05x3 = dates_in_months([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], []) = []
val test05x4 = dates_in_months([], [3]) = []
val test05x5 = dates_in_months([], []) = []

val test06x1 = get_nth(["a", "b", "c", "d"], 1) = "a"
val test06x2 = get_nth(["a", "b", "c", "d"], 2) = "b"
val test06x3 = get_nth(["a", "b", "c", "d"], 3) = "c"

val test07x1 = date_to_string((2022,1,1))  = "January 1, 2022"
val test07x2 = date_to_string((2022,5,1))  = "May 1, 2022"
val test07x3 = date_to_string((2028,3,28)) = "March 28, 2028"

val test08x1 = number_before_reaching_sum(30, [20, 10, 3]) = 1
val test08x2 = number_before_reaching_sum(30, [20, 5, 2, 3]) = 3
val test08x3 = number_before_reaching_sum(30, [30, 5, 2, 3]) = 0

val test09x1 = what_month(24) = 1
val test09x2 = what_month(290) = 10
val test09x3 = what_month(100) = 4

val test10x1 = month_range(98, 100) = [4, 4, 4]
val test10x2 = month_range(100, 24) = []
val test10x3 = month_range(30, 34)  = [1, 1, 2, 2, 2]
val test10x4 = month_range(33, 34)  = [2, 2]

val test11x1 = oldest([]) = NONE
val test11x2 = oldest([(2020,1,1)]) = SOME (2020,1,1)
val test11x3 = oldest([(2020,1,1), (2021,1,1)]) = SOME (2020,1,1)
val test11x4 = oldest([(2020,1,1), (2019,1,1)]) = SOME (2019,1,1)
val test11x5 = oldest([(2010,1,1), (2019,1,1), (2022,1,1), (2019,1,1), (2000,1,1), (2089,1,1)]) = SOME (2000,1,1)

val test12x1 = number_in_months_challenge([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], [1, 2, 2, 2]) = 3
val test12x2 = number_in_months_challenge([(2022,1,31), (2022,2,31), (2022,3,31), (2022,4,31)], [3, 4,4]) = 2
val test12x3 = number_in_months_challenge([(2022,4,31), (2022,4,31), (2022,4,31), (2022,4,31)], [4,4]) = 4

val test12x4 = dates_in_months_challenge([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], [1, 1]) = [(2022,1,31), (2022,1,31)]
val test12x5 = dates_in_months_challenge([(2022,1,31), (2022,1,31), (2022,2,31), (2022,3,31)], [2, 3, 3]) = [(2022,2,31), (2022,3,31)]