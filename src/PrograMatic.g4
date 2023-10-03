grammar PrograMatic;

IDENTIFIER : Letter (Letter | Digit | '_')*;
INTEGER_LITERAL : Digit+;
STRING_LITERAL : QUOTE (Character | '\\"')* QUOTE;


Letter : [a-zA-Z];
Digit : [0-9];
Character : . -> channel(HIDDEN);


PRIMITIVE_TYPES: 'int' | 'float' | 'char' | 'void' | 'str';

POINTER : '->';
SEMICOLON : ';';
PROCEDURE : 'prc';
LPAREN : '(';
RPAREN : ')';
LBRACE : '{';
RBRACE : '}';
COMMA : ',';
QUOTE: '"';

variableDeclaration : PRIMITIVE_TYPES IDENTIFIER SEMICOLON
                   | PRIMITIVE_TYPES POINTER IDENTIFIER SEMICOLON;

procedureDeclaration : PRIMITIVE_TYPES PROCEDURE IDENTIFIER LPAREN parameterList RPAREN LBRACE statements RBRACE;

procedureCall: IDENTIFIER LPAREN argumentList LBRACE SEMICOLON;

parameterList : (parameter (COMMA parameter)*)?;

argumentList: (IDENTIFIER (COMMA IDENTIFIER)*)?;

parameter : PRIMITIVE_TYPES IDENTIFIER;

statements: variableDeclaration | procedureDeclaration | procedureCall;