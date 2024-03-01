%{ 
#include <stdio.h> 
%} 
%option noyywrap 
%% 
[^\n]+   { printf("Length of the given string is: %d\n", yyleng); } 
%% 
int main() { 
yylex(); 
return 0; 
} 
