/* Design a DFA in LEX Code that input string of patterns ending with 1 0 over input alphabet */ 

%{
#include <stdio.h>
%}

%%
[01]*10\n    { printf("Accepted\n"); }
[01]*\n      { printf("Rejected\n"); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
\
