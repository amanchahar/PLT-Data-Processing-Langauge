(* Code generation: translate takes a semantically checked AST and
produces LLVM IR

LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/

*)
open Printf

module L = Llvm
module A = Ast

module StringMap = Map.Make(String)

(* let process_includes the_module context= 

   let file_in = open_in "stdlib.bmwsa" in
  let lexbuf = Lexing.from_channel stdin in
  let ast = Parser.program Scanner.token lexbuf in
  ignore(close_in file_in);

  match ast with (Program(first,second)) ->

  let (globals,functions) = second in  

  let i64_t  = L.i64_type  context
  and i32_t  = L.i32_type  context
  and i8_t   = L.i8_type   context
  and f_t   =  L.double_type context
  and i1_t   = L.i1_type   context
  (* and str_typ = Arraytype(Char,1)  *)
  and void_t = L.void_type context in 
  let str_t = L.pointer_type i8_t 
  and void_ptr=L.pointer_type i32_t in 
 

  let ltype_of_typ = function
      A.Int -> i32_t
    | A.Bool -> i1_t
    | A.Void -> void_t
    | A.Float -> f_t
    | A.Char -> i8_t

    | A.String_t -> str_t in

  (* Declare each global variable; remember its value in a map *)
  let global_vars =
    let global_var m (t, n) =
      let init = L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in

  (* Declare printf(), which the print built-in function will call *)
  let printf_t = (L.var_arg_function_type i32_t [| L.pointer_type i8_t |])
  and fopen_t=(L.function_type str_t [|str_t;str_t|]) 
  and fputs_t=(L.function_type str_t [|str_t;str_t|]) 
  and fseek_t=(L.function_type str_t [|str_t;i64_t;i32_t|])
  and ftell_t=(L.function_type i64_t [|str_t|])
  and fgetc_t=(L.function_type i8_t [|str_t|])
in
  let printf_func = L.declare_function "printf" printf_t the_module 
  and fgetc_fun=L.declare_function "fgetc" fgetc_t the_module
  and fopen_fun=L.declare_function "fopen" fopen_t the_module
  and fputs_fun=L.declare_function "fputs" fputs_t the_module
  and fseek_fun=L.declare_function "fseek" fseek_t the_module
  and ftell_fun=L.declare_function "ftell" ftell_t the_module
in 


  (* Define each function (arguments and return type) so we can call it *)
let  function_decls =
    let function_decl m fdecl =
      let name = fdecl.A.fname
      and formal_types =
  Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.A.formals)
      in let ftype = L.function_type (ltype_of_typ fdecl.A.typ) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in
  
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.A.fname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in



    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in
    let str_format_str = L.build_global_stringptr "%s\n" "fmt2" builder in
    let chr_format_str = L.build_global_stringptr "%c\n" "fmt3" builder in
    let read_str= L.build_global_stringptr "a" "fmt4" builder  in
    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
    let local_vars =
      let add_formal m (t, n) p = L.set_value_name n p;
  let local = L.build_alloca (ltype_of_typ t) n builder in
  ignore (L.build_store p local builder);
  StringMap.add n local m in

      let add_local m (t, n) =
  let local_var = L.build_alloca (ltype_of_typ t) n builder
  in StringMap.add n local_var m in

      let formals = List.fold_left2 add_formal StringMap.empty fdecl.A.formals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals fdecl.A.locals in

    (* Return the value for a variable or formal argument *)
    let lookup n = try StringMap.find n local_vars
                   with Not_found -> StringMap.find n global_vars

and codegen_string_build e builder = 

  let s = L.build_global_stringptr e "tmp1" builder in
  (* try commenting these two lines and compare the result *)
   let zero = L.const_int i32_t 0 in 
   L.build_in_bounds_gep s [| zero |] "tmp1" builder 
 

and  codegen_print e builder = 
(* print_string "reached here" in *)
  let s = L.build_global_stringptr e "tmp1" builder in
  (* try commenting these two lines and compare the result *)
   let zero = L.const_int i32_t 0 in 
  let s = L.build_in_bounds_gep s [| zero |] "tmp1" builder in
    L.build_call printf_func [| s |] "printf" builder in  

