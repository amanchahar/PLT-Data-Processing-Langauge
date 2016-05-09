type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | RBRACKET
  | LBRACKET
  | INCLUDE
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
# 52 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* COMMA *);
  263 (* RBRACKET *);
  264 (* LBRACKET *);
  265 (* INCLUDE *);
  266 (* PLUS *);
  267 (* MINUS *);
  268 (* TIMES *);
  269 (* DIVIDE *);
  270 (* ASSIGN *);
  271 (* NOT *);
  272 (* SPLUS *);
  273 (* SMINUS *);
  274 (* EQ *);
  275 (* NEQ *);
  276 (* LT *);
  277 (* LEQ *);
  278 (* GT *);
  279 (* GEQ *);
  280 (* TRUE *);
  281 (* FALSE *);
  282 (* AND *);
  283 (* OR *);
  284 (* RETURN *);
  285 (* IF *);
  286 (* ELSE *);
  287 (* FOR *);
  288 (* WHILE *);
  289 (* INT *);
  290 (* BOOL *);
  291 (* VOID *);
  292 (* FLOAT *);
  293 (* CHAR *);
  294 (* STRING *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  295 (* LITERAL *);
  296 (* FLOAT_LITERAL *);
  297 (* STRING_LITERAL *);
  298 (* ID *);
  299 (* CHAR_LITERAL *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\004\000\004\000\005\000\003\000\003\000\
\003\000\007\000\009\000\009\000\012\000\012\000\008\000\008\000\
\008\000\008\000\008\000\008\000\013\000\015\000\014\000\014\000\
\010\000\010\000\006\000\011\000\011\000\016\000\016\000\016\000\
\016\000\016\000\016\000\016\000\016\000\018\000\018\000\017\000\
\017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
\017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
\017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
\017\000\017\000\017\000\019\000\019\000\020\000\020\000\000\000"

let yylen = "\002\000\
\003\000\000\000\001\000\001\000\002\000\005\000\000\000\002\000\
\002\000\009\000\000\000\001\000\002\000\004\000\001\000\001\000\
\001\000\001\000\001\000\001\000\005\000\001\000\000\000\003\000\
\000\000\002\000\003\000\000\000\002\000\002\000\002\000\003\000\
\003\000\005\000\007\000\009\000\005\000\000\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\002\000\002\000\
\002\000\002\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\002\000\002\000\
\003\000\004\000\003\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\072\000\007\000\000\000\004\000\000\000\
\000\000\005\000\000\000\015\000\016\000\017\000\018\000\019\000\
\020\000\001\000\008\000\009\000\000\000\000\000\000\000\006\000\
\027\000\000\000\000\000\000\000\000\000\013\000\000\000\000\000\
\025\000\000\000\000\000\014\000\026\000\000\000\000\000\000\000\
\000\000\028\000\010\000\000\000\000\000\000\000\000\000\044\000\
\045\000\000\000\000\000\000\000\000\000\040\000\043\000\041\000\
\000\000\042\000\029\000\000\000\000\000\000\000\063\000\064\000\
\050\000\049\000\031\000\000\000\000\000\000\000\000\000\000\000\
\000\000\047\000\048\000\030\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\067\000\033\000\032\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\053\000\054\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\066\000\000\000\000\000\000\000\037\000\000\000\
\000\000\000\000\035\000\000\000\000\000\036\000"

let yydgoto = "\002\000\
\004\000\005\000\009\000\006\000\007\000\019\000\020\000\021\000\
\028\000\035\000\039\000\029\000\000\000\000\000\000\000\059\000\
\060\000\094\000\097\000\098\000"

let yysindex = "\004\000\
\018\255\000\000\033\255\000\000\000\000\018\255\000\000\019\255\
\001\000\000\000\065\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\032\255\076\255\021\255\000\000\
\000\000\105\255\038\255\081\255\084\255\000\000\095\255\105\255\
\000\000\063\255\105\255\000\000\000\000\064\255\054\255\106\255\
\219\255\000\000\000\000\219\255\219\255\067\255\072\255\000\000\
\000\000\009\255\115\255\118\255\119\255\000\000\000\000\000\000\
\000\255\000\000\000\000\051\000\251\000\087\255\000\000\000\000\
\000\000\000\000\000\000\074\000\219\255\219\255\219\255\219\255\
\219\255\000\000\000\000\000\000\219\255\219\255\219\255\219\255\
\219\255\219\255\219\255\219\255\219\255\219\255\219\255\219\255\
\000\000\000\000\000\000\016\001\055\001\122\255\037\001\055\001\
\129\255\127\255\055\001\088\255\088\255\000\000\000\000\045\000\
\045\000\161\255\161\255\161\255\161\255\073\001\227\255\186\255\
\219\255\186\255\000\000\219\255\116\255\097\000\000\000\055\001\
\186\255\219\255\000\000\144\255\186\255\000\000"

let yyrindex = "\000\000\
\007\000\000\000\000\000\000\000\000\000\013\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\147\255\000\000\000\000\151\255\000\000\000\000\000\000\
\000\000\000\000\120\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\152\255\000\000\162\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\052\255\000\000\000\000\051\255\
\000\000\163\255\060\255\124\000\151\000\000\000\000\000\251\255\
\232\000\162\000\189\000\199\000\226\000\061\255\107\255\000\000\
\000\000\000\000\000\000\000\000\153\255\000\000\000\000\070\255\
\000\000\164\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\150\000\140\000\000\000\242\255\
\000\000\000\000\134\000\000\000\000\000\000\000\000\000\150\255\
\215\255\057\000\000\000\000\000"

let yytablesize = 608
let yytable = "\061\000\
\018\000\072\000\063\000\064\000\001\000\117\000\002\000\119\000\
\068\000\067\000\041\000\027\000\003\000\073\000\123\000\074\000\
\075\000\034\000\126\000\044\000\038\000\025\000\026\000\045\000\
\046\000\047\000\003\000\092\000\093\000\095\000\096\000\099\000\
\048\000\049\000\008\000\100\000\101\000\102\000\103\000\104\000\
\105\000\106\000\107\000\108\000\109\000\110\000\111\000\054\000\
\055\000\056\000\057\000\058\000\039\000\070\000\039\000\041\000\
\070\000\042\000\043\000\011\000\065\000\061\000\065\000\061\000\
\044\000\065\000\061\000\022\000\045\000\046\000\047\000\118\000\
\071\000\023\000\120\000\071\000\024\000\048\000\049\000\030\000\
\093\000\050\000\051\000\031\000\052\000\053\000\061\000\061\000\
\041\000\032\000\042\000\090\000\054\000\055\000\056\000\057\000\
\058\000\044\000\033\000\079\000\080\000\045\000\046\000\047\000\
\036\000\040\000\025\000\062\000\065\000\062\000\048\000\049\000\
\062\000\066\000\050\000\051\000\069\000\052\000\053\000\070\000\
\071\000\028\000\113\000\028\000\028\000\054\000\055\000\056\000\
\057\000\058\000\028\000\115\000\116\000\062\000\028\000\028\000\
\028\000\012\000\013\000\014\000\015\000\016\000\017\000\028\000\
\028\000\121\000\125\000\028\000\028\000\011\000\028\000\028\000\
\038\000\012\000\034\000\010\000\034\000\034\000\028\000\028\000\
\028\000\028\000\028\000\034\000\068\000\069\000\038\000\034\000\
\034\000\034\000\077\000\078\000\079\000\080\000\037\000\062\000\
\034\000\034\000\124\000\000\000\034\000\034\000\000\000\034\000\
\034\000\000\000\000\000\041\000\000\000\042\000\000\000\034\000\
\034\000\034\000\034\000\034\000\044\000\000\000\000\000\000\000\
\045\000\046\000\047\000\000\000\000\000\000\000\000\000\000\000\
\000\000\048\000\049\000\000\000\000\000\050\000\051\000\000\000\
\052\000\053\000\000\000\000\000\041\000\000\000\000\000\000\000\
\054\000\055\000\056\000\057\000\058\000\044\000\000\000\000\000\
\000\000\045\000\046\000\047\000\077\000\078\000\079\000\080\000\
\000\000\000\000\048\000\049\000\081\000\082\000\083\000\084\000\
\085\000\086\000\000\000\055\000\087\000\055\000\000\000\000\000\
\055\000\054\000\055\000\056\000\057\000\058\000\046\000\000\000\
\046\000\000\000\000\000\046\000\055\000\055\000\000\000\046\000\
\046\000\046\000\046\000\000\000\055\000\055\000\000\000\046\000\
\046\000\046\000\046\000\046\000\046\000\000\000\000\000\046\000\
\046\000\012\000\013\000\014\000\015\000\016\000\017\000\002\000\
\002\000\002\000\002\000\002\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\076\000\000\000\000\000\077\000\078\000\
\079\000\080\000\000\000\000\000\077\000\078\000\079\000\080\000\
\083\000\084\000\085\000\086\000\081\000\082\000\083\000\084\000\
\085\000\086\000\091\000\000\000\087\000\088\000\000\000\000\000\
\000\000\000\000\000\000\077\000\078\000\079\000\080\000\000\000\
\000\000\000\000\000\000\081\000\082\000\083\000\084\000\085\000\
\086\000\122\000\000\000\087\000\088\000\000\000\000\000\000\000\
\000\000\000\000\077\000\078\000\079\000\080\000\000\000\000\000\
\000\000\000\000\081\000\082\000\083\000\084\000\085\000\086\000\
\000\000\000\000\087\000\088\000\051\000\000\000\051\000\000\000\
\000\000\051\000\000\000\000\000\000\000\051\000\051\000\000\000\
\000\000\000\000\000\000\000\000\000\000\051\000\051\000\051\000\
\051\000\051\000\051\000\000\000\000\000\051\000\051\000\052\000\
\000\000\052\000\000\000\000\000\052\000\000\000\000\000\000\000\
\052\000\052\000\057\000\000\000\057\000\000\000\000\000\057\000\
\052\000\052\000\052\000\052\000\052\000\052\000\000\000\000\000\
\052\000\052\000\000\000\057\000\057\000\057\000\057\000\057\000\
\057\000\000\000\000\000\057\000\057\000\058\000\000\000\058\000\
\000\000\000\000\058\000\000\000\000\000\000\000\000\000\059\000\
\000\000\059\000\000\000\000\000\059\000\000\000\058\000\058\000\
\058\000\058\000\058\000\058\000\000\000\000\000\058\000\058\000\
\059\000\059\000\059\000\059\000\059\000\059\000\000\000\000\000\
\059\000\059\000\060\000\000\000\060\000\000\000\000\000\060\000\
\056\000\000\000\056\000\000\000\000\000\056\000\000\000\000\000\
\000\000\000\000\000\000\060\000\060\000\060\000\060\000\060\000\
\060\000\056\000\056\000\060\000\060\000\089\000\000\000\000\000\
\000\000\056\000\056\000\000\000\077\000\078\000\079\000\080\000\
\000\000\000\000\000\000\000\000\081\000\082\000\083\000\084\000\
\085\000\086\000\112\000\000\000\087\000\088\000\000\000\000\000\
\000\000\077\000\078\000\079\000\080\000\000\000\000\000\000\000\
\000\000\081\000\082\000\083\000\084\000\085\000\086\000\114\000\
\000\000\087\000\088\000\000\000\000\000\000\000\077\000\078\000\
\079\000\080\000\000\000\000\000\000\000\000\000\081\000\082\000\
\083\000\084\000\085\000\086\000\000\000\000\000\087\000\088\000\
\077\000\078\000\079\000\080\000\000\000\000\000\000\000\000\000\
\081\000\082\000\083\000\084\000\085\000\086\000\000\000\000\000\
\087\000\088\000\077\000\078\000\079\000\080\000\000\000\000\000\
\000\000\000\000\081\000\082\000\083\000\084\000\085\000\086\000"

let yycheck = "\041\000\
\000\000\002\001\044\000\045\000\001\000\112\000\000\000\114\000\
\050\000\001\001\002\001\026\000\000\000\014\001\121\000\016\001\
\017\001\032\000\125\000\011\001\035\000\001\001\002\001\015\001\
\016\001\017\001\009\001\069\000\070\000\071\000\072\000\073\000\
\024\001\025\001\002\001\077\000\078\000\079\000\080\000\081\000\
\082\000\083\000\084\000\085\000\086\000\087\000\088\000\039\001\
\040\001\041\001\042\001\043\001\001\001\003\001\003\001\002\001\
\006\001\004\001\005\001\041\001\001\001\001\001\003\001\003\001\
\011\001\006\001\006\001\003\001\015\001\016\001\017\001\113\000\
\003\001\042\001\116\000\006\001\001\001\024\001\025\001\042\001\
\122\000\028\001\029\001\003\001\031\001\032\001\026\001\027\001\
\002\001\006\001\004\001\005\001\039\001\040\001\041\001\042\001\
\043\001\011\001\004\001\012\001\013\001\015\001\016\001\017\001\
\042\001\042\001\001\001\001\001\042\001\003\001\024\001\025\001\
\006\001\042\001\028\001\029\001\002\001\031\001\032\001\002\001\
\002\001\002\001\001\001\004\001\005\001\039\001\040\001\041\001\
\042\001\043\001\011\001\003\001\006\001\027\001\015\001\016\001\
\017\001\033\001\034\001\035\001\036\001\037\001\038\001\024\001\
\025\001\030\001\003\001\028\001\029\001\003\001\031\001\032\001\
\001\001\003\001\002\001\006\000\004\001\005\001\039\001\040\001\
\041\001\042\001\043\001\011\001\003\001\003\001\003\001\015\001\
\016\001\017\001\010\001\011\001\012\001\013\001\035\000\042\000\
\024\001\025\001\122\000\255\255\028\001\029\001\255\255\031\001\
\032\001\255\255\255\255\002\001\255\255\004\001\255\255\039\001\
\040\001\041\001\042\001\043\001\011\001\255\255\255\255\255\255\
\015\001\016\001\017\001\255\255\255\255\255\255\255\255\255\255\
\255\255\024\001\025\001\255\255\255\255\028\001\029\001\255\255\
\031\001\032\001\255\255\255\255\002\001\255\255\255\255\255\255\
\039\001\040\001\041\001\042\001\043\001\011\001\255\255\255\255\
\255\255\015\001\016\001\017\001\010\001\011\001\012\001\013\001\
\255\255\255\255\024\001\025\001\018\001\019\001\020\001\021\001\
\022\001\023\001\255\255\001\001\026\001\003\001\255\255\255\255\
\006\001\039\001\040\001\041\001\042\001\043\001\001\001\255\255\
\003\001\255\255\255\255\006\001\018\001\019\001\255\255\010\001\
\011\001\012\001\013\001\255\255\026\001\027\001\255\255\018\001\
\019\001\020\001\021\001\022\001\023\001\255\255\255\255\026\001\
\027\001\033\001\034\001\035\001\036\001\037\001\038\001\033\001\
\034\001\035\001\036\001\037\001\038\001\033\001\034\001\035\001\
\036\001\037\001\038\001\001\001\255\255\255\255\010\001\011\001\
\012\001\013\001\255\255\255\255\010\001\011\001\012\001\013\001\
\020\001\021\001\022\001\023\001\018\001\019\001\020\001\021\001\
\022\001\023\001\001\001\255\255\026\001\027\001\255\255\255\255\
\255\255\255\255\255\255\010\001\011\001\012\001\013\001\255\255\
\255\255\255\255\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\001\001\255\255\026\001\027\001\255\255\255\255\255\255\
\255\255\255\255\010\001\011\001\012\001\013\001\255\255\255\255\
\255\255\255\255\018\001\019\001\020\001\021\001\022\001\023\001\
\255\255\255\255\026\001\027\001\001\001\255\255\003\001\255\255\
\255\255\006\001\255\255\255\255\255\255\010\001\011\001\255\255\
\255\255\255\255\255\255\255\255\255\255\018\001\019\001\020\001\
\021\001\022\001\023\001\255\255\255\255\026\001\027\001\001\001\
\255\255\003\001\255\255\255\255\006\001\255\255\255\255\255\255\
\010\001\011\001\001\001\255\255\003\001\255\255\255\255\006\001\
\018\001\019\001\020\001\021\001\022\001\023\001\255\255\255\255\
\026\001\027\001\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\255\255\255\255\026\001\027\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\255\255\001\001\
\255\255\003\001\255\255\255\255\006\001\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\255\255\255\255\026\001\027\001\
\018\001\019\001\020\001\021\001\022\001\023\001\255\255\255\255\
\026\001\027\001\001\001\255\255\003\001\255\255\255\255\006\001\
\001\001\255\255\003\001\255\255\255\255\006\001\255\255\255\255\
\255\255\255\255\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\018\001\019\001\026\001\027\001\003\001\255\255\255\255\
\255\255\026\001\027\001\255\255\010\001\011\001\012\001\013\001\
\255\255\255\255\255\255\255\255\018\001\019\001\020\001\021\001\
\022\001\023\001\003\001\255\255\026\001\027\001\255\255\255\255\
\255\255\010\001\011\001\012\001\013\001\255\255\255\255\255\255\
\255\255\018\001\019\001\020\001\021\001\022\001\023\001\003\001\
\255\255\026\001\027\001\255\255\255\255\255\255\010\001\011\001\
\012\001\013\001\255\255\255\255\255\255\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\255\255\255\255\026\001\027\001\
\010\001\011\001\012\001\013\001\255\255\255\255\255\255\255\255\
\018\001\019\001\020\001\021\001\022\001\023\001\255\255\255\255\
\026\001\027\001\010\001\011\001\012\001\013\001\255\255\255\255\
\255\255\255\255\018\001\019\001\020\001\021\001\022\001\023\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  RBRACKET\000\
  LBRACKET\000\
  INCLUDE\000\
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
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'includes) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 35 "parser.mly"
                       ( Program(_1,_2) )
# 404 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 42 "parser.mly"
                  ( [] )
# 410 "parser.ml"
               : 'includes))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'include_list) in
    Obj.repr(
# 43 "parser.mly"
                      ( List.rev _1 )
# 417 "parser.ml"
               : 'includes))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'include_decl) in
    Obj.repr(
# 46 "parser.mly"
                                ( [_1] )
# 424 "parser.ml"
               : 'include_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'include_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'include_decl) in
    Obj.repr(
# 47 "parser.mly"
                                  ( _2::_1 )
# 432 "parser.ml"
               : 'include_list))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 50 "parser.mly"
                                            ( Include(_3) )
# 439 "parser.ml"
               : 'include_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                 ( [], [] )
# 445 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 55 "parser.mly"
               ( (_2 :: fst _1), snd _1)
# 453 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 56 "parser.mly"
               ( fst _1, (_2 :: snd _1) )
# 461 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 60 "parser.mly"
     ( { typ = _1;
	 fname = _2;
	 formals = _4;
	 locals = List.rev _7;
	 body = List.rev _8 } )
# 476 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 67 "parser.mly"
                  ( [] )
# 482 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 68 "parser.mly"
                  ( List.rev _1 )
# 489 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 71 "parser.mly"
                             ( [(_1,_2)] )
# 497 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 72 "parser.mly"
                             ( (_3,_4) :: _1 )
# 506 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "parser.mly"
        ( Int )
# 512 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "parser.mly"
         ( Bool )
# 518 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser.mly"
         ( Void )
# 524 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "parser.mly"
          ( Float )
# 530 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 79 "parser.mly"
         ( Char )
# 536 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "parser.mly"
           (String_t)
# 542 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'brackets) in
    Obj.repr(
# 85 "parser.mly"
                                   (    L(_1,_2,Arraytype(_1,_4)) )
# 551 "parser.ml"
               : 'array_t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 88 "parser.mly"
      (  Dtype(_1)  )
# 558 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
  ( 1 )
# 564 "parser.ml"
               : 'brackets))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'brackets) in
    Obj.repr(
# 94 "parser.mly"
                               (_1 + 1)
# 571 "parser.ml"
               : 'brackets))
; (fun __caml_parser_env ->
    Obj.repr(
# 98 "parser.mly"
                     ( [] )
# 577 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 99 "parser.mly"
                     ( _2 :: _1 )
# 585 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 102 "parser.mly"
               ( (_1, _2) )
# 593 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 105 "parser.mly"
                   ( [] )
# 599 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 106 "parser.mly"
                   ( _2 :: _1 )
# 607 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
              ( Expr _1 )
# 614 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "parser.mly"
                ( Return Noexpr )
# 620 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 111 "parser.mly"
                     ( Return _2 )
# 627 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 112 "parser.mly"
                            ( Block(List.rev _2) )
# 634 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 113 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 642 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 114 "parser.mly"
                                            ( If(_3, _5, _7) )
# 651 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 116 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 661 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 117 "parser.mly"
                                  ( While(_3, _5) )
# 669 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 122 "parser.mly"
                  ( Noexpr )
# 675 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parser.mly"
                  ( _1 )
# 682 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 126 "parser.mly"
                     ( Literal(_1) )
# 689 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 127 "parser.mly"
                     ( String_Lit(_1) )
# 696 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 128 "parser.mly"
                     ( Char_Lit(_1) )
# 703 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 129 "parser.mly"
                      (Float_Lit(_1) )
# 710 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 130 "parser.mly"
                     ( BoolLit(true) )
# 716 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 131 "parser.mly"
                     ( BoolLit(false) )
# 722 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 132 "parser.mly"
                     ( Id(_1) )
# 729 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 133 "parser.mly"
                     ( Binop(Assign(_1,Binop(Ast.Id(_1), Add, Ast.Literal(1))),Sub,Ast.Literal(1)))
# 736 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 134 "parser.mly"
                     ( Binop(Assign(_1,Binop(Ast.Id(_1), Sub, Ast.Literal(1))),Add,Ast.Literal(1)))
# 743 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 135 "parser.mly"
                     ( Assign(_2,Binop(Ast.Id(_2), Sub, Ast.Literal(1))))
# 750 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 136 "parser.mly"
                     ( Assign(_2,Binop(Ast.Id(_2), Add, Ast.Literal(1))))
# 757 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 765 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 138 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 773 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 139 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 781 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 140 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 789 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 141 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 797 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 805 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 143 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 813 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 144 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 821 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 145 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 829 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 146 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 837 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 147 "parser.mly"
                     ( Binop(_1, And,   _3) )
# 845 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 148 "parser.mly"
                     ( Binop(_1, Or,    _3) )
# 853 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 149 "parser.mly"
                         ( Unop(Neg, _2) )
# 860 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 150 "parser.mly"
                     ( Unop(Not, _2) )
# 867 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 151 "parser.mly"
                     ( Assign(_1, _3) )
# 875 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 152 "parser.mly"
                                 ( Call(_1, _3) )
# 883 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 153 "parser.mly"
                       ( _2 )
# 890 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 157 "parser.mly"
                  ( [] )
# 896 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 158 "parser.mly"
                  ( List.rev _1 )
# 903 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 161 "parser.mly"
                            ( [_1] )
# 910 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 162 "parser.mly"
                            ( _3 :: _1 )
# 918 "parser.ml"
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
