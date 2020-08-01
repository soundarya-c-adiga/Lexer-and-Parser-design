%{
#include<stdio.h>
#include<stdlib.h>
extern int ln;
extern int *yyin;
extern int yylex();
extern int idc;
extern int sc;
extern int kc;
extern int opc;
%}

%token SP CHAR SWITCH CASE BREAK INT COMMA ID NUMBER NEWLINE SC START BEGINS END PRINTF RET COLON SQ OB CB OP

%%
s:START NEWLINE declaration NEWLINE switch_body NEWLINE RET SC NEWLINE{printf("\nCompilation successful.This is a valid grammar\nNo of identifiers: %d\nNo of seperators: %d\nNo of keyword: %d\nNo of operators: %d\n",idc,sc,kc,opc);exit(0);}
 ;
declaration: CHAR SP ID SC NEWLINE INT SP ID COMMA ID SC
           | INT SP ID COMMA ID SC NEWLINE CHAR SP ID SC
           ;
switch_body:SWITCH OB ID CB NEWLINE BEGINS NEWLINE caselist NEWLINE END
           ;
caselist:case_stm NEWLINE case_stm
        ;
case_stm: CASE SP SQ OP SQ COLON NEWLINE PRINTF OB ID OP ID CB SC NEWLINE BREAK SC
        ;

%%
int yyerror(char *msg)
{
printf("\nCompilation error\n");
fprintf(stderr,"\nError at line %d\n",ln-1);
exit(0);
}
void main(int argc,char *argv[])
{
if(argc!=2)
{
printf("Please enter 2 filename!");

}
yyin=fopen(argv[1],"r");
yyparse();
}






