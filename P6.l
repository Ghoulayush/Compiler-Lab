/* Design a LEX Code to remove the comments from any C-Program (in.c ) given at runtime and store into ‘out.c’ file */

%{
  #include<stdio.h>
%}

%%
"//"[a-zA-Z]+    {printf("Comment: %s\n",yytext);}
"/*"(.|\n)*"*/" {printf("Comment: %s\n",yytext);}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
