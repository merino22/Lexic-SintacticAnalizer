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
printf("\n Resultado: %d\n", $2); counter = 0;
printf("--------------------------------------------"); 
printf("\n Operacion Matematica:\n\n"); 
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

    printf(" Paso %d",counter); 
    switch(type){
        case 1:
        
        printf(": Sumar: "); 
        ;
        break;
        case 2:
        printf(": Restar: ");
        ;
        break;
        case 3:
        printf(": Dividir: ");
        ;
        break;
        case 4:
        printf(": Multiplicar: ");
        ;
        break;
        case 5:
        printf(": Elevar: ");
        ;
        break;
    }
    printf("%d y ", fNumber); 
    printf("%d\n", sNumber);
}

int main( int argc, char **argv )
{
    printf("\e[1;1H\e[2J");
    printf("********** Analizador Lexico y Sintactico *********\n\n****** Proyecto #2 - Teoria de la Computacion *****\n\n Operacion Matematica:\n \n ");

    yyparse();
  
}

int yyerror(char *s){

	printf("Error Sintactico %s\n", s);
}