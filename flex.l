
%{
#include <stdio.h>
#include <string.h>
#include "flex.tab.h"
int num;
%}

number ([0-9])+

%%
{number} { yylval = atoi(yytext);
 return NUM; 
 }

 "+" {return SUM;}
 "-" {return SUB;}
 "/" {return DIV;}
 "*" {return MUL;}
 "^" {return POW;}
 "|" {return ABS;}
 \n {return EOL;}
 . {/* nada */ }

%%
