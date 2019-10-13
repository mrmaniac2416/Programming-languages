(*1*)
fun is_older(d1:int*int*int , d2:int*int*int)=
	if #1 d1< #1 d2
	then true
	else if #1 d1 > #1 d2
	then false
	else if #2 d1 < #2 d2
	then true
	else if #2 d1 > #2 d2
	then false
	else if #3 d1 < #3 d2
	then true
	else if #3 d1 > #3 d2
	then false
	else
	 false

(*2*)
fun number_in_month(ls:(int*int*int) list, mn : int)=
	if null ls
	then 0
	else if #2(hd ls)=mn
	then 1+number_in_month(tl ls,mn)
	else
	 number_in_month(tl ls,mn)
(*3*)

fun number_in_months(ls:(int*int*int) list,mns : int list)=
	if null mns
	then 0
	else
		number_in_month(ls,hd mns) + number_in_months(ls,tl mns)

(*4*)
fun dates_in_month(ls:(int*int*int) list, mn: int)=
	if null ls
	then ls
	else if #2(hd ls)=mn
		then hd ls :: dates_in_month(tl ls,mn)
	else
		dates_in_month(tl ls , mn)

fun append_lists(l1:(int*int*int) list,l2:(int*int*int) list)=
	if null l1
	then l2
	else
		hd l1 :: append_lists(tl l1,l2)

(*5*)
fun dates_in_months(ls:(int*int*int) list,mns : int list)=
	if null mns
	  then []
	 else 
	 	append_lists(dates_in_month(ls,hd mns),dates_in_months(ls,tl mns))

(*6*)


fun get_nth(s:string list,n: int)=
	if n=1
	then hd s
	else
		get_nth(tl s,n-1)

(*7*)


fun date_to_string(date:(int*int*int))=
	let
		val months = ["January","February","March","April","May","June"
		,"July","August","September","October","November","December"]
		val month=get_nth(months,#2(date))
		val day=Int.toString(#3 date)
		val year=Int.toString(#1 date)
	in
		month ^ " " ^ day ^ ", " ^ year
	end

(*8*)

fun number_before_reaching_sum_helper(sum:int , ls : int list, n : int)=	
	if sum-hd ls<=0

	then n
	else
		number_before_reaching_sum_helper(sum - hd ls , tl ls,n+1)


fun number_before_reaching_sum(sum:int , ls : int list)=
	number_before_reaching_sum_helper(sum,ls,0)


(*9*)

fun what_month(day : int )=
	let
		val days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31];
	in
		number_before_reaching_sum(day,days_in_month)+1
	end

(*10*)
fun month_range(day1 : int ,day2 : int)=
	if day1>day2
	 then []
	 else
	 	what_month(day1) :: month_range(day1+1,day2)


(*11*)


fun oldest(dates : (int*int*int ) list)=

	if null dates
	then NONE
	else

		let
			val ans = oldest(tl dates)
		in
			if isSome ans andalso is_older(valOf ans, hd dates)
			then ans
			else
				SOME (hd dates)
		end

fun remove_duplicates(xs: int list) = 
    let
        fun check(xs: int list, item: int) =
            if null xs
            then false
            else if hd xs = item
            then true
            else check (tl xs, item)
        fun go_through_list(xs: int list) =
            if null xs
            then []
            else if check(tl xs, hd xs)
                 then go_through_list(tl xs)
                 else hd xs :: go_through_list(tl xs)
    in
        go_through_list(xs)
    end

fun number_in_months_challenge(ls:(int*int*int) list,mns : int list)=
	 
      number_in_months(ls,remove_duplicates(mns))
   


