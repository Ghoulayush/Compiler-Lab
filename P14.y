%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin, *yyout;
void yyerror(const char *s);
int yylex();
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
START : START LINE
| LINE
;
LINE : E '\n' {
fprintf(yyout, "Result: %d\n", $1);
}
| '\n' { }
;
E : E '+' E { $$ = $1 + $3; }
| E '-' E { $$ = $1 - $3; }
| E '*' E { $$ = $1 * $3; }
| E '/' E {
if ($3 == 0) {
fprintf(yyout, "Error: Division by zero\n");
$$ = 0;
} else {
$$ = $1 / $3;
}
}
| '(' E ')' { $$ = $2; }
| NUM { $$ = $1; }
;
%%
void yyerror(const char *s){
fprintf(yyout, "Invalid Expression\n");
}
int main(){
yyin = fopen("Input.txt", "r");
yyout = fopen("Output.txt", "w");
if (!yyin || !yyout) {
printf("File Error\n");
return 1;}
yyparse();
fclose(yyin);
fclose(yyout);
return 0;
}
