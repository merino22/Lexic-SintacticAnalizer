default:
	clear
	flex -l flex.l
	bison -dv flex.y 
	gcc -o flex flex.tab.c lex.yy.c -lfl -lm
