/*  PRACTICAL 1 : Design a LEX code to count the number of lines, spaces, tab-meta characters and rest of characters in a given input pattern */

%{
  #include<stdio.h>
  int lines=0,spaces=0,tabs=0,others=0;
  extern FILE *yyin,*yyout;
%}

%%
\n  {lines++;}
" "  {spaces++;}
\t  {tabs++;}
.   {others++;}
%%

int main(){
  printf("enter the input:");
  yyin = fopen("output.txt","r");
  yylex();
  printf("\n Number of lines=%d\n",lines);
  printf("Number of spaces=%d\n",spaces);
  printf("Number of tabs=%d\n",tabs);
  printf("others=%d\n",others);
  fclose (yyin);
  return 0;
}

int yywrap(){
  return 1;
}
