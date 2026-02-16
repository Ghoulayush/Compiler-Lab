/* Design a LEX Code for tokenizing identify and print OPERATORS , SEPERATORS , KEYWORD , IDENTIFIERS */

%{
#include <stdio.h>
%}

%%
"int"|"float"|"while"|"if"|"else"    { printf("KEYWORD: %s\n", yytext); }
[0-9]*"."[0-9]+                     { printf("FLOAT_LITERAL: %s\n", yytext); }
[0-9]+                              { printf("INT_LITERAL: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*              { printf("IDENTIFIER: %s\n", yytext); }
"+"|"-"|"*"|"/"|"="|"<="|">="|"=="|"++"  { printf("OPERATOR: %s\n", yytext); }
";"|","|"("|")"|"{"|"}"             { printf("SEPARATOR: %s\n", yytext); }
[ \t\n]+                            ;
.                                   { printf("UNKNOWN: %s\n", yytext); }
%%

int main() {
  printf("Write:\n");
  yylex();
  return 0;
}

int yywrap() {
  return 1;
}