(* let rec string_expr builder = function 

 A.String_Lit s -> s 
 | A.Binop (e1, op, e2) ->
     let e1' = string_expr builder e1
     and e2' = string_expr builder e2 in
     let str_concat =  e1' ^ e2'     
 in 
    codegen_string_build str_concat builder
in *) 

let rec expr builder = function
  A.Literal i -> L.const_int i32_t i
     | A.BoolLit b -> L.const_int i1_t (if b then 1 else 0)
     | A.String_Lit s -> codegen_string_build s builder 
     | A.Float_Lit f -> L.const_float f_t f 
     | A.Char_Lit c -> L.const_int i8_t (Char.code c)
      | A.Noexpr -> L.const_int i32_t 0
      | A.Id s -> L.build_load (lookup s) s builder
      | A.Binop (e1, op, e2) ->
    let e1' = expr builder e1
    and e2' = expr builder e2 in
    let tp1=(L.type_of (L.const_int i32_t 3)) and tp2=(L.type_of (L.const_float f_t 3.2)) 
and tp3=(L.type_of e1') in
    (match op with
      A.Add     -> (if tp1=tp3 then (L.build_add) else (L.build_fadd))
    | A.Sub     -> (if tp1=tp3 then (L.build_sub) else (L.build_fsub))
    | A.Mult    -> (if tp1=tp3 then (L.build_mul) else (L.build_fmul))
    | A.Div     -> (if tp1=tp3 then (L.build_sdiv) else (L.build_fdiv))
    | A.And     -> L.build_and
    | A.Or      -> L.build_or
    | A.Equal   -> L.build_icmp L.Icmp.Eq
    | A.Neq     -> L.build_icmp L.Icmp.Ne
    | A.Less    -> L.build_icmp L.Icmp.Slt
    | A.Leq     -> L.build_icmp L.Icmp.Sle
    | A.Greater -> L.build_icmp L.Icmp.Sgt
    | A.Geq     -> L.build_icmp L.Icmp.Sge
    ) e1' e2' "tmp" builder
      | A.Unop(op, e) ->
    let e' = expr builder e in
    (match op with
      A.Neg     -> L.build_neg
          | A.Not     -> L.build_not) e' "tmp" builder
      | A.Assign (s, e) -> let e' = expr builder e in
                     ignore (L.build_store e' (lookup s) builder); e'
| A.Call ("print", [e])  ->
      L.build_call printf_func [| int_format_str ;  (expr builder e) |]
      "printf" builder
  | A.Call ("printstring", [e]) -> L.build_call printf_func [| str_format_str ; (expr builder e) |] "tmp1" builder 
  
| A.Call ("printx", e)  ->
      let actuals = List.rev (List.map (expr builder) (List.rev e)) in
  L.build_call printf_func (Array.of_list actuals) "tmp1" builder 

      | A.Call ("size",[e]) -> let cnt=expr builder e in 
      let cnt2=(L.build_call fopen_fun [|cnt;read_str|] "tmp0" builder) in
      L.build_call ftell_fun [|cnt2|] "tmp7" builder
      | A.Call ("fgetc",[e]) -> let cnt=expr builder e in
  L.build_call fgetc_fun [|cnt|] "temp1" builder

      | A.Call ("fff", [e;f]) -> let cnt=expr builder e and cnt2=expr builder f in
  L.build_call fputs_fun [|cnt2;(L.build_call fopen_fun [|cnt;read_str|] "tmp0" builder)|] "tmp5" builder

      | A.Call ("fopen", e) -> let actuals = List.rev (List.map (expr builder) (List.rev e)) in
  L.build_call fopen_fun (Array.of_list actuals) "tmp2" builder 
      | A.Call ("fputs",e) ->let actuals = List.rev (List.map (expr builder) (List.rev e)) in
  L.build_call fputs_fun (Array.of_list actuals) "tmp3" builder 
     | A.Call (f, act) ->
         let (fdef, fdecl) = StringMap.find f function_decls in
   let actuals = List.rev (List.map (expr builder) (List.rev act)) in
   let result = (match fdecl.A.typ with A.Void -> ""
                                            | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list actuals) result builder
    in

    (* Invoke "f builder" if the current block doesn't already
       have a terminal (e.g., a branch). *)
    let add_terminal builder f =
      match L.block_terminator (L.insertion_block builder) with
  Some _ -> ()
      | None -> ignore (f builder) in
  
    (* Build the code for the given statement; return the builder for
       the statement's successor *)
    let rec stmt builder = function
  A.Block sl -> List.fold_left stmt builder sl
      | A.Expr e -> ignore (expr builder e); builder
      | A.Return e -> ignore (match fdecl.A.typ with
    A.Void -> L.build_ret_void builder
  | _ -> L.build_ret (expr builder e) builder); builder
      | A.If (predicate, then_stmt, else_stmt) ->
         let bool_val = expr builder predicate in
   let merge_bb = L.append_block context "merge" the_function in

   let then_bb = L.append_block context "then" the_function in
   add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
     (L.build_br merge_bb);

   let else_bb = L.append_block context "else" the_function in
   add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
     (L.build_br merge_bb);

   ignore (L.build_cond_br bool_val then_bb else_bb builder);
   L.builder_at_end context merge_bb

      | A.While (predicate, body) ->
    let pred_bb = L.append_block context "while" the_function in
    ignore (L.build_br pred_bb builder);

    let body_bb = L.append_block context "while_body" the_function in
    add_terminal (stmt (L.builder_at_end context body_bb) body)
      (L.build_br pred_bb);

    let pred_builder = L.builder_at_end context pred_bb in
    let bool_val = expr pred_builder predicate in

    let merge_bb = L.append_block context "merge" the_function in
    ignore (L.build_cond_br bool_val body_bb merge_bb pred_builder);
    L.builder_at_end context merge_bb

      | A.For (e1, e2, e3, body) -> stmt builder
      ( A.Block [A.Expr e1 ; A.While (e2, A.Block [body ; A.Expr e3]) ] )
    in

    (* Build the code for each statement in the function *)
    let builder = stmt builder (A.Block fdecl.A.body) in

    (* Add a return if the last block falls off the end *)
    add_terminal builder (match fdecl.A.typ with
        A.Void -> L.build_ret_void
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in

  List.iter build_function_body functions;;

 *)




let rec translate (A.Program(first, second), A.Program(first1,second1)) =
  (* let b = process_includes first in  *)
  let (globals,functions) = second  
  and (globals2,functions2) = second1 in 

  let functions = List.append functions2 functions in 
  (* let translate (globals,functions) = *) 
  let context = L.global_context () in
  let the_module = L.create_module context "MicroC"
  
  and i64_t  = L.i64_type  context
  and i32_t  = L.i32_type  context
  and i8_t   = L.i8_type   context
  and f_t   =  L.double_type context
  and i1_t   = L.i1_type   context
  (* and str_typ = Arraytype(Char,1)  *)
  and void_t = L.void_type context in 
  let str_t = L.pointer_type i8_t 
  and void_ptr=L.pointer_type i32_t in 
 

  let ltype_of_typ = function
      A.Int -> i32_t
    | A.Bool -> i1_t
    | A.Void -> void_t
    | A.Float -> f_t
    | A.Char -> i8_t
    | A.String_t -> str_t    
    | A.Intptr -> L.pointer_type i32_t
    | A.String_p -> L.pointer_type str_t in
  (* Declare each global variable; remember its value in a map *)
  let global_vars =
    let global_var m (t, n) =
      let init = L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in

  (* Declare printf(), which the print built-in function will call *)
  let printf_t = (L.var_arg_function_type i32_t [| L.pointer_type i8_t |])
  and fopen_t=(L.function_type str_t [|str_t;str_t|]) 
  and fputs_t=(L.function_type str_t [|str_t;str_t|]) 
  and fseek_t=(L.function_type str_t [|str_t;i64_t;i32_t|])
  and ftell_t=(L.function_type i64_t [|str_t|])
  and fgetc_t=(L.function_type i8_t [|str_t|])
  and feof_t=(L.function_type i1_t [|str_t|])
  and fputc_t=(L.function_type i8_t [|i8_t;str_t|])
  and fremove_t=(L.function_type i32_t [|str_t|])
  and frename_t=(L.function_type i32_t [|str_t;str_t|])
  and memcpy_t = (L.function_type i8_t [|str_t;str_t;i32_t|])
  and malloc_t = (L.function_type str_t [|i32_t|])
  and calloc_t=(L.function_type str_t [|i32_t;i32_t|])
in
  let printf_func = L.declare_function "printf" printf_t the_module 
  and feof_fun=L.declare_function "feof" feof_t the_module
  and fgetc_fun=L.declare_function "fgetc" fgetc_t the_module
  and fopen_fun=L.declare_function "fopen" fopen_t the_module
  and fputs_fun=L.declare_function "fputs" fputs_t the_module
  and fseek_fun=L.declare_function "fseek" fseek_t the_module
  and ftell_fun=L.declare_function "ftell" ftell_t the_module
  and fputc_fun=L.declare_function "fputc" fputc_t the_module
  and fremove_fun=L.declare_function "remove" fremove_t the_module
  and frename_fun=L.declare_function "rename" frename_t the_module
  and memcpy_fun = L.declare_function "memcpy" memcpy_t the_module
  and malloc_fun = L.declare_function "malloc" malloc_t the_module
  and calloc_fun=L.declare_function "calloc" calloc_t the_module
in 


  (* Define each function (arguments and return type) so we can call it *)
let  function_decls =
    let function_decl m fdecl =
      let name = fdecl.A.fname
      and formal_types = Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.A.formals)
      in 

      let ftype = L.function_type (ltype_of_typ fdecl.A.typ) formal_types in
      

      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    

    List.fold_left function_decl StringMap.empty functions in
    (* List.fold_left function_decl StringMap.empty functions in  *)
  
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.A.fname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in



    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in
    let str_format_str = L.build_global_stringptr "%s\n" "fmt2" builder in
    let chr_format_str = L.build_global_stringptr "%c\n" "fmt3" builder in
    let read_str= L.build_global_stringptr "a" "fmt4" builder  in
    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
    let local_vars =
      let add_formal m (t, n) p = L.set_value_name n p;
	let local = L.build_alloca (ltype_of_typ t) n builder in
	ignore (L.build_store p local builder);
	StringMap.add n local m in

      let add_local m (t, n) =
	let local_var = L.build_alloca (ltype_of_typ t) n builder
	in StringMap.add n local_var m in

      let formals = List.fold_left2 add_formal StringMap.empty fdecl.A.formals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals fdecl.A.locals in

    (* Return the value for a variable or formal argument *)
    let lookup n = try StringMap.find n local_vars
                   with Not_found -> StringMap.find n global_vars

and codegen_string_build e builder = 

  let s = L.build_global_stringptr e "tmp1" builder in
  (* try commenting these two lines and compare the result *)
   let zero = L.const_int i32_t 0 in 
   L.build_in_bounds_gep s [| zero |] "tmp1" builder 
 

and  codegen_print e builder = 
(* print_string "reached here" in *)
  let s = L.build_global_stringptr e "tmp1" builder in
  (* try commenting these two lines and compare the result *)
   let zero = L.const_int i32_t 0 in 
  let s = L.build_in_bounds_gep s [| zero |] "tmp1" builder in
    L.build_call printf_func [| s |] "printf" builder in  

(* let rec string_expr builder = function 

 A.String_Lit s -> s 
 | A.Binop (e1, op, e2) ->
     let e1' = string_expr builder e1
     and e2' = string_expr builder e2 in
     let str_concat =  e1' ^ e2'     
 in 
    codegen_string_build str_concat builder
in *) 

let rec expr builder = function
	A.Literal i -> L.const_int i32_t i
     | A.BoolLit b -> L.const_int i1_t (if b then 1 else 0)
     | A.String_Lit s -> codegen_string_build s builder 
     | A.Float_Lit f -> L.const_float f_t f 
     | A.Char_Lit c -> L.const_int i8_t (Char.code c)
      | A.Noexpr -> L.const_int i32_t 0
      | A.Id s -> L.build_load (lookup s) s builder

        | A.Ary(e1, e2) -> let para1=(expr builder (A.Id e1)) 
  and para2=(expr builder e2) in 
  let k=L.build_in_bounds_gep para1 [|para2|] "tmpp" builder in
  L.build_load k "deref" builder
  | A.Aryasn(e1, e2,e3) -> let para1=(expr builder (A.Id e1)) 
  and para2=(expr builder e2) 
  and para3=(expr builder e3) 
  in let k=L.build_in_bounds_gep para1 [|para2|] "tmpp" builder in
  L.build_store para3 k builder
  |   A.Init(e1,e2) -> let cnt1= (lookup e1) and cnt2= expr builder e2 in 
  let tp=L.element_type (L.type_of cnt1) in
  let sz=L.size_of tp in
  let sz1=L.const_intcast sz (i32_t) false in
  let dt=L.build_bitcast (L.build_call calloc_fun [|cnt2;sz1|] "tmpa" builder) tp "tmpb" builder in
  L.build_store dt cnt1 builder


      | A.Binop (e1, op, e2) ->
	  let e1' = expr builder e1
	  and e2' = expr builder e2 in
    let tp1=(L.type_of (L.const_int i32_t 3)) and tp2=(L.type_of (L.const_float f_t 3.2)) 
and tp3=(L.type_of e1') in
	  (match op with
	    A.Add     -> (if tp1=tp3 then (L.build_add) else (L.build_fadd))
	  | A.Sub     -> (if tp1=tp3 then (L.build_sub) else (L.build_fsub))
	  | A.Mult    -> (if tp1=tp3 then (L.build_mul) else (L.build_fmul))
    | A.Div     -> (if tp1=tp3 then (L.build_sdiv) else (L.build_fdiv))
	  | A.And     -> L.build_and
	  | A.Or      -> L.build_or
	  | A.Equal   -> L.build_icmp L.Icmp.Eq
	  | A.Neq     -> L.build_icmp L.Icmp.Ne
	  | A.Less    -> L.build_icmp L.Icmp.Slt
	  | A.Leq     -> L.build_icmp L.Icmp.Sle
	  | A.Greater -> L.build_icmp L.Icmp.Sgt
	  | A.Geq     -> L.build_icmp L.Icmp.Sge
	  ) e1' e2' "tmp" builder
      | A.Unop(op, e) ->
	  let e' = expr builder e in
	  (match op with
	    A.Neg     -> L.build_neg
          | A.Not     -> L.build_not) e' "tmp" builder
      | A.Assign (s, e) -> let e' = expr builder e in
	                   ignore (L.build_store e' (lookup s) builder); e'
| A.Call ("print", [e])  ->
      L.build_call printf_func [| int_format_str ;  (expr builder e) |]
      "printf" builder
  | A.Call ("printstring", [e]) -> L.build_call printf_func [| str_format_str ; (expr builder e) |] "tmp1" builder 
  
| A.Call ("printx", e)  ->
      let actuals = List.rev (List.map (expr builder) (List.rev e)) in
  L.build_call printf_func (Array.of_list actuals) "tmp1" builder 

      | A.Call ("size",[e]) -> let cnt=expr builder e in 
      let cnt2=(L.build_call fopen_fun [|cnt;read_str|] "tmp0" builder) in
      L.build_call ftell_fun [|cnt2|] "tmp7" builder
      | A.Call ("feof",[e])-> let cnt=expr builder e in
      L.build_call feof_fun [|cnt|] "temp1" builder
      | A.Call ("fgetc",[e]) -> let cnt=expr builder e in
  L.build_call fgetc_fun [|cnt|] "temp1" builder
      | A.Call ("remove",[e])-> let cnt=expr builder e in
  L.build_call fremove_fun [|cnt|] "temp1" builder
    | A.Call ("rename",e) -> let actuals = List.rev (List.map (expr builder) (List.rev e)) in
  L.build_call frename_fun (Array.of_list actuals) "tmp2" builder 
      | A.Call ("fff", [e;f]) -> let cnt=expr builder e and cnt2=expr builder f in
  L.build_call fputs_fun [|cnt2;(L.build_call fopen_fun [|cnt;read_str|] "tmp0" builder)|] "tmp5" builder
| A.Call ("memcpy",e) -> let actuals = List.rev (List.map (expr builder) (List.rev e)) in
      L.build_call memcpy_fun (Array.of_list actuals) "tmp8" builder 
| A.Call ("malloc", e)-> let actuals = List.rev (List.map (expr builder) (List.rev e)) in
      L.build_call malloc_fun (Array.of_list actuals) "tmp6" builder 
      | A.Call ("fopen", e) -> let actuals = List.rev (List.map (expr builder) (List.rev e)) in
  L.build_call fopen_fun (Array.of_list actuals) "tmp2" builder 
  | A.Call ("fputc",e) ->let actuals = List.rev (List.map (expr builder) (List.rev e)) in
  L.build_call fputc_fun (Array.of_list actuals) "tmp3" builder 
      | A.Call ("fputs",e) ->let actuals = List.rev (List.map (expr builder) (List.rev e)) in

  L.build_call fputs_fun (Array.of_list actuals) "tmp3" builder 
     | A.Call (f, act) ->
         let (fdef, fdecl) = StringMap.find f function_decls in
	 let actuals = List.rev (List.map (expr builder) (List.rev act)) in
	 let result = (match fdecl.A.typ with A.Void -> ""
                                            | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list actuals) result builder
    in

    (* Invoke "f builder" if the current block doesn't already
       have a terminal (e.g., a branch). *)
    let add_terminal builder f =
      match L.block_terminator (L.insertion_block builder) with
	Some _ -> ()
      | None -> ignore (f builder) in
	
    (* Build the code for the given statement; return the builder for
       the statement's successor *)
    let rec stmt builder = function
	A.Block sl -> List.fold_left stmt builder sl
      | A.Expr e -> ignore (expr builder e); builder
      | A.Return e -> ignore (match fdecl.A.typ with
	  A.Void -> L.build_ret_void builder
	| _ -> L.build_ret (expr builder e) builder); builder
      | A.If (predicate, then_stmt, else_stmt) ->
         let bool_val = expr builder predicate in
	 let merge_bb = L.append_block context "merge" the_function in

	 let then_bb = L.append_block context "then" the_function in
	 add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
	   (L.build_br merge_bb);

	 let else_bb = L.append_block context "else" the_function in
	 add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
	   (L.build_br merge_bb);

	 ignore (L.build_cond_br bool_val then_bb else_bb builder);
	 L.builder_at_end context merge_bb

      | A.While (predicate, body) ->
	  let pred_bb = L.append_block context "while" the_function in
	  ignore (L.build_br pred_bb builder);

	  let body_bb = L.append_block context "while_body" the_function in
	  add_terminal (stmt (L.builder_at_end context body_bb) body)
	    (L.build_br pred_bb);

	  let pred_builder = L.builder_at_end context pred_bb in
	  let bool_val = expr pred_builder predicate in

	  let merge_bb = L.append_block context "merge" the_function in
	  ignore (L.build_cond_br bool_val body_bb merge_bb pred_builder);
	  L.builder_at_end context merge_bb

      | A.For (e1, e2, e3, body) -> stmt builder
	    ( A.Block [A.Expr e1 ; A.While (e2, A.Block [body ; A.Expr e3]) ] )
    in

    (* Build the code for each statement in the function *)
    let builder = stmt builder (A.Block fdecl.A.body) in

    (* Add a return if the last block falls off the end *)
    add_terminal builder (match fdecl.A.typ with
        A.Void -> L.build_ret_void
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in

  (* let f = List.iter build_function_body functions in   *)
  (* let f1 = List.append functions functions2 in  *)
  List.iter build_function_body functions;
  (* let len = List.length functions in 
  ignore(print_int len); *)
  (* in ignore(); *)

  (* and g = process_includes the_module context in ignore(); *)
  (* let file_in = open_in "stdlib.bmwsa" in
  let lexbuf = Lexing.from_channel stdin in
  let ast = Parser.program Scanner.token lexbuf in
  ignore(close_in file_in);
  translate ast; *)
  (* match ast with (Program(first,second)) ->  *)
  (* print_string "Reached here" in  *)
  (* let (globals,sfunctions) = second in  *)
  (* List.iter build_function_body functions in *)

  (* List.iter build_function_body sfunctions; *)
  (* let temp_print = List.length globals in ignore(print_int temp_print); *)
  the_module
