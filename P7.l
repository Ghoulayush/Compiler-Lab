/* Design a LEX Code to extract all html tags in the HTML file given at run time and store into text file given at run time. */ 

%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
"<"[^>]+">"    { fprintf(yyout, "%s\n", yytext); }
.|\n           { ; }
%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("index.html", "r");
    yyout = fopen("output.txt", "w");

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("Success! Tags extracted to output.txt\n");
    return 0;
}
