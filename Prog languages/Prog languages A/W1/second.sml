fun swap(pr :int*bool)=
	(#2 pr,#1 pr)

fun sum_two_pairs(pr1:int*int , pr2:int*int)=
	(#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2);

fun append(xs: int list, ys: int list)=
	if null xs
	then
	 ys
	else
		hd xs :: append(tl xs, ys)