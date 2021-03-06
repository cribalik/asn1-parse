%{
#include <stdio.h>
#include "array.h"
#include "defs.h"

#include "y.tab.h"

%}

%option yylineno

%%
NULL                return TOK_NULL;
PrintableString     return PRINTABLE_STRING;
IA5String           return IA5_STRING;
UTF8String          return UTF8_STRING;
ENUMERATED          return ENUMERATED;
SIZE                return SIZE;
BOOLEAN             return BOOLEAN;
BIT\ STRING         return BIT_STRING;
OCTET\ STRING       return OCTET_STRING;
\.\.                return DOUBLEDOT;
\.\.\.              return TRIPLEDOT;
OPTIONAL            return OPTIONAL;
INTEGER             return INTEGER;
DEFINITIONS         return DEFINITIONS;
TAGS                return TAGS;
BEGIN               return BEGIN_;
END                 return END_;
IMPLICIT            return IMPLICIT;
CHOICE              return CHOICE;
SEQUENCE            return SEQUENCE;
OF                  return OF;
[A-Za-z_][A-Za-z_0-9-]*[A-Za-z]*  yylval.string = strdup(yytext); return NAME;
::=                 return ASSIGNMENT;
\{                  return '{';
\}                  return '}';
\[                  return '[';
\]                  return ']';
\(                  return '(';
\)                  return ')';
-?[0-9]+            yylval.number = atoi(yytext); return NUMBER;
,                   return ',';
--.*$               /* ignore comments */;
[ \t\n\r]+          /* ignore whitespace */;
%%
