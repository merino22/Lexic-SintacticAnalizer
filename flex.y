%{
#include <stdio.h>
#include <math.h>

int yylex();
int yyerror(char *s);
int counter;
%}

%token NUM
%token SUM SUB MUL DIV POW ABS
%token EOL



%%

stms: | stms stm EOL  {
printf("Resultado: %d\n", $2);
}
;

stm: factor
    | factor SUM stm {$$ = $1 + $3;}
    | factor SUB stm {$$ = $1 - $3;}
    ;
factor: term 
    | factor DIV term {$$ = $1 / $3;}
    | factor MUL term {$$ = $1 * $3;}
    | factor POW term {$$ = pow($1,$3);}
    ;
term: NUM
    | ABS term {$$ = $2 >= 0? $2 : - $2; }
    ;
%%

main( int argc, char **argv )
{
    yyparse();
  
}

yyerror(char *s){

	printf("Syntax Error on line %s\n", s);
}