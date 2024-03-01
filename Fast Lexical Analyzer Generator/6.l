%{
#include <stdio.h>
%}

%option noyywrap

DIGIT [0-9]
INTEGER {DIGIT}+
FLOAT {DIGIT}+"."{DIGIT}+

%%

{INTEGER} { printf("Valid integer: %s\n", yytext); }
{FLOAT} { printf("Valid float: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
