%{ 
#include <stdio.h> 
%} 
%option noyywrap 
%% 
^[aeiouAEIOU][a-zA-Z]*$   printf("Accepted: %s\n", yytext); 
.       printf("Not Accepted\n");          
%% 
int main() { 
yylex(); 
return 0; 
}