/* Unix style wc */

/* section 1: declaration and options settings */

%{
int chars = 0;
int words = 0;
int lines = 0;
%}

/* section 2: list of patters and actions */
%%

[a-zA-Z]+ { words++; chars += strlen(yytest); }
\n 	  { chars++; lines++;}
.	  { chars++; }

/* section 3: copy to generated scanner */
%%

main(int argc, char **argv)
{
  yylex();
  printf("%8d%8d%8d\n", lines, words, chars);
}
