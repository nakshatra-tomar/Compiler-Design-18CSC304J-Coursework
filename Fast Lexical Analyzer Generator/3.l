%{
#include <stdio.h>
int char_count = 0;
int space_count = 0;
int tab_count = 0;
%}

%option noyywrap

%%

[\t] { tab_count++; }
[ ] { space_count++; }
\n { char_count++; }
. { char_count++; }

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error opening file.\n");
        return 1;
    }
    yyin = file;
    yylex();
    printf("Total characters: %d\n", char_count);
    printf("Total spaces: %d\n", space_count);
    printf("Total tabs: %d\n", tab_count);
    fclose(file);
    return 0;
}
