%{
#include "y.tab.h"
#include <stdio.h>
%}
%%
a { return A; }
b { return B; }
\n { return '\n'; } /* VERY IMPORTANT */
[ \t] { }
. { return yytext[0]; }
%%
int yywrap() { return 1; }
