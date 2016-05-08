type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | RBRACKET
  | LBRACKET
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | ASSIGN
  | NOT
  | SPLUS
  | SMINUS
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | TRUE
  | FALSE
  | AND
  | OR
  | RETURN
  | IF
  | ELSE
  | FOR
  | WHILE
  | INT
  | BOOL
  | VOID
  | FLOAT
  | CHAR
  | STRING
  | LITERAL of (int)
  | FLOAT_LITERAL of (float)
  | STRING_LITERAL of (string)
  | ID of (string)
  | CHAR_LITERAL of (char)
  | EOF

open Parsing;;
let _ = parse_error;;
# 4 "parser.mly"
open Ast
# 51 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* COMMA *);
  263 (* RBRACKET *);
  264 (* LBRACKET *);
  265 (* PLUS *);
  266 (* MINUS *);
  267 (* TIMES *);
  268 (* DIVIDE *);
  269 (* ASSIGN *);
  270 (* NOT *);
  271 (* SPLUS *);
  272 (* SMINUS *);
  273 (* EQ *);
  274 (* NEQ *);
  275 (* LT *);
  276 (* LEQ *);
  277 (* GT *);
  278 (* GEQ *);
  279 (* TRUE *);
  280 (* FALSE *);
  281 (* AND *);
  282 (* OR *);
  283 (* RETURN *);
  284 (* IF *);
  285 (* ELSE *);
  286 (* FOR *);
  287 (* WHILE *);
  288 (* INT *);
  289 (* BOOL *);
  290 (* VOID *);
  291 (* FLOAT *);
  292 (* CHAR *);
  293 (* STRING *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  294 (* LITERAL *);
  295 (* FLOAT_LITERAL *);
  296 (* STRING_LITERAL *);
  297 (* ID *);
  298 (* CHAR_LITERAL *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\006\000\006\000\009\000\
\009\000\005\000\005\000\005\000\005\000\005\000\005\000\010\000\
\012\000\011\000\011\000\007\000\007\000\003\000\008\000\008\000\
\013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\
\015\000\015\000\014\000\014\000\014\000\014\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\016\000\016\000\
\017\000\017\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\009\000\000\000\001\000\002\000\
\004\000\001\000\001\000\001\000\001\000\001\000\001\000\005\000\
\001\000\000\000\003\000\000\000\002\000\003\000\000\000\002\000\
\002\000\002\000\003\000\003\000\005\000\007\000\009\000\005\000\
\000\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\002\000\002\000\002\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\002\000\002\000\003\000\004\000\003\000\000\000\001\000\
\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\067\000\000\000\010\000\011\000\012\000\013\000\
\014\000\015\000\001\000\003\000\004\000\000\000\000\000\022\000\
\000\000\000\000\000\000\000\000\008\000\000\000\000\000\020\000\
\000\000\000\000\009\000\021\000\000\000\000\000\000\000\000\000\
\023\000\005\000\000\000\000\000\000\000\000\000\039\000\040\000\
\000\000\000\000\000\000\000\000\035\000\038\000\036\000\000\000\
\037\000\024\000\000\000\000\000\000\000\058\000\059\000\045\000\
\044\000\026\000\000\000\000\000\000\000\000\000\000\000\000\000\
\042\000\043\000\025\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\062\000\
\028\000\027\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\048\000\049\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\061\000\000\000\000\000\000\000\032\000\000\000\000\000\
\000\000\030\000\000\000\000\000\031\000"

let yydgoto = "\002\000\
\003\000\004\000\012\000\013\000\014\000\019\000\026\000\030\000\
\020\000\000\000\000\000\000\000\050\000\051\000\085\000\088\000\
\089\000"

let yysindex = "\009\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\217\254\101\255\000\000\
\122\255\234\254\020\255\021\255\000\000\031\255\122\255\000\000\
\027\255\122\255\000\000\000\000\033\255\055\255\079\255\244\255\
\000\000\000\000\244\255\244\255\043\255\048\255\000\000\000\000\
\010\255\059\255\090\255\102\255\000\000\000\000\000\000\075\255\
\000\000\000\000\254\255\236\000\096\255\000\000\000\000\000\000\
\000\000\000\000\060\000\244\255\244\255\244\255\244\255\244\255\
\000\000\000\000\000\000\244\255\244\255\244\255\244\255\244\255\
\244\255\244\255\244\255\244\255\244\255\244\255\244\255\000\000\
\000\000\000\000\000\001\252\254\098\255\020\001\252\254\110\255\
\109\255\252\254\097\255\097\255\000\000\000\000\059\001\059\001\
\119\255\119\255\119\255\119\255\055\001\038\001\211\255\244\255\
\211\255\000\000\244\255\088\255\082\000\000\000\252\254\211\255\
\244\255\000\000\118\255\211\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\129\255\000\000\000\000\130\255\000\000\000\000\000\000\000\000\
\000\000\137\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\038\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\139\255\000\000\140\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\053\255\000\000\000\000\060\255\000\000\
\141\255\052\255\108\000\134\000\000\000\000\000\212\000\216\000\
\144\000\170\000\180\000\206\000\197\255\061\255\000\000\000\000\
\000\000\000\000\000\000\178\255\000\000\000\000\070\255\000\000\
\142\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\120\000\000\000\099\000\000\000\000\000\115\000\
\000\000\000\000\000\000\000\000\002\000\224\255\036\000\000\000\
\000\000"

let yytablesize = 593
let yytable = "\052\000\
\011\000\015\000\054\000\055\000\068\000\069\000\070\000\071\000\
\059\000\001\000\058\000\032\000\072\000\073\000\074\000\075\000\
\076\000\077\000\021\000\035\000\078\000\079\000\022\000\036\000\
\037\000\038\000\023\000\083\000\084\000\086\000\087\000\090\000\
\039\000\040\000\024\000\091\000\092\000\093\000\094\000\095\000\
\096\000\097\000\098\000\099\000\100\000\101\000\102\000\045\000\
\046\000\047\000\048\000\049\000\060\000\034\000\060\000\034\000\
\032\000\060\000\033\000\034\000\060\000\057\000\065\000\057\000\
\035\000\065\000\057\000\027\000\036\000\037\000\038\000\109\000\
\066\000\031\000\111\000\066\000\063\000\039\000\040\000\016\000\
\084\000\041\000\042\000\056\000\043\000\044\000\057\000\064\000\
\057\000\065\000\066\000\061\000\045\000\046\000\047\000\048\000\
\049\000\032\000\104\000\033\000\081\000\016\000\017\000\062\000\
\108\000\035\000\110\000\070\000\071\000\036\000\037\000\038\000\
\106\000\114\000\107\000\018\000\112\000\117\000\039\000\040\000\
\116\000\025\000\041\000\042\000\029\000\043\000\044\000\068\000\
\069\000\070\000\071\000\006\000\007\000\045\000\046\000\047\000\
\048\000\049\000\023\000\033\000\023\000\023\000\063\000\064\000\
\033\000\028\000\023\000\053\000\115\000\000\000\023\000\023\000\
\023\000\005\000\006\000\007\000\008\000\009\000\010\000\023\000\
\023\000\000\000\000\000\023\000\023\000\000\000\023\000\023\000\
\000\000\000\000\000\000\000\000\000\000\000\000\023\000\023\000\
\023\000\023\000\023\000\029\000\000\000\029\000\029\000\000\000\
\000\000\000\000\000\000\029\000\000\000\000\000\000\000\029\000\
\029\000\029\000\000\000\000\000\000\000\056\000\000\000\056\000\
\029\000\029\000\056\000\000\000\029\000\029\000\000\000\029\000\
\029\000\000\000\000\000\000\000\032\000\000\000\033\000\029\000\
\029\000\029\000\029\000\029\000\035\000\056\000\056\000\000\000\
\036\000\037\000\038\000\000\000\000\000\000\000\000\000\000\000\
\000\000\039\000\040\000\000\000\000\000\041\000\042\000\000\000\
\043\000\044\000\000\000\000\000\000\000\032\000\000\000\000\000\
\045\000\046\000\047\000\048\000\049\000\035\000\067\000\000\000\
\000\000\036\000\037\000\038\000\000\000\000\000\068\000\069\000\
\070\000\071\000\039\000\040\000\000\000\000\000\072\000\073\000\
\074\000\075\000\076\000\077\000\000\000\000\000\078\000\079\000\
\000\000\045\000\046\000\047\000\048\000\049\000\000\000\000\000\
\005\000\006\000\007\000\008\000\009\000\010\000\041\000\000\000\
\041\000\000\000\000\000\041\000\000\000\000\000\041\000\041\000\
\041\000\041\000\000\000\000\000\000\000\000\000\041\000\041\000\
\041\000\041\000\041\000\041\000\082\000\000\000\041\000\041\000\
\000\000\000\000\000\000\000\000\068\000\069\000\070\000\071\000\
\000\000\000\000\000\000\000\000\072\000\073\000\074\000\075\000\
\076\000\077\000\113\000\000\000\078\000\079\000\000\000\000\000\
\000\000\000\000\068\000\069\000\070\000\071\000\000\000\000\000\
\000\000\000\000\072\000\073\000\074\000\075\000\076\000\077\000\
\000\000\000\000\078\000\079\000\046\000\000\000\046\000\000\000\
\000\000\046\000\000\000\000\000\046\000\046\000\000\000\000\000\
\000\000\000\000\000\000\000\000\046\000\046\000\046\000\046\000\
\046\000\046\000\000\000\000\000\046\000\046\000\047\000\000\000\
\047\000\000\000\000\000\047\000\000\000\000\000\047\000\047\000\
\052\000\000\000\052\000\000\000\000\000\052\000\047\000\047\000\
\047\000\047\000\047\000\047\000\000\000\000\000\047\000\047\000\
\052\000\052\000\052\000\052\000\052\000\052\000\000\000\000\000\
\052\000\052\000\053\000\000\000\053\000\000\000\000\000\053\000\
\000\000\000\000\000\000\000\000\054\000\000\000\054\000\000\000\
\000\000\054\000\053\000\053\000\053\000\053\000\053\000\053\000\
\000\000\000\000\053\000\053\000\054\000\054\000\054\000\054\000\
\054\000\054\000\000\000\000\000\054\000\054\000\055\000\000\000\
\055\000\000\000\000\000\055\000\050\000\000\000\050\000\000\000\
\051\000\050\000\051\000\000\000\000\000\051\000\055\000\055\000\
\055\000\055\000\055\000\055\000\050\000\050\000\055\000\055\000\
\051\000\051\000\000\000\000\000\050\000\050\000\080\000\000\000\
\051\000\051\000\000\000\000\000\068\000\069\000\070\000\071\000\
\000\000\000\000\000\000\000\000\072\000\073\000\074\000\075\000\
\076\000\077\000\103\000\000\000\078\000\079\000\000\000\000\000\
\068\000\069\000\070\000\071\000\000\000\000\000\000\000\000\000\
\072\000\073\000\074\000\075\000\076\000\077\000\105\000\000\000\
\078\000\079\000\000\000\000\000\068\000\069\000\070\000\071\000\
\000\000\000\000\000\000\000\000\072\000\073\000\074\000\075\000\
\076\000\077\000\000\000\000\000\078\000\079\000\068\000\069\000\
\070\000\071\000\000\000\000\000\000\000\000\000\072\000\073\000\
\074\000\075\000\076\000\077\000\000\000\000\000\078\000\068\000\
\069\000\070\000\071\000\068\000\069\000\070\000\071\000\072\000\
\073\000\074\000\075\000\076\000\077\000\074\000\075\000\076\000\
\077\000"

let yycheck = "\032\000\
\000\000\041\001\035\000\036\000\009\001\010\001\011\001\012\001\
\041\000\001\000\001\001\002\001\017\001\018\001\019\001\020\001\
\021\001\022\001\041\001\010\001\025\001\026\001\003\001\014\001\
\015\001\016\001\006\001\060\000\061\000\062\000\063\000\064\000\
\023\001\024\001\004\001\068\000\069\000\070\000\071\000\072\000\
\073\000\074\000\075\000\076\000\077\000\078\000\079\000\038\001\
\039\001\040\001\041\001\042\001\001\001\001\001\003\001\003\001\
\002\001\006\001\004\001\005\001\002\001\001\001\003\001\003\001\
\010\001\006\001\006\001\041\001\014\001\015\001\016\001\104\000\
\003\001\041\001\107\000\006\001\002\001\023\001\024\001\001\001\
\113\000\027\001\028\001\041\001\030\001\031\001\026\001\013\001\
\041\001\015\001\016\001\002\001\038\001\039\001\040\001\041\001\
\042\001\002\001\001\001\004\001\005\001\001\001\002\001\002\001\
\103\000\010\001\105\000\011\001\012\001\014\001\015\001\016\001\
\003\001\112\000\006\001\017\000\029\001\116\000\023\001\024\001\
\003\001\023\000\027\001\028\001\026\000\030\001\031\001\009\001\
\010\001\011\001\012\001\003\001\003\001\038\001\039\001\040\001\
\041\001\042\001\002\001\001\001\004\001\005\001\003\001\003\001\
\003\001\026\000\010\001\033\000\113\000\255\255\014\001\015\001\
\016\001\032\001\033\001\034\001\035\001\036\001\037\001\023\001\
\024\001\255\255\255\255\027\001\028\001\255\255\030\001\031\001\
\255\255\255\255\255\255\255\255\255\255\255\255\038\001\039\001\
\040\001\041\001\042\001\002\001\255\255\004\001\005\001\255\255\
\255\255\255\255\255\255\010\001\255\255\255\255\255\255\014\001\
\015\001\016\001\255\255\255\255\255\255\001\001\255\255\003\001\
\023\001\024\001\006\001\255\255\027\001\028\001\255\255\030\001\
\031\001\255\255\255\255\255\255\002\001\255\255\004\001\038\001\
\039\001\040\001\041\001\042\001\010\001\025\001\026\001\255\255\
\014\001\015\001\016\001\255\255\255\255\255\255\255\255\255\255\
\255\255\023\001\024\001\255\255\255\255\027\001\028\001\255\255\
\030\001\031\001\255\255\255\255\255\255\002\001\255\255\255\255\
\038\001\039\001\040\001\041\001\042\001\010\001\001\001\255\255\
\255\255\014\001\015\001\016\001\255\255\255\255\009\001\010\001\
\011\001\012\001\023\001\024\001\255\255\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\255\255\255\255\025\001\026\001\
\255\255\038\001\039\001\040\001\041\001\042\001\255\255\255\255\
\032\001\033\001\034\001\035\001\036\001\037\001\001\001\255\255\
\003\001\255\255\255\255\006\001\255\255\255\255\009\001\010\001\
\011\001\012\001\255\255\255\255\255\255\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\001\001\255\255\025\001\026\001\
\255\255\255\255\255\255\255\255\009\001\010\001\011\001\012\001\
\255\255\255\255\255\255\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\001\001\255\255\025\001\026\001\255\255\255\255\
\255\255\255\255\009\001\010\001\011\001\012\001\255\255\255\255\
\255\255\255\255\017\001\018\001\019\001\020\001\021\001\022\001\
\255\255\255\255\025\001\026\001\001\001\255\255\003\001\255\255\
\255\255\006\001\255\255\255\255\009\001\010\001\255\255\255\255\
\255\255\255\255\255\255\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\255\255\255\255\025\001\026\001\001\001\255\255\
\003\001\255\255\255\255\006\001\255\255\255\255\009\001\010\001\
\001\001\255\255\003\001\255\255\255\255\006\001\017\001\018\001\
\019\001\020\001\021\001\022\001\255\255\255\255\025\001\026\001\
\017\001\018\001\019\001\020\001\021\001\022\001\255\255\255\255\
\025\001\026\001\001\001\255\255\003\001\255\255\255\255\006\001\
\255\255\255\255\255\255\255\255\001\001\255\255\003\001\255\255\
\255\255\006\001\017\001\018\001\019\001\020\001\021\001\022\001\
\255\255\255\255\025\001\026\001\017\001\018\001\019\001\020\001\
\021\001\022\001\255\255\255\255\025\001\026\001\001\001\255\255\
\003\001\255\255\255\255\006\001\001\001\255\255\003\001\255\255\
\001\001\006\001\003\001\255\255\255\255\006\001\017\001\018\001\
\019\001\020\001\021\001\022\001\017\001\018\001\025\001\026\001\
\017\001\018\001\255\255\255\255\025\001\026\001\003\001\255\255\
\025\001\026\001\255\255\255\255\009\001\010\001\011\001\012\001\
\255\255\255\255\255\255\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\003\001\255\255\025\001\026\001\255\255\255\255\
\009\001\010\001\011\001\012\001\255\255\255\255\255\255\255\255\
\017\001\018\001\019\001\020\001\021\001\022\001\003\001\255\255\
\025\001\026\001\255\255\255\255\009\001\010\001\011\001\012\001\
\255\255\255\255\255\255\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\255\255\255\255\025\001\026\001\009\001\010\001\
\011\001\012\001\255\255\255\255\255\255\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\255\255\255\255\025\001\009\001\
\010\001\011\001\012\001\009\001\010\001\011\001\012\001\017\001\
\018\001\019\001\020\001\021\001\022\001\019\001\020\001\021\001\
\022\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  RBRACKET\000\
  LBRACKET\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  ASSIGN\000\
  NOT\000\
  SPLUS\000\
  SMINUS\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  TRUE\000\
  FALSE\000\
  AND\000\
  OR\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  VOID\000\
  FLOAT\000\
  CHAR\000\
  STRING\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  FLOAT_LITERAL\000\
  STRING_LITERAL\000\
  ID\000\
  CHAR_LITERAL\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 35 "parser.mly"
            ( _1 )
# 395 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 38 "parser.mly"
                 ( [], [] )
# 401 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 39 "parser.mly"
               ( (_2 :: fst _1), snd _1 )
# 409 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 40 "parser.mly"
               ( fst _1, (_2 :: snd _1) )
# 417 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 44 "parser.mly"
     ( { typ = _1;
	 fname = _2;
	 formals = _4;
	 locals = List.rev _7;
	 body = List.rev _8 } )
# 432 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 51 "parser.mly"
                  ( [] )
# 438 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 52 "parser.mly"
                  ( List.rev _1 )
# 445 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 55 "parser.mly"
                             ( [(_1,_2)] )
# 453 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 56 "parser.mly"
                             ( (_3,_4) :: _1 )
# 462 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
        ( Int )
# 468 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
         ( Bool )
# 474 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "parser.mly"
         ( Void )
# 480 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 62 "parser.mly"
          ( Float )
# 486 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "parser.mly"
         ( Char )
# 492 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "parser.mly"
           (String_t)
# 498 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'brackets) in
    Obj.repr(
# 69 "parser.mly"
                                   (    L(_1,_2,Arraytype(_1,_4)) )
# 507 "parser.ml"
               : 'array_t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 72 "parser.mly"
      (  Dtype(_1)  )
# 514 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser.mly"
  ( 1 )
# 520 "parser.ml"
               : 'brackets))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'brackets) in
    Obj.repr(
# 78 "parser.mly"
                               (_1 + 1)
# 527 "parser.ml"
               : 'brackets))
; (fun __caml_parser_env ->
    Obj.repr(
# 82 "parser.mly"
                     ( [] )
# 533 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 83 "parser.mly"
                     ( _2 :: _1 )
# 541 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 86 "parser.mly"
               ( (_1, _2) )
# 549 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 89 "parser.mly"
                   ( [] )
# 555 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 90 "parser.mly"
                   ( _2 :: _1 )
# 563 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 93 "parser.mly"
              ( Expr _1 )
# 570 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "parser.mly"
                ( Return Noexpr )
# 576 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                     ( Return _2 )
# 583 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 96 "parser.mly"
                            ( Block(List.rev _2) )
# 590 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 97 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 598 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 98 "parser.mly"
                                            ( If(_3, _5, _7) )
# 607 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 100 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 617 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 101 "parser.mly"
                                  ( While(_3, _5) )
# 625 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "parser.mly"
                  ( Noexpr )
# 631 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 107 "parser.mly"
                  ( _1 )
# 638 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 110 "parser.mly"
                     ( Literal(_1) )
# 645 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 111 "parser.mly"
                     ( String_Lit(_1) )
# 652 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 112 "parser.mly"
                     ( Char_Lit(_1) )
# 659 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 113 "parser.mly"
                      (Float_Lit(_1) )
# 666 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 114 "parser.mly"
                     ( BoolLit(true) )
# 672 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 115 "parser.mly"
                     ( BoolLit(false) )
# 678 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 116 "parser.mly"
                     ( Id(_1) )
# 685 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 117 "parser.mly"
                     ( Binop(Assign(_1,Binop(Ast.Id(_1), Add, Ast.Literal(1))),Sub,Ast.Literal(1)))
# 692 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 118 "parser.mly"
                     ( Binop(Assign(_1,Binop(Ast.Id(_1), Sub, Ast.Literal(1))),Add,Ast.Literal(1)))
# 699 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 119 "parser.mly"
                     ( Assign(_2,Binop(Ast.Id(_2), Sub, Ast.Literal(1))))
# 706 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 120 "parser.mly"
                     ( Assign(_2,Binop(Ast.Id(_2), Add, Ast.Literal(1))))
# 713 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 721 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 729 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 737 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 745 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 753 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 761 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 769 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 777 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 129 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 785 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 130 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 793 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 131 "parser.mly"
                     ( Binop(_1, And,   _3) )
# 801 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 132 "parser.mly"
                     ( Binop(_1, Or,    _3) )
# 809 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 133 "parser.mly"
                         ( Unop(Neg, _2) )
# 816 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 134 "parser.mly"
                     ( Unop(Not, _2) )
# 823 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 135 "parser.mly"
                     ( Assign(_1, _3) )
# 831 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 136 "parser.mly"
                                 ( Call(_1, _3) )
# 839 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 137 "parser.mly"
                       ( _2 )
# 846 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 141 "parser.mly"
                  ( [] )
# 852 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 142 "parser.mly"
                  ( List.rev _1 )
# 859 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 145 "parser.mly"
                            ( [_1] )
# 866 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 146 "parser.mly"
                            ( _3 :: _1 )
# 874 "parser.ml"
               : 'actuals_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
