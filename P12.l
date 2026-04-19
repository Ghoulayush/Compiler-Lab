%{
#include <stdio.h>
#include <stdlib.h>
%}

%s NAME AT DOMAIN DOT TLD DEAD

%%

<INITIAL>[a-zA-Z0-9._%+-]+    { BEGIN(NAME); }
<INITIAL>"\n"|"\r\n"          { printf("Invalid Email\n"); BEGIN(INITIAL); }
<INITIAL>.                    { BEGIN(DEAD); }

<NAME>"@"                     { BEGIN(AT); }
<NAME>"\n"|"\r\n"             { printf("Invalid Email\n"); BEGIN(INITIAL); }
<NAME>.                       { BEGIN(DEAD); }

<AT>[a-zA-Z0-9-]+             { BEGIN(DOMAIN); }
<AT>"\n"|"\r\n"               { printf("Invalid Email\n"); BEGIN(INITIAL); }
<AT>.                         { BEGIN(DEAD); }

<DOMAIN>"."                   { BEGIN(DOT); }
<DOMAIN>"\n"|"\r\n"           { printf("Invalid Email\n"); BEGIN(INITIAL); }
<DOMAIN>.                     { BEGIN(DEAD); }

<DOT>"com"                    { BEGIN(TLD); }
<DOT>"\n"|"\r\n"              { printf("Invalid Email\n"); BEGIN(INITIAL); }
<DOT>.                        { BEGIN(DEAD); }

<TLD>"\n"|"\r\n"              { printf("Valid Email\n"); BEGIN(INITIAL); }
<TLD>.                        { BEGIN(DEAD); }

<DEAD>[^\n\r]*                { /* Stay in dead state until newline */ }
<DEAD>"\n"|"\r\n"             { printf("Invalid Email\n"); BEGIN(INITIAL);}

%%

int main() {
  printf("Enter email to validate: ");
  yylex();
  return 0;
}

int yywrap() {
    return 1;
}
