%{
#include "y.tab.h"
#include <stdio.h>
%}
%%
[0-9]+ { return NUM; }
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
