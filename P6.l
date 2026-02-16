/* Design a LEX Code to remove the comments from any C-Program (in.c ) given at runtime and store into ‘out.c’ file */

%{
  #include<stdio.h>
  extern FILE *yyin,*yyout;
%}

%%
"//".* {;}
"/*"([^*]|\*+[^*/])*"\*/" {;}
. {fprintf(yyout,"%s",yytext);}
%%

int main(){
  printf("Input read from file\n");
  yyin=fopen("in.c","r");
  yyout=fopen("out.c","w");
  yylex();
  printf("Comments removal done!!\nOutput written to file\n");
  fclose(yyin);
  fclose(yyout);
  return 0;
}

int yywrap(){
  return 1;
}
