%{
  #include<stdio.h>
  extern FILE *yyin;
  int chars = 0,words = 0,spaces = 0,lines = 0;
%}
%%
\n              { lines++;}
" "             { spaces++;}
\t              { spaces++;}
[a-zA-Z0-9_]+   { words++; chars += yyleng; }
.               { chars++; }
%%
int yywrap()
{    return 1;}
int main()
{
  yyin = fopen("input.txt","r");
  printf("Input taken from file: input.txt \n");
  yylex();
  printf("Total Characters : %d  Total Words : %d\n", chars, words);
  printf("Total Whitespaces : %d  Total Lines : %d\n", spaces, lines);
  fclose(yyin);
}
