grammar PrograMatic;

program: (statements)* EOF;

statements: variableDeclaration | pointerDeclaration | procedureDeclaration | procedureCall | attribution;

variableDeclaration: typeDeclaration IDENTIFIER SEMICOLON | typeDeclaration IDENTIFIER '=' attributionValues SEMICOLON;

attribution: IDENTIFIER ATTRIBUTION (expression | attributionValues) SEMICOLON;

pointerDeclaration: typeDeclaration POINTER IDENTIFIER '=' ADDRESS IDENTIFIER SEMICOLON;

procedureDeclaration: procedure IDENTIFIER LPAREN parameterList RPAREN  LBRACE (statements)* RBRACE;

procedureCall: IDENTIFIER '(' argumentList ')' SEMICOLON;

argumentList: (IDENTIFIER (COMMA IDENTIFIER)*)?;

typeDeclaration: 'int' | 'str' | 'char' | 'float' | 'boolean';

attributionValues: INTEGER_LITERAL | STRING_LITERAL | CHAR_LITERAL | FLOAT_LITERAL | BOOLEAN_LITERAL;

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


parameterList : (parameter (COMMA parameter)*)?;
parameter : typeDeclaration IDENTIFIER;

INTEGER_LITERAL: [0-9]+;
STRING_LITERAL: '"' (~["\r\n])* '"';
CHAR_LITERAL: '\'' ~["\r\n'] '\'';
FLOAT_LITERAL: [0-9]+ '.' [0-9]+;
BOOLEAN_LITERAL: 'true' | 'false';
POINTER: '->';
ADDRESS: '$';
IDENTIFIER: [a-zA-Z]+;
SEMICOLON: ';';
LPAREN : '(';
RPAREN : ')';
LBRACE : '{';
RBRACE : '}';
COMMA: ',';
ATTRIBUTION: '=';
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


procedure: 'func';

WS: [ \t\r\n]+ -> skip;
