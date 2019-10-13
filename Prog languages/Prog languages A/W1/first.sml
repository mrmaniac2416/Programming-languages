(*this is a comment*)

val x=34;
(*dynamic enivorment : x-->34*)
val y=17;
(*dynamic environment : x-->34,y->>17*)
val z=(x+y)+(y+2);
(*dynamic environment*)
val q=z+b;
(*
val val_of_z= if z<0 0-z else z;
	*)