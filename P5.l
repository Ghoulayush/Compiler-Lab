/* Design a LEX Code to replace all the white spaces of ‘Input.txt’ file by a single blank character and store the output in ‘Output.txt’ file */ 

%{
#include <stdio.h>
%}

%%

[ \t\n\r]+    { fprintf(yyout, " "); }
.             { fprintf(yyout, "%s", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt","w");
    yylex();

    fclose(yyin);
    fclose(yyout);
    
    printf("Processing complete. Check output.txt\n");
    return 0;
}
