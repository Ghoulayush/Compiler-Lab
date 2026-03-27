%{
#include <stdio.h>
%}

%x STRING_MIDDLE STRING_FINAL CHAR_MIDDLE CHAR_FINAL
%%

<INITIAL>\"                         { BEGIN STRING_MIDDLE; printf("STRING INITIAL: %s\n", yytext); }
<STRING_MIDDLE>[^\"]                { printf("STRING MIDDLE: %s\n", yytext); }
<STRING_MIDDLE>\"                   { BEGIN INITIAL; printf("STRING FINAL: %s\n", yytext); }

<INITIAL>'                          { BEGIN CHAR_MIDDLE; printf("CHAR INITIAL: %s\n", yytext); }
<CHAR_MIDDLE>[^']                   { printf("CHAR MIDDLE: %s\n", yytext); }
<CHAR_MIDDLE>'                      { BEGIN INITIAL; printf("CHAR FINAL: %s\n", yytext); }

<INITIAL>[0-9]*"."[0-9]+            { printf("FLOAT_LITERAL: %s\n", yytext); }
<INITIAL>[0-9]+                     { printf("INT_LITERAL: %s\n", yytext); }
<INITIAL>[a-zA-Z_][a-zA-Z0-9_]*     { printf("IDENTIFIER: %s\n", yytext); }

<INITIAL>[ \t\n]+                   ;
<INITIAL>.                          { printf("UNKNOWN: %s\n", yytext); }
%%

int main() {
  printf("Write:\n");
  yylex();
  return 0;
}

int yywrap() {
  return 1;
}
