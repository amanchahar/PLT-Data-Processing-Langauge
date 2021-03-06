(*===-- llvm_backend.mli.in - LLVM OCaml Interface ------------*- OCaml -*-===*
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is distributed under the University of Illinois Open Source
 * License. See LICENSE.TXT for details.
 *
 *===----------------------------------------------------------------------===*)

(** XCore Initialization.

    This interface provides an OCaml API for initialization of
    the XCore LLVM target. By referencing this module, you will cause
    OCaml to load or link in the LLVM libraries corresponding to the target.
    By calling [initialize], you will register components of this target
    in the target registry, which is necessary in order to emit assembly,
    object files, and so on. *)

external initialize : unit -> unit = "llvm_initialize_XCore"