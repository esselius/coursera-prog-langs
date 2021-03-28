fun is_older((y1, m1, d1), (y2, m2, d2)) =
    if y1 < y2 then
        true
    else
        if y1 = y2 andalso m1 < m2 then
            true
        else
            if y1 = y2 andalso m1 = m2 andalso d1 < d2 then
                true
            else
                false

fun number_in_month(dates: (int * int * int) list, month: int) =
    if null dates
    then 0
    else
        if #2 (hd dates) = month
        then 1 + number_in_month(tl dates, month)
        else number_in_month(tl dates, month)

fun number_in_months(dates: (int * int * int) list, months: int list) =
    if null dates orelse null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates: (int * int * int) list, month: int) =
    if null dates
    then []
    else
        if #2 (hd dates) = month
        then (hd dates)::(dates_in_month(tl dates, month))
        else dates_in_month(tl dates, month)

fun dates_in_months(dates: (int * int * int) list, months: int list) =
    if null dates orelse null months
    then []
    else dates_in_month(dates, hd months)@dates_in_months(dates, tl months)

fun get_nth(items: 'a list, nth: int) =
    if nth = 1
    then hd items
    else get_nth(tl items, nth - 1)

fun date_to_string(date: (int * int * int)) =
    let
      val months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
    in
      get_nth(months, #2 date) ^ " " ^ Int.toString (#3 date) ^ ", " ^ Int.toString (#1 date)
    end

fun number_before_reaching_sum(sum: int, nums: int list) =
    if sum > hd nums
    then 1 + number_before_reaching_sum(sum - hd nums, tl nums)
    else 0

fun what_month(day: int) =
let
    val monthDays = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
in
    number_before_reaching_sum(day, monthDays) + 1
end

fun month_range(day1: int, day2: int) =
    if day1 > day2
    then []
    else what_month(day1)::month_range(day1+1, day2)
            
fun oldest(dates: (int * int * int) list) =
    if null dates
    then NONE
    else
        let
            val tl_dates = oldest(tl dates)
        in
            if isSome tl_dates andalso is_older((valOf tl_dates), (hd dates))
            then tl_dates
            else SOME (hd dates)
        end

fun is_unique(month: int, months: int list) =
    if null months
    then true
    else
        if month = (hd months)
        then false
        else is_unique(month, tl months)

fun dedup_months(months: int list) =
    if null months
    then []
    else
        if null (tl months)
        then [hd months]
        else
            if is_unique(hd months, tl months)
            then (hd months)::dedup_months(tl months)
            else dedup_months(tl months)

fun number_in_months_challenge(dates: (int * int * int) list, months: int list) =
    number_in_months(dates, dedup_months(months))

fun dates_in_months_challenge(dates: (int * int * int) list, months: int list) =
    dates_in_months(dates, dedup_months(months))