%{
#include <stdio.h>
#include <math.h>

int yylex();
int yyerror(char *s);
int counter;
void Informer(int type, int fNumber, int sNumber);
%}

%token NUM
%token SUM SUB MUL DIV POW ABS
%token EOL



%%

stms: | stms stm EOL  {
printf("\nResultado: %d\n", $2); counter = 0;
printf("--------------------------------------------"); 
printf("\nIngrese sus operaciones matematicas:\n\n"); 
}
;

stm: factor
    | factor SUM stm {Informer(1,$1,$3); $$ = $1 + $3;}
    | factor SUB stm {Informer(2,$1,$3); $$ = $1 - $3;}
    ;
factor: term 
    | factor DIV term {Informer(3,$1,$3); $$ = $1 / $3;}
    | factor MUL term {Informer(4,$1,$3); $$ = $1 * $3;}
    | factor POW term {Informer(5,$1,$3); $$ = pow($1,$3);}
    ;
term: NUM
    | ABS term {$$ = $2 >= 0? $2 : - $2; }
    ;
%%

void Informer(int type, int fNumber, int sNumber){
    counter++;

    printf("Paso %d",counter); 
    switch(type){
        case 1:
        
        printf(": Sumar los numeros: "); 
        ;
        break;
        case 2:
        printf(": Restar los numeros: ");
        ;
        break;
        case 3:
        printf(": Dividir los numeros: ");
        ;
        break;
        case 4:
        printf(": Multiplicar los numeros: ");
        ;
        break;
        case 5:
        printf(": Elevar los numeros: ");
        ;
        break;
    }
    printf("%d y ", fNumber); 
    printf("%d\n", sNumber);
}

main( int argc, char **argv )
{
    printf("****** Bienvenido a Simple Calculator *****\n\n Ingrese sus operaciones matematicas:\n \n ");

    yyparse();
  
}

yyerror(char *s){

	printf("Syntax Error on line %s\n", s);
}