%{
#include <stdio.h>
#include <stdlib.h>

int lines = 0, words = 0, letters = 0, numbers = 0, special_chars = 0, total = 0, space = 0;
%}

%%
\n { lines++; words++; }
[ \t]+ space++;
[a-zA-Z] letters++;
[0-9] numbers++;
.  special_chars++;
%%

int main()
{
    yyin = fopen("myinput.txt", "r");
    yylex();
    total = letters + numbers + special_chars;
    printf("\nFile contents...\n");
    printf("\n\t%d line", lines + 1);
    printf("\n\t%d words", words + 1);
    printf("\n\t%d characters", letters);
    printf("\n\t%d Digits", numbers);
    printf("\n\t%d Special Characters", special_chars);
    printf("\n\t%d Spaces", space);
    printf("\n\tTotal %d Characters", total);
}

int yywrap()
{
    return 1;
}
