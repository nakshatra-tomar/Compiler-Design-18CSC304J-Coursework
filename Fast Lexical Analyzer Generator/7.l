%{ 
#include <stdio.h> 
#include <string.h> 
void check(char *); 
int yywrap(void); 
%} 
%% 
[a-zA-Z]+ { check(yytext); } 
%% 
int main() { 
yylex(); 
return 0; 
} 
void check(char *str) { 
FILE *fp; 
char temp[30]; 
fp = fopen("input.txt", "r"); 
while ((fscanf(fp, "%s", temp)) != EOF) { 
if (!(strcmp(temp, str))) { 
printf("FOUND\n"); 
fclose(fp); 
return; 
} 
} 
printf("NOT FOUND\n"); 
fclose(fp); 
} 
int yywrap(void) { 
return 1; 
}