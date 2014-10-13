datatype 'a my_list = 
	Empty 
	| Cons of 'a * 'a my_list

datatype ('a) my_option = 
	  MY_NONE 
	| MY_SOME of 'a

val x = MY_NONE
val y = MY_SOME "a"

val empty_list = Empty
val a_list = Cons("a", Cons("b", Empty))
