%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}
%%
[0-9]+ { yylval = atoi(yytext); return NUM; }
\+ { return '+'; }
- { return '-'; }
\* { return '*'; }
\/ { return '/'; }
\( { return '('; }
\) { return ')'; }
\n { return '\n'; }
[ \t] { }
. { return yytext[0]; }
%%
int yywrap() { return 1; }
