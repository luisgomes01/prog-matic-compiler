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
PLUS : '+';
MINUS : '-';
MULTIPLY : '*';
DIVIDE : '/';
MODULO : '%';
GREATER : '>';
LESS : '<';
EQUAL : '==';
NOT_EQUAL : '!=';
GREATER_EQUAL : '>=';
LESS_EQUAL : '<=';
LOGICAL_AND : '&&';
LOGICAL_OR : '||';
LOGICAL_NOT : '!';

ARITHMETIC_OPERATORS: PLUS | MINUS |  MULTIPLY | DIVIDE | MODULO;
RELATIONAL_OPERATORS:  EQUAL | NOT_EQUAL | LESS | GREATER | LESS_EQUAL | GREATER_EQUAL;

LOGICAL_OPERATORS:  LOGICAL_NOT | LOGICAL_AND | LOGICAL_OR;


program: statements EOF;

statements: (variableDeclaration | procedureDeclaration | procedureCall)*;

variableDeclaration : PRIMITIVE_TYPES IDENTIFIER SEMICOLON
                   | PRIMITIVE_TYPES POINTER IDENTIFIER SEMICOLON | PRIMITIVE_TYPES variableInitialization SEMICOLON;

variableInitialization: IDENTIFIER '=' expression;

procedureDeclaration : PRIMITIVE_TYPES PROCEDURE IDENTIFIER LPAREN parameterList RPAREN LBRACE statements RBRACE;

procedureCall: IDENTIFIER LPAREN argumentList LBRACE SEMICOLON;

parameterList : (parameter (COMMA parameter)*)?;

argumentList: (IDENTIFIER (COMMA IDENTIFIER)*)?;

parameter : PRIMITIVE_TYPES IDENTIFIER;

expression : logicalOrExpression;

logicalOrExpression : logicalAndExpression (LOGICAL_OR logicalAndExpression)*;

logicalAndExpression : equalityExpression (LOGICAL_AND equalityExpression)*;

equalityExpression : relationalExpression ((EQUAL | NOT_EQUAL) relationalExpression)*;

relationalExpression : additiveExpression ((LESS | GREATER | LESS_EQUAL | GREATER_EQUAL) additiveExpression)*;

additiveExpression : multiplicativeExpression ((PLUS | MINUS) multiplicativeExpression)*;

multiplicativeExpression : unaryExpression ((MULTIPLY | DIVIDE | MODULO) unaryExpression)*;

unaryExpression : (PLUS | MINUS) unaryExpression
               | primaryExpression;

primaryExpression : logicalNotExpression
                | INTEGER_LITERAL
                | IDENTIFIER
                | LPAREN expression RPAREN;

logicalNotExpression : LOGICAL_NOT primaryExpression;
