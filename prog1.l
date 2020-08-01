%{
#include "y.tab.h"
int ln=0,idc=0,sc=0,kc=0,opc=0;
%}
%%
"int main()" {printf("\n %s --> keyword",yytext);kc++;return START;}
"return 0" {printf("\n %s --> keyword",yytext);kc++;return RET;}
"printf" {printf("\n %s --> keyword",yytext);kc++;return PRINTF;} 
":" {printf("\n %s --> seperator",yytext);sc++;return COLON;} 
"'" {printf("\n %s --> seperator",yytext);sc++;return SQ;} 
"(" {printf("\n %s --> seperator",yytext);sc++;return OB;} 
")" {printf("\n %s --> seperator",yytext);sc++;return CB;} 
" " {printf("\n ' ' --> seperator");sc++;return SP;} 
[+\-] {printf("\n %s --> Operator",yytext);opc++;return OP;}
"char" {printf("\n%s --> keyword",yytext);kc++;return CHAR;}
"switch" {printf("\n%s --> keyword",yytext);kc++;return SWITCH;}
"break" {printf("\n%s --> keyword",yytext);kc++;return BREAK;}
"begin" {printf("\n%s--> keyword",yytext);kc++;return BEGINS;}
"end" {printf("\n%s --> keyword",yytext);kc++;return END;}
"case" {printf("\n%s --> keyword",yytext);kc++;return CASE;}
"int" {printf("\n%s --> keyword",yytext);kc++;return INT;}
"," {printf("\n%s --> seperator",yytext);sc++;return COMMA;}
[a-zA-Z][a-zA-Z0-9]* {printf("\n%s --> identifier",yytext);idc++;return ID;}
[0-9]+ {printf("\n%s --> number",yytext);return NUMBER;}
[\n] {ln++;return NEWLINE;}
";" {printf("\n%s --> seperator",yytext);sc++;return SC;}
. {return yytext[0];}
%%
int yywrap()
{
return 1;
}
