%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin, *yyout;
void yyerror(const char *s);
int yylex();
%}
%token A B
%%
START : START LINE
| LINE
;
LINE : S '\n' { fprintf(yyout, "Valid String\n"); }
| '\n' { /* empty line ignore */ }
;
S : A S B
| A B
;
%%
void yyerror(const char *s)
{
fprintf(yyout, "Invalid String\n");
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
