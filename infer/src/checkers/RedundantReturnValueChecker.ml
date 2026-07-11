(*
 * Copyright (c) 2024
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd
module F = Format

(** Collect all expressions stored into the return variable across all CFG nodes.
    Each entry is (expression, location). *)
let collect_return_stores proc_desc =
  let ret_pvar = Procdesc.get_ret_var proc_desc in
  let stores = ref [] in
  Procdesc.iter_nodes
    (fun node ->
      Instrs.iter ~f:(fun instr ->
          match instr with
          | Sil.Store {e1= Lvar pvar; e2; loc} when Pvar.equal pvar ret_pvar ->
              stores := (e2, loc) :: !stores
          | _ ->
              ())
        (Procdesc.Node.get_instrs node))
    proc_desc ;
  List.rev !stores


let checker {IntraproceduralAnalysis.proc_desc; err_log} =
  let return_type = Procdesc.get_ret_type proc_desc in
  if not (Typ.is_void return_type) then
    let stores = collect_return_stores proc_desc in
    match stores with
    | [] ->
        ()
    | _ ->
        let unique_exps =
          List.fold stores ~init:Exp.Set.empty ~f:(fun acc (exp, _loc) ->
              Exp.Set.add exp acc)
        in
        if Int.equal (Exp.Set.cardinal unique_exps) 1 && List.length stores >= 2 then
          let _first_exp, first_loc = List.hd_exn stores in
          let proc_name = Procdesc.get_proc_name proc_desc in
          let simplified_name = Procname.to_simplified_string ~withclass:true proc_name in
          let description =
            F.asprintf
              "All return paths of function %s return the same value. The return type could be \
               void and remove all the return path in function."
              simplified_name
          in
          let ltr = [Errlog.make_trace_element 0 first_loc description []] in
          Reporting.log_issue proc_desc err_log ~loc:first_loc ~ltr RedundantReturnValue
            IssueType.redundant_return_value description
