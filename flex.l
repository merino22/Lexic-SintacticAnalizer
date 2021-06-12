/*** Definition Section has one variable
which can be accessed inside yylex()
and main() ***/
%{
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
%}

%{
int num1 = 0;
int num2 = 0;
int result = 0;
int operador = 0;
%}
 
/*** Rule Section has three rules, first rule
matches with capital letters, second rule
matches with any character except newline and
third rule does not take input after the enter***/
%%
[A-Z] {printf("%s capital letter\n", yytext);}
[0-9]+ {printf("%s number\n", yytext); 
	if(num1)
	num2 = atoi(yytext);
	else
	num1=atoi(yytext);
	if(operador > 0)
	{
	printf("Operador %d", operador);
	   switch (operador){
	case 1:
	  result=num1 + num2;
	  operador = 0;
	  num1 = result;
	  num2 = 0;
	  break;
	case 2:
	  result= num1 - num2;
	  operador = 0;
	  num1 = result;
	  num2 = 0;
	  break;
	  case 3:
	  result= num1 * num2;
	  operador = 0;
	  num1 = result;
	  num2 = 0;
	  break;
	  case 4:
	  result= num1 / num2;
	  operador = 0;
	  num1 = result;
	  num2 = 0;
	  break;
	  case 5:
	  result= pow(num1, num2);
	  operador = 0;
	  num1 = result;
	  num2 = 0;
	  break;
	  default:
	  operador = 0;
	  break;
	};
	};
	printf("num1 %d num2 %d\n", num1, num2);}
[+]     {printf("%s sum\n", yytext); operador = 1;}
[-]     {printf("%s sub\n", yytext); operador = 2;}
[*]     {printf("%s mult\n", yytext); operador = 3;}
[/]     {printf("%s div\n", yytext); operador = 4;}
[\^]     {printf("%s pwr\n", yytext); operador = 5;}
\n    {return 0;}
%%
 
/*** Code Section prints the number of
capital letter present in the given input***/
int yywrap(){}
//int powerx(int num1, int num2){return pow(num1, num2);}
int main(){
 
// Explanation:
// yywrap() - wraps the above rule section
/* yyin - takes the file pointer
          which contains the input*/
/* yylex() - this is the main flex function
          which runs the Rule Section*/
// yytext is the text in the buffer
 
// Uncomment the lines below
// to take input from file
// FILE *fp;
// char filename[50];
// printf("Enter the filename: \n");
// scanf("%s",filename);
// fp = fopen(filename,"r");
// yyin = fp;
 
yylex();
printf("\nResult %d\n", result);
 
return 0;
}
