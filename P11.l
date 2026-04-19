%{
#include <stdio.h>
#include <string.h>
extern FILE *yyin, *yyout;
char buffer[100];
int i = 0;
%}
%x ID INT FLOAT
%%
<INITIAL>[a-zA-Z_] { i=0; buffer[i++]=yytext[0]; BEGIN(ID); }
<INITIAL>[0-9] { i=0; buffer[i++]=yytext[0]; BEGIN(INT); }
<INITIAL>[ \t\n] { }
<ID>[a-zA-Z0-9_] { buffer[i++]=yytext[0]; }
<ID>[^a-zA-Z0-9_] {
char c = yytext[0]; /* store safely */
buffer[i]='\0';
fprintf(yyout,"Identifier: %s\n",buffer);
BEGIN(INITIAL);
unput(c);
}
<INT>[0-9] { buffer[i++]=yytext[0]; }
<INT>\. { buffer[i++]=yytext[0]; BEGIN(FLOAT); }
<INT>[^0-9\.] {
char c = yytext[0];
buffer[i]='\0';
fprintf(yyout,"Integer: %s\n",buffer);
BEGIN(INITIAL);
unput(c);
}
<FLOAT>[0-9] { buffer[i++]=yytext[0]; }
<FLOAT>[^0-9] {
char c = yytext[0];
buffer[i]='\0';
fprintf(yyout,"Float: %s\n",buffer);
BEGIN(INITIAL);
unput(c);
}
%%
int main(){
  yyin = fopen("Input.txt", "r");
  yyout = fopen("Output.txt", "w");
  yylex();
  fclose(yyin);
  fclose(yyout);
  return 0;
}
int yywrap() { return 1; }
