%{
#include <stdio.h>
extern FILE *yyin, *yyout;
%}
%s A B X
%%
<INITIAL>a BEGIN B;
<INITIAL>b BEGIN A;
<INITIAL>\n { fprintf(yyout, "Accepted\n"); }
<INITIAL>[^ab\n] { fprintf(yyout, "INVALID\n"); BEGIN INITIAL; }
<B>a BEGIN INITIAL;
<B>b BEGIN X;
<B>\n { fprintf(yyout, "Not Accepted\n"); BEGIN INITIAL; }
<B>[^ab\n] { fprintf(yyout, "INVALID\n"); BEGIN INITIAL; }
<A>a BEGIN X;
<A>b BEGIN INITIAL;
<A>\n { fprintf(yyout, "Not Accepted\n"); BEGIN INITIAL; }
<A>[^ab\n] { fprintf(yyout, "INVALID\n"); BEGIN INITIAL; }
<X>a BEGIN A;
<X>b BEGIN B;
<X>\n { fprintf(yyout, "Not Accepted\n"); BEGIN INITIAL; }
<X>[^ab\n] { fprintf(yyout, "INVALID\n"); BEGIN INITIAL; }
%%
int main(){
yyin = fopen("Input.txt", "r");
yyout = fopen("Output.txt", "w");
yylex();
printf("Results in Output.txt");
fclose(yyin);
fclose(yyout);
return 0;
}
int yywrap() {return 1;}

