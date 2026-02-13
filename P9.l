%{
#include <stdio.h>
#include <string.h>
%}

%%
(a|b)*a(a|b)(a|b) { printf("ACCEPTED: '%s'\n", yytext); }

.+  { 
    printf("REJECTED: '%s'\n", yytext); 
    if(strlen(yytext) < 3)
        printf("  Length less than 3\n");
    else
        printf("Third last character is not 'a'\n");
}

\n    { printf("REJECTED: empty string\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter strings to test (Ctrl+D to exit):\n\n");
    yylex();
    return 0;
}
