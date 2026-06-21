(*
 * Copyright (c) ioperation
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd
module F = Format

let checker {IntraproceduralAnalysis.proc_desc; tenv; err_log} =
  let proc_name = Procdesc.get_proc_name proc_desc in
  let return_type = Procdesc.get_ret_type proc_desc in
  match return_type.desc with
  | Tint IBool ->
    let name_str = Procname.get_method proc_name in
    if not (String.is_prefix name_str ~prefix:"Is")
    then
      let loc = Procdesc.get_loc proc_desc in
      let simplified_name = Procname.to_simplified_string ~withclass:true proc_name in
      let description =
        F.asprintf "Boolean-returning function %s should start with `Is`." simplified_name
      in
      let ltr = [Errlog.make_trace_element 0 loc description []] in
      Reporting.log_issue proc_desc err_log ~loc ~ltr FunctionName
        IssueType.bool_function_naming description
  | _ ->
    ()
