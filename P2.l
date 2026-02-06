/* PRACTICAL 2 : Design a LEX Code to identify and print valid identifier of C / C++ in a given input pattern */ 

%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { printf("Found Valid Identifier: %s\n", yytext); }
.|\n            {}
%%
int main() { 
    printf("Enter text:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
