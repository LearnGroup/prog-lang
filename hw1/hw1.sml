fun year(date : (int * int * int)) = 
	#1 date

fun month(date : (int * int * int)) = 
	#2 date

fun day(date : (int * int * int)) = 
	#3 date

fun is_older(d1 : (int * int * int), d2 : (int * int * int)) = 
	year d1 < year d2 orelse (year d1 = year d2 andalso (month d1 < month d2 
		orelse (month d1 = month d2 andalso day d1 < day d2)))

fun number_in_month(xs : (int * int * int) list, m : int) = 
	if null xs 
	then 0
	else (if m = (month (hd xs)) then 1 else 0) + number_in_month(tl xs, m)

fun number_in_months(date_xs : (int * int * int) list, m_xs : int list) = 
	if null m_xs 
	then 0
	else number_in_month(date_xs, hd m_xs) + number_in_months(date_xs, tl m_xs)

fun dates_in_month(date_xs : (int * int * int) list, m : int) = 
	if null date_xs
	then []
	else 
		if m = month (hd date_xs) 
		then (hd date_xs)::dates_in_month(tl date_xs, m)
		else dates_in_month(tl date_xs, m)

fun dates_in_months(date_xs : (int * int * int) list, m_xs : int list) = 
	if null m_xs 
	then []
	else dates_in_month(date_xs, hd m_xs) @ dates_in_months(date_xs, tl m_xs)

fun get_nth(xs : string list, n : int) = 
	if n = 1
	then hd xs
	else get_nth(tl xs, n - 1)

fun date_to_string(date : (int * int * int)) = 
	let 
		val m_names = ["January", "February", "March", "April", "May", "June", 
			"July", "August", "September", "October", "November", "December"]
		fun format(y : string, m : string, d : string) = 
			m ^ " " ^ d ^ ", " ^ y
	in
		format(Int.toString(year date), get_nth(m_names, month date), 
			Int.toString(day date))
	end

fun number_before_reaching_sum(sum : int, xs : int list) = 
	if sum <= hd xs 
	then 0
	else 1 + number_before_reaching_sum(sum - hd xs, tl xs)

fun what_month(d : int) = 
	let
		val m_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	in
		1 + number_before_reaching_sum(d, m_days)
	end

fun month_range(d1 : int, d2 : int) = 
	if d1 > d2
	then []
	else what_month(d1) :: month_range(d1 + 1, d2)

fun oldest(date_xs : (int * int * int) list) = 
	if null date_xs
	then NONE
	else
		let
			val tl_oldest = oldest(tl date_xs)
			val hd_date = hd date_xs
		in
			if (not (isSome tl_oldest)) orelse is_older(hd_date, valOf tl_oldest)
			then SOME hd_date
			else tl_oldest
		end

fun remove_dup(xs : int list) = 
	let
		fun is_in(num : int, xs : int list) = 
			if null xs 
			then false
			else num = hd xs orelse is_in(num, tl xs)
	in
		if null xs
		then []
		else 
			let 
				val tl_res = remove_dup(tl xs)
			in
				if is_in(hd xs, tl_res) 
				then tl_res
				else (hd xs) :: tl_res
			end
	end

fun number_in_months_challenge(date_xs : (int * int * int) list, m_xs : int list) = 
	number_in_months(date_xs, remove_dup(m_xs))

fun dates_in_months_challenge(date_xs : (int * int * int) list, m_xs : int list) = 
	dates_in_months(date_xs, remove_dup(m_xs))

fun reasonable_date(date : (int * int * int)) = 
	let
		fun divisible(divisor :int, divident : int) = 
			0 = (divisor mod divident)

		fun is_leap(y : int) = 
			divisible(y, 400) orelse (divisible(y, 4) andalso (not (divisible(y, 100))))

		fun reasonable_year(y : int) =
			y > 0

		fun reasonable_month(m : int) = 
			m > 0 andalso m <= 12

		fun reasonable_day(d : int, max_d : int) = 
			d > 0 andalso d <= max_d

		val m_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

		fun get_nth(xs : int list, n : int) = 
			if n = 1
			then hd xs
			else get_nth(tl xs, n - 1)

		fun max_day(y : int, m : int) = 
			if m = 2
			then get_nth(m_days, m) + (if is_leap(y) then 1 else 0)
			else get_nth(m_days, m)
	in
		reasonable_year(year date) andalso reasonable_month(month date) andalso 
			reasonable_day(day date, max_day(year date, month date))
	end
