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
LINE : E '\n' { fprintf(yyout, "Valid Expression\n"); }
| '\n' { }
;
E : E '+' E
| E '-' E
| E '*' E
| E '/' E
| '(' E ')'
| NUM
;
%%
void yyerror(const char *s)
{
fprintf(yyout, "Invalid Expression\n");
}
int main()
{
yyin = fopen("Input.txt", "r");
yyout = fopen("Output.txt", "w");
if (!yyin || !yyout) {
printf("File Error\n");
return 1;
}
yyparse();
fclose(yyin);
fclose(yyout);
return 0;
}
