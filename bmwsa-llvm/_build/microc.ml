(* Top-level of the MicroC compiler: scan & parse the input,
   check the resulting AST, generate LLVM IR, and dump the module *)

type action = Ast | LLVM_IR | Compile

let _ =
  let action = if Array.length Sys.argv > 1 then
    List.assoc Sys.argv.(1) [ ("-a", Ast);	(* Print the AST only *)
			      ("-l", LLVM_IR);  (* Generate LLVM, don't check *)
			      ("-c", Compile) ] (* Generate, check LLVM IR *)
  else Compile in
  (* let file_in  = open_in "stdlib.bmwsa" in  *)
  let lexbuf = Lexing.from_channel stdin in
  let ast = Parser.program Scanner.token lexbuf in
  (* Semant.initial_check ast; *)
  (try Semant.initial_check ast
  with _->print_string(";sbsbsbsbsbsbsb\n"));

  let file_in  = open_in "stdlib.bmwsa" in
  let lexbuf2 = Lexing.from_channel file_in in
  let ast2 = Parser.program Scanner.token lexbuf2 in 
  (* Semant.initial_check ast; *)
(try Semant.initial_check ast
  with _->print_string(";sbsbsbsbsbsbsb\n"));
  match action with
    Ast -> print_string (Ast.string_of_program ast)
  | LLVM_IR -> print_string (Llvm.string_of_llmodule (Codegen.translate (ast,ast2) ))
  | Compile -> let m = Codegen.translate (ast,ast2) in
    Llvm_analysis.assert_valid_module m;
    print_string (Llvm.string_of_llmodule m)
