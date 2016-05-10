/* Ocamlyacc parser for MicroC */

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA RBRACKET LBRACKET INCLUDE
%token PLUS MINUS TIMES DIVIDE ASSIGN NOT SPLUS SMINUS
%token EQ NEQ LT LEQ GT GEQ TRUE FALSE AND OR
%token RETURN IF ELSE FOR WHILE INT BOOL VOID FLOAT CHAR STRING
%token <int> LITERAL
%token <float> FLOAT_LITERAL
%token <string> STRING_LITERAL
%token <string> ID
%token <char> CHAR_LITERAL
%token EOF

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%right NOT NEG

%start program
%type <Ast.program> program

%%

program:
    includes decls EOF { Program($1,$2) }

/******************
  INCLUDE
******************/

includes:
    /* nothing */ { [] }
    |   include_list  { List.rev $1 }

include_list:
      include_decl              { [$1] }
    |   include_list include_decl { $2::$1 }

include_decl:
  INCLUDE LPAREN STRING_LITERAL RPAREN SEMI { Include($3) }


decls:
   /* nothing */ { [], [] }
 | decls vdecl { ($2 :: fst $1), snd $1}
 | decls fdecl { fst $1, ($2 :: snd $1) }

fdecl:
   typ ID LPAREN formals_opt RPAREN LBRACE vdecl_list stmt_list RBRACE
     { { typ = $1;
	 fname = $2;
	 formals = $4;
	 locals = List.rev $7;
	 body = List.rev $8 } }

formals_opt:
    /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
    typ ID                   { [($1,$2)] }
  | formal_list COMMA typ ID { ($3,$4) :: $1 }

typ:
    INT { Int }
  | BOOL { Bool }
  | VOID { Void }
  | FLOAT { Float }
  |	CHAR { Char }
  | STRING {String_t}
  


array_t: 
	typ ID LBRACKET brackets RBRACKET {    L($1,$2,Arraytype($1,$4)) }

dtype:
	 typ {  Dtype($1)  }
	


brackets:
	 { 1 }
	 | brackets RBRACKET LBRACKET {$1 + 1}


vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

vdecl:
   typ ID SEMI { ($1, $2) }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
    expr SEMI { Expr $1 }
  | RETURN SEMI { Return Noexpr }
  | RETURN expr SEMI { Return $2 }
  | LBRACE stmt_list RBRACE { Block(List.rev $2) }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7) }
  | FOR LPAREN expr_opt SEMI expr SEMI expr_opt RPAREN stmt
     { For($3, $5, $7, $9) }
  | WHILE LPAREN expr RPAREN stmt { While($3, $5) }
   
  

expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }

expr:
    LITERAL          { Literal($1) }
  | STRING_LITERAL   { String_Lit($1) }
  | CHAR_LITERAL     { Char_Lit($1) } 
  | FLOAT_LITERAL     {Float_Lit($1) }
  | TRUE             { BoolLit(true) }
  | FALSE            { BoolLit(false) }
  | typ ID LBRACKET expr RBRACKET { Vectors($1, $2, $4) }
  | ID               { Id($1) }
  | ID SPLUS         { Binop(Assign($1,Binop(Ast.Id($1), Add, Ast.Literal(1))),Sub,Ast.Literal(1))}
  | ID SMINUS        { Binop(Assign($1,Binop(Ast.Id($1), Sub, Ast.Literal(1))),Add,Ast.Literal(1))}
  | SMINUS ID        { Assign($2,Binop(Ast.Id($2), Sub, Ast.Literal(1)))}
  | SPLUS ID         { Assign($2,Binop(Ast.Id($2), Add, Ast.Literal(1)))}
  | expr PLUS   expr { Binop($1, Add,   $3) }
  | expr MINUS  expr { Binop($1, Sub,   $3) }
  | expr TIMES  expr { Binop($1, Mult,  $3) }
  | expr DIVIDE expr { Binop($1, Div,   $3) }
  | expr EQ     expr { Binop($1, Equal, $3) }
  | expr NEQ    expr { Binop($1, Neq,   $3) }
  | expr LT     expr { Binop($1, Less,  $3) }
  | expr LEQ    expr { Binop($1, Leq,   $3) }
  | expr GT     expr { Binop($1, Greater, $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3) }
  | expr AND    expr { Binop($1, And,   $3) }
  | expr OR     expr { Binop($1, Or,    $3) }
  | MINUS expr %prec NEG { Unop(Neg, $2) }
  | NOT expr         { Unop(Not, $2) }
  | ID ASSIGN expr   { Assign($1, $3) }
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | LPAREN expr RPAREN { $2 }
  | ID LBRACKET expr  RBRACKET { Ary($1,$3) }
  | ID LBRACKET expr  RBRACKET ASSIGN expr { Aryasn($1,$3,$6) }


actuals_opt:
    /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }


