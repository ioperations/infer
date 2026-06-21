# Explore Clang to SIL pipeline (@explore subagent)

**Session ID:** ses_115660228ffeWTDyFaTO9SnoHC
**Created:** 6/21/2026, 10:33:41 PM
**Updated:** 6/21/2026, 10:36:48 PM

---

## User

Very thoroughly explore how the Clang frontend in Infer translates C/C++/Objective-C source code into SIL. Look at:

1. `infer/src/clang/` directory structure
2. `infer/src/clang/clang.ml` or similar entry point
3. `infer/src/clang/cf_translation.ml` or similar translation files
4. How the clang plugin (`facebook-clang-plugins/`) fits in
5. The key translation steps/visitors

Focus on the pipeline stages: clang AST -> some intermediate representation -> SIL. What are the key modules involved? How does it work?

Return a detailed but concise step-by-step overview of the pipeline from Clang to SIL.

---

## Assistant (Explore · Big Pickle · 3.4s)

_Thinking:_

The user wants a thorough exploration of how the Clang frontend in Infer translates C/C++/Objective-C source code into SIL. Let me systematically explore the codebase.

I'll systematically explore the Clang frontend pipeline from multiple angles.

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang"
}
```

**Output:**

```
<path>infer/src/clang</path>
<type>directory</type>
<entries>
ast_expressions.ml
ast_expressions.mli
CAddImplicitDeallocImpl.ml
CAddImplicitDeallocImpl.mli
CAddImplicitGettersSetters.ml
CAddImplicitGettersSetters.mli
Capture.ml
Capture.mli
cArithmetic_trans.ml
cArithmetic_trans.mli
cAst_utils.ml
cAst_utils.mli
cContext.ml
cContext.mli
cEnum_decl.ml
cEnum_decl.mli
cField_decl.ml
cField_decl.mli
cFrontend_config.ml
cFrontend_config.mli
cFrontend_decl.ml
cFrontend_decl.mli
cFrontend_errors.ml
cFrontend_errors.mli
cFrontend.ml
cFrontend.mli
cGeneral_utils.ml
cGeneral_utils.mli
clang_ast_extend.ml
ClangCommand.ml
ClangCommand.mli
ClangFrontend.mld
ClangFrontendStubs.ml
ClangFrontendStubs.mli
ClangPointers.ml
ClangPointers.mli
ClangQuotes.ml
ClangQuotes.mli
ClangWrapper.ml
ClangWrapper.mli
cLocation.ml
cLocation.mli
cMethod_trans.ml
cMethod_trans.mli
CMethodProperties.ml
CMethodProperties.mli
cMethodSignature.ml
cMethodSignature.mli
CMockPointerSubst.ml
CMockPointerSubst.mli
cModule_type.ml
CppLambdaCalls.ml
CppLambdaCalls.mli
CReplaceDynamicDispatch.ml
CReplaceDynamicDispatch.mli
cScope.ml
cScope.mli
CStructUtils.ml
CStructUtils.mli
cTrans_models.ml
cTrans_models.mli
cTrans_utils.ml
cTrans_utils.mli
cTrans.ml
cTrans.mli
CType_decl.ml
CType_decl.mli
cType_to_sil_type.ml
cType_to_sil_type.mli
CType.ml
CType.mli
cVar_decl.ml
cVar_decl.mli
CViewControllerLifecycle.ml
CViewControllerLifecycle.mli
dune
dune.in
objcCategory_decl.ml
objcCategory_decl.mli
objcInterface_decl.ml
objcInterface_decl.mli
objcMethod_decl.ml
objcMethod_decl.mli
objcProtocol_decl.ml
objcProtocol_decl.mli
SwitchCase.ml
SwitchCase.mli
unit/

(88 entries)
</entries>
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "infer/src/clang/**/*.ml"
}
```

**Output:**

```
infer/src/clang/cAst_utils.ml
infer/src/clang/unit/QualifiedCppNameTests.ml
infer/src/clang/unit/ClangTests.ml
infer/src/clang/objcProtocol_decl.ml
infer/src/clang/objcMethod_decl.ml
infer/src/clang/objcInterface_decl.ml
infer/src/clang/objcCategory_decl.ml
infer/src/clang/clang_ast_extend.ml
infer/src/clang/cVar_decl.ml
infer/src/clang/cType_to_sil_type.ml
infer/src/clang/cTrans_utils.ml
infer/src/clang/cTrans_models.ml
infer/src/clang/cTrans.ml
infer/src/clang/cScope.ml
infer/src/clang/cModule_type.ml
infer/src/clang/cMethod_trans.ml
infer/src/clang/cMethodSignature.ml
infer/src/clang/cLocation.ml
infer/src/clang/cGeneral_utils.ml
infer/src/clang/cFrontend_errors.ml
infer/src/clang/cFrontend_decl.ml
infer/src/clang/cFrontend_config.ml
infer/src/clang/cFrontend.ml
infer/src/clang/cField_decl.ml
infer/src/clang/cEnum_decl.ml
infer/src/clang/cContext.ml
infer/src/clang/cArithmetic_trans.ml
infer/src/clang/ast_expressions.ml
infer/src/clang/SwitchCase.ml
infer/src/clang/CppLambdaCalls.ml
infer/src/clang/ClangWrapper.ml
infer/src/clang/ClangQuotes.ml
infer/src/clang/ClangPointers.ml
infer/src/clang/ClangFrontendStubs.ml
infer/src/clang/ClangCommand.ml
infer/src/clang/Capture.ml
infer/src/clang/CViewControllerLifecycle.ml
infer/src/clang/CType_decl.ml
infer/src/clang/CType.ml
infer/src/clang/CStructUtils.ml
infer/src/clang/CReplaceDynamicDispatch.ml
infer/src/clang/CMockPointerSubst.ml
infer/src/clang/CMethodProperties.ml
infer/src/clang/CAddImplicitGettersSetters.ml
infer/src/clang/CAddImplicitDeallocImpl.ml
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "facebook-clang-plugins/**/*.cpp"
}
```

**Output:**

```
facebook-clang-plugins/libtooling/tests/virtual_bases.cpp
facebook-clang-plugins/libtooling/tests/using_directive.cpp
facebook-clang-plugins/libtooling/tests/unresolved_lookup.cpp
facebook-clang-plugins/libtooling/tests/type_trait.cpp
facebook-clang-plugins/libtooling/tests/this.cpp
facebook-clang-plugins/libtooling/tests/template_instantiations.cpp
facebook-clang-plugins/libtooling/tests/struct.cpp
facebook-clang-plugins/libtooling/tests/sizeof_static_evaluation.cpp
facebook-clang-plugins/libtooling/tests/no_except_expr.cpp
facebook-clang-plugins/libtooling/tests/new.cpp
facebook-clang-plugins/libtooling/tests/namespace_decl.cpp
facebook-clang-plugins/libtooling/tests/materialize_temporary.cpp
facebook-clang-plugins/libtooling/tests/lambda.cpp
facebook-clang-plugins/libtooling/tests/inheriting_constructor.cpp
facebook-clang-plugins/libtooling/tests/inheritance.cpp
facebook-clang-plugins/libtooling/tests/function_template.cpp
facebook-clang-plugins/libtooling/tests/friend.cpp
facebook-clang-plugins/libtooling/tests/expr_with_cleanups.cpp
facebook-clang-plugins/libtooling/tests/dynamic_cast.cpp
facebook-clang-plugins/libtooling/tests/copy_constructor.cpp
facebook-clang-plugins/libtooling/tests/const_cast.cpp
facebook-clang-plugins/libtooling/tests/class_template.cpp
facebook-clang-plugins/libtooling/tests/c_cast.cpp
facebook-clang-plugins/libtooling/tests/bind_temporary.cpp
facebook-clang-plugins/libtooling/atdlib/tests/jsontest.cpp
facebook-clang-plugins/libtooling/atdlib/tests/extract_test.cpp
facebook-clang-plugins/libtooling/atdlib/tests/binioutest.cpp
facebook-clang-plugins/libtooling/SimplePluginASTAction.cpp
facebook-clang-plugins/libtooling/FileUtils.cpp
facebook-clang-plugins/libtooling/AttrParameterVectorStream.cpp
facebook-clang-plugins/libtooling/ASTExporter.cpp
```

---

## Assistant (Explore · Big Pickle · 4.1s)

_Thinking:_

Good, I have a broad overview. Let me now dive deep into the key files to understand the pipeline. Let me start with the main entry point and the key translation files.

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cFrontend.ml"
}
```

**Output:**

```
<path>infer/src/clang/cFrontend.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9: module L = Logging
10:
11: (* ocamlc gets confused by [module rec]: https://caml.inria.fr/mantis/view.php?id=6714 *)
12: (* it also ignores the warning suppression at toplevel, hence the [include struct ... end] trick *)
13: include struct
14:   [@@@warning "-unused-module"]
15:
16:   module rec CTransImpl : CModule_type.CTranslation = CTrans.CTrans_funct (CFrontend_declImpl)
17:
18:   and CFrontend_declImpl : CModule_type.CFrontend = CFrontend_decl.CFrontend_decl_funct (CTransImpl)
19: end
20:
21: (* Translates a file by translating the ast into a cfg. *)
22: let compute_icfg trans_unit_ctx tenv ast =
23:   match ast with
24:   | Clang_ast_t.TranslationUnitDecl (_, decl_list, _, _) ->
25:       CFrontend_config.global_translation_unit_decls := decl_list ;
26:       L.(debug Capture Verbose) "@\n Start creating icfg@\n" ;
27:       let cfg = Cfg.create () in
28:       List.iter
29:         ~f:(CFrontend_declImpl.translate_one_declaration trans_unit_ctx tenv cfg `DeclTraversal)
30:         decl_list ;
31:       L.(debug Capture Verbose) "@\n Finished creating icfg@\n" ;
32:       cfg
33:   | _ ->
34:       assert false
35:
36:
37: (* NOTE: Assumes that an AST always starts with a TranslationUnitDecl *)
38:
39: let init_global_state_capture () =
40:   Ident.NameGenerator.reset () ;
41:   CFrontend_config.global_translation_unit_decls := []
42:
43:
44: let do_objc_preanalyses cfg tenv =
45:   if Config.objc_synthesize_dealloc then CAddImplicitDeallocImpl.process cfg tenv ;
46:   CAddImplicitGettersSetters.process cfg tenv ;
47:   CReplaceDynamicDispatch.process cfg ;
48:   CViewControllerLifecycle.process cfg tenv ;
49:   if Config.compute_captured_context then
50:     NodePrinter.with_html_printing_disabled_if (not Config.preanalysis_html) ~f:(fun () ->
51:         Timer.time Preanalysis
52:           ~f:(fun () -> ComputeCapturedInfo.process cfg)
53:           ~on_timeout:(fun span ->
54:             L.debug Capture Quiet "TIMEOUT in ComputeCapturedInfo.process after %fs of CPU time@\n"
55:               span ) )
56:
57:
58: let do_cpp_preanalyses cfg = CppLambdaCalls.process cfg
59:
60: let do_source_file (translation_unit_context : CFrontend_config.translation_unit_context) ast =
61:   let tenv = Tenv.create () in
62:   CType_decl.add_predefined_types tenv ;
63:   init_global_state_capture () ;
64:   let source_file = translation_unit_context.CFrontend_config.source_file in
65:   let integer_type_widths = translation_unit_context.CFrontend_config.integer_type_widths in
66:   L.(debug Capture Verbose)
67:     "@\n Start building call/cfg graph for '%a'....@\n" SourceFile.pp source_file ;
68:   let cfg = compute_icfg translation_unit_context tenv ast in
69:   Config.inline_func_pointer_for_testing
70:   |> Option.iter ~f:(fun prefix -> CMockPointerSubst.process cfg prefix) ;
71:   ( match translation_unit_context.CFrontend_config.lang with
72:   | CFrontend_config.ObjC | CFrontend_config.ObjCPP ->
73:       do_objc_preanalyses cfg tenv
74:   | _ ->
75:       () ) ;
76:   ( match translation_unit_context.CFrontend_config.lang with
77:   | CFrontend_config.CPP | CFrontend_config.ObjCPP ->
78:       do_cpp_preanalyses cfg
79:   | _ ->
80:       () ) ;
81:   L.(debug Capture Verbose) "@\n End building call/cfg graph for '%a'.@\n" SourceFile.pp source_file ;
82:   (* Generate textual SIL if requested:
83:      --dump-textual: write .sil file to disk AND store in capture.db
84:      --store-textual: store in capture.db only (no file on disk) *)
85:   let textual =
86:     if Config.dump_textual || Config.store_textual then (
87:       let filename = Filename.chop_extension (SourceFile.to_abs_path source_file) ^ ".sil" in
88:       ( if Config.dump_textual then
89:           let ext = if Config.frontend_tests then ".test.sil" else ".sil" in
90:           let dump_filename = Filename.chop_extension (SourceFile.to_abs_path source_file) ^ ext in
91:           TextualOfSil.from_c source_file dump_filename tenv cfg ) ;
92:       Some (TextualOfSil.to_string ~lang:C ~sil_source_file:source_file ~filename tenv cfg) )
93:     else None
94:   in
95:   SourceFiles.add ?textual source_file cfg (Tenv.FileLocal tenv) (Some integer_type_widths) ;
96:   if Config.debug_mode then Tenv.store_debug_file_for_source source_file tenv ;
97:   if
98:     Config.debug_mode || Config.testing_mode || Config.frontend_tests
99:     || Option.is_some Config.icfg_dotty_outfile
100:   then DotCfg.emit_frontend_cfg source_file cfg ;
101:   L.debug Capture Verbose "Stored on disk:@[<v>%a@]@." Cfg.pp_proc_signatures cfg ;
102:   ()

(End of file - total 102 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cFrontend.mli"
}
```

**Output:**

```
<path>infer/src/clang/cFrontend.mli</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: val do_source_file : CFrontend_config.translation_unit_context -> Clang_ast_t.decl -> unit
11: (** Translate one file into a cfg. Create a tenv, cg and cfg file for a source file given its ast in
12:     json format. Translate the json file into a cfg by adding all the type and class declarations to
13:     the tenv, adding all the functions and methods declarations as procdescs to the cfg, and adding
14:     the control flow graph of all the code of those functions and methods to the cfg. *)

(End of file - total 14 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/Capture.ml"
}
```

**Output:**

```
<path>infer/src/clang/Capture.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7: open! IStd
8: module L = Logging
9:
10: (** enable debug mode (to get more data saved to disk for future inspections) *)
11: let debug_mode = Config.debug_mode || Config.frontend_stats
12:
13: (** This function reads the json file in fname, validates it, and encodes in the AST data structure
14:     defined in Clang_ast_t. *)
15: let validate_decl_from_file file =
16:   match file with
17:   | `Biniou fname ->
18:       Atdgen_runtime.Util.Biniou.from_file ~len:CFrontend_config.biniou_buffer_size
19:         Clang_ast_b.read_decl fname
20:   | `Yojson fname ->
21:       Atdgen_runtime.Util.Json.from_file Clang_ast_j.read_decl fname
22:
23:
24: let validate_decl_from_channel chan =
25:   Atdgen_runtime.Util.Biniou.from_channel ~len:CFrontend_config.biniou_buffer_size
26:     Clang_ast_b.read_decl chan
27:
28:
29: let init_global_state_for_capture_and_linters source_file =
30:   L.debug Capture Medium "Processing %s" (Filename.basename (SourceFile.to_abs_path source_file)) ;
31:   !WorkerPoolState.update_status None (SourceFile.to_string source_file) ;
32:   Language.set_language Clang ;
33:   if Config.capture then DB.Results_dir.init source_file ;
34:   CFrontend_config.reset_global_state ()
35:
36:
37: let run_clang_frontend ast_source =
38:   let init_time = Mtime_clock.counter () in
39:   let print_elapsed () =
40:     L.(debug Capture Quiet) "Elapsed: %a.@\n" Mtime.Span.pp (Mtime_clock.count init_time)
41:   in
42:   let ast_decl =
43:     match ast_source with
44:     | `File file ->
45:         validate_decl_from_file file
46:     | `BiniouPipe chan ->
47:         validate_decl_from_channel chan
48:   in
49:   let trans_unit_ctx =
50:     match ast_decl with
51:     | Clang_ast_t.TranslationUnitDecl (_, _, _, info) ->
52:         let source_file = SourceFile.from_abs_path info.Clang_ast_t.tudi_input_path in
53:         init_global_state_for_capture_and_linters source_file ;
54:         let lang =
55:           match info.Clang_ast_t.tudi_input_kind with
56:           | `IK_C ->
57:               CFrontend_config.C
58:           | `IK_CXX ->
59:               CFrontend_config.CPP
60:           | `IK_ObjC ->
61:               CFrontend_config.ObjC
62:           | `IK_ObjCXX ->
63:               CFrontend_config.ObjCPP
64:           | _ ->
65:               assert false
66:         in
67:         let integer_type_widths =
68:           let widths = info.Clang_ast_t.tudi_integer_type_widths in
69:           { IntegerWidths.char_width= widths.itw_char_type
70:           ; short_width= widths.itw_short_type
71:           ; int_width= widths.itw_int_type
72:           ; long_width= widths.itw_long_type
73:           ; longlong_width= widths.itw_longlong_type }
74:         in
75:         let is_objc_arc_on = info.Clang_ast_t.tudi_is_objc_arc_on in
76:         {CFrontend_config.source_file; lang; integer_type_widths; is_objc_arc_on}
77:     | _ ->
78:         assert false
79:   in
80:   let pp_ast_filename fmt ast_source =
81:     match ast_source with
82:     | `File (`Biniou path) | `File (`Yojson path) ->
83:         Format.pp_print_string fmt path
84:     | `BiniouPipe _ ->
85:         Format.fprintf fmt "stdin of %a" SourceFile.pp trans_unit_ctx.CFrontend_config.source_file
86:   in
87:   ClangPointers.populate_all_tables ast_decl ;
88:   L.(debug Capture Medium)
89:     "Start %s the AST of %a@\n" Config.clang_frontend_action_string pp_ast_filename ast_source ;
90:   (* run callbacks *)
91:   if Config.capture then CFrontend.do_source_file trans_unit_ctx ast_decl ;
92:   L.(debug Capture Medium)
93:     "End %s the AST of file %a... OK!@\n" Config.clang_frontend_action_string pp_ast_filename
94:     ast_source ;
95:   print_elapsed ()
96:
97:
98: let run_clang_frontend ast_source =
99:   PerfEvent.(
100:     log (fun logger ->
101:         PerfEvent.log_begin_event logger ~categories:["frontend"] ~name:"clang frontend" () ) ) ;
102:   run_clang_frontend ast_source ;
103:   PerfEvent.(log (fun logger -> PerfEvent.log_end_event logger ()))
104:
105:
106: let run_and_validate_clang_frontend ast_source =
107:   try run_clang_frontend ast_source
108:   with exc ->
109:     IExn.reraise_if exc ~f:(fun () -> not Config.keep_going) ;
110:     L.internal_error "ERROR RUNNING CAPTURE: %a@\n%s@\n" Exn.pp exc (Printexc.get_backtrace ())
111:
112:
113: let run_clang clang_command read =
114:   let exit_with_error exit_code =
115:     L.external_error "Error: the following clang command did not run successfully:@\n  %a@."
116:       ClangCommand.pp clang_command ;
117:     L.exit exit_code
118:   in
119:   (* NOTE: exceptions will propagate through without exiting here *)
120:   match Utils.with_process_in (ClangCommand.command_to_run clang_command) read with
121:   | res, Ok () ->
122:       res
123:   | _, Error (`Exit_non_zero n) ->
124:       (* exit with the same error code as clang in case of compilation failure *)
125:       exit_with_error n
126:   | _ ->
127:       exit_with_error 1
128:
129:
130: let run_clang clang_command read =
131:   PerfEvent.(
132:     log (fun logger -> PerfEvent.log_begin_event logger ~categories:["frontend"] ~name:"clang" ()) ) ;
133:   let result = run_clang clang_command read in
134:   PerfEvent.(log (fun logger -> PerfEvent.log_end_event logger ())) ;
135:   result
136:
137:
138: let run_plugin_and_frontend source_path frontend clang_cmd =
139:   let clang_plugin_cmd = ClangCommand.with_plugin_args clang_cmd in
140:   if debug_mode then (
141:     (* -cc1 clang commands always set -o explicitly *)
142:     let basename = source_path ^ ".ast" in
143:     (* Emit the clang command with the extra args piped to infer-as-clang *)
144:     let frontend_script_fname = Printf.sprintf "%s.sh" basename in
145:     let debug_script_out = Out_channel.create frontend_script_fname in
146:     let debug_script_fmt = Format.formatter_of_out_channel debug_script_out in
147:     let biniou_fname = Printf.sprintf "%s.biniou" basename in
148:     Format.fprintf debug_script_fmt "%s \\@\n  > %s@\n"
149:       (ClangCommand.command_to_run clang_plugin_cmd)
150:       biniou_fname ;
151:     Format.fprintf debug_script_fmt
152:       "bdump -x -d \"%s/clang_ast.dict\" -w '!!DUMMY!!' %s \\@\n  > %s.bdump" Config.etc_dir
153:       biniou_fname basename ;
154:     Out_channel.close debug_script_out ) ;
155:   run_clang clang_plugin_cmd frontend
156:
157:
158: let cc1_capture clang_cmd =
159:   let source_path =
160:     let root = Unix.getcwd () in
161:     let orig_argv = ClangCommand.get_orig_argv clang_cmd in
162:     (* the source file is always the last argument of the original -cc1 clang command, except when it isnt *)
163:     let argv_without_flags =
164:       List.filter orig_argv ~f:(fun arg -> not (String.is_prefix ~prefix:"-" arg))
165:     in
166:     Utils.filename_to_absolute ~root (List.last_exn argv_without_flags)
167:   in
168:   L.(debug Capture Quiet) "@\n*** Beginning capture of file %s ***@\n" source_path ;
169:   if
170:     InferCommand.equal Config.command Compile
171:     || (not Config.skip_analysis_in_path_skips_compilation)
172:        && CLocation.is_file_block_listed source_path
173:   then (
174:     L.(debug Capture Quiet) "@\n Skip the analysis of source file %s@\n@\n" source_path ;
175:     (* We still need to run clang, but we don't have to attach the plugin. *)
176:     run_clang clang_cmd Utils.consume_in )
177:   else if
178:     Config.skip_analysis_in_path_skips_compilation && CLocation.is_file_block_listed source_path
179:   then (
180:     L.(debug Capture Quiet) "@\n Skip compilation and analysis of source file %s@\n@\n" source_path ;
181:     () )
182:   else
183:     match Config.clang_ast_file with
184:     | Some fname ->
185:         run_and_validate_clang_frontend (`File fname)
186:     | None ->
187:         run_plugin_and_frontend source_path
188:           (fun chan_in -> run_and_validate_clang_frontend (`BiniouPipe chan_in))
189:           clang_cmd
190:
191:
192: let capture clang_cmd =
193:   if ClangCommand.can_attach_ast_exporter clang_cmd then
194:     (* this command compiles some code; replace the invocation of clang with our own clang and
195:        plugin *)
196:     cc1_capture clang_cmd
197:   else if Option.exists Config.buck_mode ~f:BuckMode.is_clang_compilation_db then
198:     (* when running with buck's compilation-database, skip commands where frontend cannot be
199:        attached, as they may cause unnecessary compilation errors *)
200:     ()
201:   else (
202:     (* Non-compilation (eg, linking) command. Run the command as-is. It will not get captured
203:        further since `clang -### ...` will only output commands that invoke binaries using their
204:        absolute paths. *)
205:     L.(debug Capture Medium)
206:       "Running non-cc command without capture: %a@\n" ClangCommand.pp clang_cmd ;
207:     run_clang clang_cmd Utils.echo_in ;
208:     () )

(End of file - total 208 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/Capture.mli"
}
```

**Output:**

```
<path>infer/src/clang/Capture.mli</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: val run_clang : ClangCommand.t -> (In_channel.t -> 'a) -> 'a
11:
12: val capture : ClangCommand.t -> unit
13: (** If the command is detected to correspond to a source file, translate it.
14:
15:     + Given a compilation command, attach our [ASTExporter] clang plugin to the command and run it.
16:     + Our clang plugin emits the AST (Abstract Syntax Tree) as Biniou data that we deserialize. The
17:       AST format is described in {!module-ATDGenerated.Clang_ast_t} (and its Biniou API is in
18:       {!module-ATDGenerated.Clang_ast_b}).
19:     + If enabled, invoke translation to {!module-IR.Sil} via {!module-CFrontend}. *)

(End of file - total 19 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cFrontend_decl.ml"
}
```

**Output:**

```
<path>infer/src/clang/cFrontend_decl.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9: module F = Format
10:
11: (** Translate declarations **)
12:
13: module L = Logging
14:
15: module CFrontend_decl_funct (T : CModule_type.CTranslation) : CModule_type.CFrontend = struct
16:   (** Translates the method/function's body into nodes of the cfg. *)
17:   let add_method ?(is_destructor_wrapper = false) trans_unit_ctx tenv cfg class_decl_opt procname
18:       body ms has_return_param outer_context_opt extra_instrs =
19:     L.(debug Capture Verbose)
20:       "@\n@\n>>---------- ADDING METHOD: '%a' ---------<<@\n@\n" Procname.pp procname ;
21:     incr CFrontend_config.procedures_attempted ;
22:     let recover () =
23:       incr CFrontend_config.procedures_failed ;
24:       Procname.Hash.remove cfg procname ;
25:       let method_kind = ms.CMethodSignature.method_kind in
26:       CMethod_trans.create_external_procdesc trans_unit_ctx cfg procname method_kind None
27:     in
28:     let pp_context fmt () =
29:       F.fprintf fmt "Aborting translation of method '%a' in file '%a'" Procname.pp procname
30:         SourceFile.pp trans_unit_ctx.CFrontend_config.source_file
31:     in
32:     let f () =
33:       match Procname.Hash.find_opt cfg procname with
34:       | Some procdesc when Procdesc.is_defined procdesc ->
35:           L.(debug Capture Verbose)
36:             "@\n@\n>>---------- Start translating body of function: '%s' ---------<<@\n@."
37:             (Procname.to_string procname) ;
38:           let context =
39:             CContext.create_context trans_unit_ctx tenv cfg procdesc class_decl_opt has_return_param
40:               outer_context_opt
41:           in
42:           let context =
43:             {context with vars_to_destroy= CScope.Variables.compute_vars_to_destroy_map context body}
44:           in
45:           let start_node = Procdesc.get_start_node procdesc in
46:           let exit_node = Procdesc.get_exit_node procdesc in
47:           let meth_body_nodes =
48:             T.instructions_trans context body extra_instrs exit_node ~is_destructor_wrapper
49:           in
50:           Procdesc.node_set_succs procdesc start_node ~normal:meth_body_nodes ~exn:[]
51:       | _ ->
52:           ()
53:     in
54:     CFrontend_errors.protect ~f ~recover ~pp_context
55:
56:
57:   let function_decl trans_unit_ctx tenv cfg func_decl block_data_opt =
58:     try
59:       let captured_vars, outer_context_opt =
60:         match block_data_opt with
61:         | Some {CModule_type.captured_vars; context= outer_context} ->
62:             (captured_vars, Some outer_context)
63:         | None ->
64:             ([], None)
65:       in
66:       let block_as_arg_attributes, procname, block_return_type =
67:         match block_data_opt with
68:         | Some {CModule_type.block_as_arg_attributes; procname; return_type} ->
69:             (block_as_arg_attributes, procname, Some return_type)
70:         | _ ->
71:             (None, CType_decl.CProcname.from_decl ~tenv func_decl, None)
72:       in
73:       let ms, body_opt, extra_instrs =
74:         CType_decl.method_signature_body_of_decl tenv func_decl ?block_return_type
75:           ~block_as_arg_attributes procname
76:       in
77:       match body_opt with
78:       | Some body ->
79:           (* Only in the case the function declaration has a defined body we create a procdesc *)
80:           let return_param_typ_opt = ms.CMethodSignature.return_param_typ in
81:           let loc_instantiated =
82:             CMethodProperties.get_point_of_instantiation func_decl
83:             |> Option.map
84:                  ~f:(CLocation.clang_to_sil_location trans_unit_ctx.CFrontend_config.source_file)
85:           in
86:           if
87:             CMethod_trans.create_local_procdesc ?loc_instantiated trans_unit_ctx cfg tenv ms [body]
88:               captured_vars
89:           then
90:             add_method trans_unit_ctx tenv cfg CContext.ContextNoCls procname body ms
91:               return_param_typ_opt outer_context_opt extra_instrs
92:       | None ->
93:           ()
94:     with CFrontend_errors.IncorrectAssumption _ -> ()
95:
96:
97:   let process_method_decl ?(inside_cpp_lambda_expr = false) ?loc_instantiated
98:       ?(set_objc_accessor_attr = false) ?(is_destructor = false) trans_unit_ctx tenv cfg curr_class
99:       meth_decl =
100:     try
101:       let ms, body_opt, extra_instrs =
102:         let procname = CType_decl.CProcname.from_decl ~tenv meth_decl in
103:         CType_decl.method_signature_body_of_decl tenv meth_decl procname
104:       in
105:       match body_opt with
106:       | Some body ->
107:           let procname = ms.CMethodSignature.name in
108:           let return_param_typ_opt = ms.CMethodSignature.return_param_typ in
109:           let is_cpp_lambda_call_operator =
110:             CMethodProperties.is_cpp_lambda_call_operator meth_decl
111:           in
112:           let add_method_if_create_procdesc ms procname ~is_destructor_wrapper =
113:             if
114:               (* Do not translate body for lambda operator() if it comes from call expr rather than lambda expr
115:                  as captured variables will not be translated yet *)
116:               let body_new =
117:                 if is_cpp_lambda_call_operator && not inside_cpp_lambda_expr then [] else [body]
118:               in
119:               CMethod_trans.create_local_procdesc ?loc_instantiated ~set_objc_accessor_attr
120:                 ~is_cpp_lambda_call_operator trans_unit_ctx cfg tenv ms body_new []
121:             then
122:               if (not is_cpp_lambda_call_operator) || inside_cpp_lambda_expr then
123:                 add_method trans_unit_ctx tenv cfg curr_class procname body ms return_param_typ_opt
124:                   None extra_instrs ~is_destructor_wrapper
125:           in
126:           ignore (add_method_if_create_procdesc ms procname ~is_destructor_wrapper:is_destructor) ;
127:           if is_destructor then
128:             (* For a destructor we create two procedures: a destructor wrapper and an inner destructor *)
129:             (* A destructor wrapper is called from the outside, i.e. for destructing local variables and fields *)
130:             (* The destructor wrapper calls the inner destructor which has the actual body *)
131:             let new_method_name =
132:               Config.clang_inner_destructor_prefix ^ Procname.get_method procname
133:             in
134:             let new_procname = Procname.objc_cpp_replace_method_name procname new_method_name in
135:             let new_ms = {ms with name= new_procname} in
136:             add_method_if_create_procdesc new_ms new_procname ~is_destructor_wrapper:false
137:       | None ->
138:           if set_objc_accessor_attr then
139:             ignore
140:               (CMethod_trans.create_local_procdesc ~set_objc_accessor_attr trans_unit_ctx cfg tenv
141:                  ms [] [] )
142:           else
143:             let proc_attributes =
144:               CMethod_trans.create_attributes ~set_objc_accessor_attr trans_unit_ctx tenv ms []
145:             in
146:             Attributes.store ~proc_desc:None proc_attributes ~analysis:false
147:     with CFrontend_errors.IncorrectAssumption _ -> ()
148:
149:
150:   let process_property_implementation trans_unit_ctx tenv cfg curr_class
151:       obj_c_property_impl_decl_info =
152:     let property_decl_opt = obj_c_property_impl_decl_info.Clang_ast_t.opidi_property_decl in
153:     match CAst_utils.get_decl_opt_with_decl_ref_opt property_decl_opt with
154:     | Some (ObjCPropertyDecl (_, _, obj_c_property_decl_info)) ->
155:         let process_accessor pointer =
156:           match CAst_utils.get_decl_opt_with_decl_ref_opt pointer with
157:           | Some (ObjCMethodDecl _ as dec) ->
158:               process_method_decl ~set_objc_accessor_attr:true trans_unit_ctx tenv cfg curr_class
159:                 dec
160:           | _ ->
161:               ()
162:         in
163:         process_accessor obj_c_property_decl_info.Clang_ast_t.opdi_getter_method ;
164:         process_accessor obj_c_property_decl_info.Clang_ast_t.opdi_setter_method
165:     | _ ->
166:         ()
167:
168:
169:   let process_one_method_decl ~inside_cpp_lambda_expr ~loc_instantiated trans_unit_ctx tenv cfg
170:       curr_class dec =
171:     let open Clang_ast_t in
172:     match dec with
173:     | CXXMethodDecl _ | CXXConstructorDecl _ | CXXConversionDecl _ ->
174:         process_method_decl ~inside_cpp_lambda_expr ?loc_instantiated trans_unit_ctx tenv cfg
175:           curr_class dec
176:     | CXXDestructorDecl _ ->
177:         process_method_decl ?loc_instantiated trans_unit_ctx tenv cfg curr_class dec
178:           ~is_destructor:true
179:     | ObjCMethodDecl _ ->
180:         process_method_decl ?loc_instantiated trans_unit_ctx tenv cfg curr_class dec
181:     | ObjCPropertyImplDecl (_, obj_c_property_impl_decl_info) ->
182:         process_property_implementation trans_unit_ctx tenv cfg curr_class
183:           obj_c_property_impl_decl_info
184:     | EmptyDecl _ | ObjCIvarDecl _ | ObjCPropertyDecl _ | ObjCInterfaceDecl _ ->
185:         ()
186:     | AccessSpecDecl _
187:     | BindingDecl _
188:     | BlockDecl _
189:     | BuiltinTemplateDecl _
190:     | CapturedDecl _
191:     | ClassTemplateDecl _
192:     | ClassTemplatePartialSpecializationDecl _
193:     | ClassTemplateSpecializationDecl _
194:     | ConceptDecl _
195:     | ConstructorUsingShadowDecl _
196:     | CXXDeductionGuideDecl _
197:     | CXXRecordDecl _
198:     | DecompositionDecl _
199:     | EnumConstantDecl _
200:     | EnumDecl _
201:     | ExportDecl _
202:     | ExternCContextDecl _
203:     | FieldDecl _
204:     | FileScopeAsmDecl _
205:     | FriendDecl _
206:     | FriendTemplateDecl _
207:     | FunctionDecl _
208:     | FunctionTemplateDecl _
209:     | HLSLBufferDecl _
210:     | HLSLRootSignatureDecl _
211:     | ImplicitConceptSpecializationDecl _
212:     | ImplicitParamDecl _
213:     | ImportDecl _
214:     | IndirectFieldDecl _
215:     | LabelDecl _
216:     | LifetimeExtendedTemporaryDecl _
217:     | LinkageSpecDecl _
218:     | MSGuidDecl _
219:     | MSPropertyDecl _
220:     | NamespaceAliasDecl _
221:     | NamespaceDecl _
222:     | NonTypeTemplateParmDecl _
223:     | ObjCAtDefsFieldDecl _
224:     | ObjCCategoryDecl _
225:     | ObjCCategoryImplDecl _
226:     | ObjCCompatibleAliasDecl _
227:     | ObjCImplementationDecl _
228:     | ObjCProtocolDecl _
229:     | ObjCTypeParamDecl _
230:     | OMPAllocateDecl _
231:     | OMPCapturedExprDecl _
232:     | OMPDeclareMapperDecl _
233:     | OMPDeclareReductionDecl _
234:     | OMPRequiresDecl _
235:     | OMPThreadPrivateDecl _
236:     | OpenACCDeclareDecl _
237:     | OpenACCRoutineDecl _
238:     | OutlinedFunctionDecl _
239:     | ParmVarDecl _
240:     | PragmaCommentDecl _
241:     | PragmaDetectMismatchDecl _
242:     | RecordDecl _
243:     | RequiresExprBodyDecl _
244:     | StaticAssertDecl _
245:     | TemplateParamObjectDecl _
246:     | TemplateTemplateParmDecl _
247:     | TemplateTypeParmDecl _
248:     | TopLevelStmtDecl _
249:     | TranslationUnitDecl _
250:     | TypeAliasDecl _
251:     | TypeAliasTemplateDecl _
252:     | TypedefDecl _
253:     | UnnamedGlobalConstantDecl _
254:     | UnresolvedUsingIfExistsDecl _
255:     | UnresolvedUsingTypenameDecl _
256:     | UnresolvedUsingValueDecl _
257:     | UsingDecl _
258:     | UsingDirectiveDecl _
259:     | UsingEnumDecl _
260:     | UsingPackDecl _
261:     | UsingShadowDecl _
262:     | VarDecl _
263:     | VarTemplateDecl _
264:     | VarTemplatePartialSpecializationDecl _
265:     | VarTemplateSpecializationDecl _ ->
266:         (* TODO: some form of logging *)
267:         ()
268:
269:
270:   let process_methods ?(inside_cpp_lambda_expr = false) ?loc_instantiated trans_unit_ctx tenv cfg
271:       curr_class decl_list =
272:     List.iter
273:       ~f:
274:         (process_one_method_decl ~inside_cpp_lambda_expr ~loc_instantiated trans_unit_ctx tenv cfg
275:            curr_class )
276:       decl_list
277:
278:
279:   (* Here we add an empty dealloc method to every ObjC class if it doesn't have one. Then the implicit
280:      implementation of such method will be added in CAddImplicitDeallocImpl.process *)
281:   let create_and_process_dealloc_objc_impl trans_unit_ctx tenv cfg curr_class objc_class_decl_info
282:       decl_list =
283:     let open Clang_ast_t in
284:     let found_dealloc =
285:       List.exists
286:         ~f:(fun decl ->
287:           match decl with
288:           | ObjCMethodDecl (_, name_info, mdi) ->
289:               String.equal name_info.ni_name "dealloc" && mdi.Clang_ast_t.omdi_is_instance_method
290:           | _ ->
291:               false )
292:         decl_list
293:     in
294:     if not found_dealloc then
295:       let name_info =
296:         {ni_name= CFrontend_config.dealloc; ni_qual_name= [CFrontend_config.dealloc]}
297:       in
298:       let decl_info =
299:         { di_pointer= CAst_utils.get_fresh_pointer ()
300:         ; di_parent_pointer= Some objc_class_decl_info.Clang_ast_t.di_pointer
301:         ; di_source_range= objc_class_decl_info.Clang_ast_t.di_source_range
302:         ; di_owning_module= objc_class_decl_info.Clang_ast_t.di_owning_module
303:         ; di_is_hidden= true
304:         ; di_is_implicit= true
305:         ; di_is_used= true
306:         ; di_is_this_declaration_referenced= false
307:         ; di_is_invalid_decl= false
308:         ; di_attributes= []
309:         ; di_full_comment= None
310:         ; di_access= `None }
311:       in
312:       let obj_c_method_decl_info =
313:         { omdi_is_instance_method= true
314:         ; omdi_result_type= Ast_expressions.create_void_type
315:         ; omdi_is_property_accessor= false
316:         ; omdi_property_decl= None
317:         ; omdi_parameters= []
318:         ; omdi_implicit_parameters= []
319:         ; omdi_is_variadic= false
320:         ; omdi_is_overriding= true
321:         ; omdi_is_optional= false
322:         ; omdi_body= Some (`CompoundStmt (CAst_utils.dummy_stmt_info (), []))
323:         ; omdi_mangled_name= CFrontend_config.dealloc }
324:       in
325:       let method_decl = ObjCMethodDecl (decl_info, name_info, obj_c_method_decl_info) in
326:       process_method_decl trans_unit_ctx tenv cfg curr_class method_decl
327:
328:
329:   (** Given REVERSED list of method qualifiers (method_name::class_name::rest_quals), return whether
330:       method should be translated based on method and class allow lists *)
331:   let is_allow_listed_cpp_method =
332:     let method_matcher =
333:       QualifiedCppName.Match.of_fuzzy_qual_names Config.allow_listed_cpp_methods
334:     in
335:     let class_matcher =
336:       QualifiedCppName.Match.of_fuzzy_qual_names Config.allow_listed_cpp_classes
337:     in
338:     fun qual_name ->
339:       (* either the method is explictely allow listed, or the whole class is allow listed *)
340:       QualifiedCppName.Match.match_qualifiers method_matcher qual_name
341:       ||
342:       match QualifiedCppName.extract_last qual_name with
343:       | Some (_, class_qual_name) ->
344:           (* make sure the class name is not empty; in particular, it cannot be a C function *)
345:           QualifiedCppName.Match.match_qualifiers class_matcher class_qual_name
346:       | None ->
347:           false
348:
349:
350:   let never_translate_decl (dec : Clang_ast_t.decl) =
351:     match dec with
352:     | FunctionDecl (_, name_info, _, _)
353:     | CXXMethodDecl (_, name_info, _, _, _)
354:     | CXXConstructorDecl (_, name_info, _, _, _)
355:     | CXXConversionDecl (_, name_info, _, _, _)
356:     | CXXDestructorDecl (_, name_info, _, _, _) ->
357:         let fun_name = name_info.Clang_ast_t.ni_name in
358:         String.is_prefix ~prefix:(Procname.to_string BuiltinDecl.__infer_skip) fun_name
359:     | _ ->
360:         false
361:
362:
363:   let should_store_attributes (dec : Clang_ast_t.decl) = not (never_translate_decl dec)
364:
365:   let should_translate_decl trans_unit_ctx (dec : Clang_ast_t.decl) decl_trans_context =
366:     let info = Clang_ast_proj.get_decl_tuple dec in
367:     let source_range = info.Clang_ast_t.di_source_range in
368:     let translate_when_used =
369:       match dec with
370:       | FunctionDecl (_, name_info, _, _)
371:       | CXXMethodDecl (_, name_info, _, _, _)
372:       | CXXConstructorDecl (_, name_info, _, _, _)
373:       | CXXConversionDecl (_, name_info, _, _, _)
374:       | CXXDestructorDecl (_, name_info, _, _, _) ->
375:           is_allow_listed_cpp_method (CAst_utils.get_qualified_name name_info)
376:       | _ ->
377:           false
378:     in
379:     let always_translate =
380:       match dec with
381:       | VarDecl (_, {ni_name}, _, _) ->
382:           String.is_prefix ni_name ~prefix:"__infer_"
383:       | _ ->
384:           false
385:     in
386:     let translate_location =
387:       always_translate
388:       || CLocation.should_translate_lib trans_unit_ctx.CFrontend_config.source_file source_range
389:            decl_trans_context ~translate_when_used
390:     in
391:     (not (never_translate_decl dec)) && translate_location
392:
393:
394:   let is_method_decl (decl : Clang_ast_t.decl) =
395:     match decl with
396:     | CXXMethodDecl _
397:     | CXXConstructorDecl _
398:     | CXXConversionDecl _
399:     | CXXDestructorDecl _
400:     | FunctionTemplateDecl _ ->
401:         true
402:     | _ ->
403:         false
404:
405:
406:   let is_used_in_file (sl_file_class : Clang_ast_t.source_file) ctx_source_file =
407:     match Utils.realpath ~warn_on_error:false sl_file_class with
408:     | resolved ->
409:         String.equal resolved ctx_source_file
410:     | exception Unix.Unix_error _ ->
411:         false
412:
413:
414:   let rec store_attributes tenv trans_unit_ctx dec =
415:     let open Clang_ast_t in
416:     let store dec = store_attributes tenv trans_unit_ctx dec in
417:     match dec with
418:     | CXXMethodDecl (decl_info, _, _, _, _)
419:     | CXXConstructorDecl (decl_info, _, _, _, _)
420:     | CXXConversionDecl (decl_info, _, _, _, _)
421:     | CXXDestructorDecl (decl_info, _, _, _, _) -> (
422:         let parent_ptr = Option.value_exn decl_info.Clang_ast_t.di_parent_pointer in
423:         let class_decl = CAst_utils.get_decl parent_ptr in
424:         let ctx_source_file =
425:           trans_unit_ctx.CFrontend_config.source_file |> SourceFile.to_abs_path |> Utils.realpath
426:         in
427:         match class_decl with
428:         | Some
429:             (ClassTemplateSpecializationDecl (_, _, _, _, _, _, _, _, _, {sl_file= Some sl_file}, _))
430:           when Config.cxx && is_used_in_file sl_file ctx_source_file ->
431:             let ms =
432:               let procname = CType_decl.CProcname.from_decl ~tenv dec in
433:               CType_decl.method_signature_of_decl tenv dec procname
434:             in
435:             let proc_attributes =
436:               CMethod_trans.create_attributes ~set_objc_accessor_attr:false trans_unit_ctx tenv ms
437:                 []
438:             in
439:             Attributes.store ~proc_desc:None proc_attributes ~analysis:false
440:         | _ ->
441:             () )
442:     | ClassTemplateSpecializationDecl (di, _, _, decl_list, _, _, rdi, _, _, _, _)
443:     | CXXRecordDecl (di, _, _, decl_list, _, _, rdi, _)
444:     | RecordDecl (di, _, _, decl_list, _, _, rdi)
445:       when (not di.di_is_implicit) || rdi.rdi_is_complete_definition ->
446:         let method_decls = List.filter ~f:is_method_decl decl_list in
447:         List.iter ~f:store method_decls
448:     | _ ->
449:         ()
450:
451:
452:   (* Translate one global declaration *)
453:   let rec translate_one_declaration trans_unit_ctx tenv cfg decl_trans_context dec =
454:     let open Clang_ast_t in
455:     (* each procedure has different scope: start names from id 0 *)
456:     Ident.NameGenerator.reset () ;
457:     let translate dec = translate_one_declaration trans_unit_ctx tenv cfg decl_trans_context dec in
458:     if should_translate_decl trans_unit_ctx dec decl_trans_context then
459:       let dec_ptr = (Clang_ast_proj.get_decl_tuple dec).di_pointer in
460:       match dec with
461:       | FunctionDecl (_, _, _, _) ->
462:           function_decl trans_unit_ctx tenv cfg dec None
463:       | ObjCInterfaceDecl (_, _, decl_list, _, _) ->
464:           let curr_class = CContext.ContextClsDeclPtr dec_ptr in
465:           ignore
466:             (ObjcInterface_decl.interface_declaration CType_decl.qual_type_to_sil_type
467:                CType_decl.CProcname.from_decl tenv dec ) ;
468:           process_methods trans_unit_ctx tenv cfg curr_class decl_list
469:       | ObjCProtocolDecl (_, _, decl_list, _, _) ->
470:           let curr_class = CContext.ContextClsDeclPtr dec_ptr in
471:           ignore (ObjcProtocol_decl.protocol_decl CType_decl.qual_type_to_sil_type tenv dec) ;
472:           process_methods trans_unit_ctx tenv cfg curr_class decl_list
473:       | ObjCCategoryDecl (_, _, decl_list, _, _) ->
474:           let curr_class = CContext.ContextClsDeclPtr dec_ptr in
475:           ignore
476:             (ObjcCategory_decl.category_decl CType_decl.qual_type_to_sil_type
477:                CType_decl.CProcname.from_decl tenv dec ) ;
478:           process_methods trans_unit_ctx tenv cfg curr_class decl_list
479:       | ObjCCategoryImplDecl (_, _, decl_list, _, _) ->
480:           let curr_class = CContext.ContextClsDeclPtr dec_ptr in
481:           ignore
482:             (ObjcCategory_decl.category_impl_decl CType_decl.qual_type_to_sil_type
483:                CType_decl.CProcname.from_decl tenv dec ) ;
484:           process_methods trans_unit_ctx tenv cfg curr_class decl_list
485:       | ObjCImplementationDecl (objc_class_decl_info, _, decl_list, _, _) ->
486:           let curr_class = CContext.ContextClsDeclPtr dec_ptr in
487:           let qual_type_to_sil_type = CType_decl.qual_type_to_sil_type in
488:           ignore
489:             (ObjcInterface_decl.interface_impl_declaration qual_type_to_sil_type
490:                CType_decl.CProcname.from_decl tenv dec ) ;
491:           process_methods trans_unit_ctx tenv cfg curr_class decl_list ;
492:           create_and_process_dealloc_objc_impl trans_unit_ctx tenv cfg curr_class
493:             objc_class_decl_info decl_list
494:       | CXXMethodDecl (decl_info, _, _, _, _)
495:       | CXXConstructorDecl (decl_info, _, _, _, _)
496:       | CXXConversionDecl (decl_info, _, _, _, _)
497:       | CXXDestructorDecl (decl_info, _, _, _, _) -> (
498:           let inside_cpp_lambda_expr =
499:             match decl_trans_context with `CppLambdaExprTranslation -> true | _ -> false
500:           in
501:           (* di_parent_pointer has pointer to lexical context such as class.*)
502:           let parent_ptr = Option.value_exn decl_info.Clang_ast_t.di_parent_pointer in
503:           let class_decl = CAst_utils.get_decl parent_ptr in
504:           let loc_instantiated =
505:             match class_decl with
506:             | Some
507:                 ( ClassTemplateSpecializationDecl (_, _, _, _, _, _, _, _, _, source_location, _)
508:                 | ClassTemplatePartialSpecializationDecl
509:                     (_, _, _, _, _, _, _, _, _, source_location, _) ) ->
510:                 Some
511:                   (CLocation.clang_to_sil_location trans_unit_ctx.CFrontend_config.source_file
512:                      source_location )
513:             | _ ->
514:                 None
515:           in
516:           match class_decl with
517:           | (Some (CXXRecordDecl _) | Some (ClassTemplateSpecializationDecl _)) when Config.cxx ->
518:               let curr_class = CContext.ContextClsDeclPtr parent_ptr in
519:               process_methods ~inside_cpp_lambda_expr ?loc_instantiated trans_unit_ctx tenv cfg
520:                 curr_class [dec]
521:           | Some dec ->
522:               L.(debug Capture Verbose)
523:                 "Methods of %s skipped@\n"
524:                 (Clang_ast_proj.get_decl_kind_string dec)
525:           | None ->
526:               () )
527:       | VarDecl
528:           (decl_info, named_decl_info, qt, ({vdi_is_global; vdi_init_expr; vdi_is_constexpr} as vdi))
529:       | VarTemplateSpecializationDecl
530:           ( _
531:           , decl_info
532:           , named_decl_info
533:           , qt
534:           , ({vdi_is_global; vdi_init_expr; vdi_is_constexpr} as vdi) )
535:         when String.is_prefix ~prefix:"__infer_" named_decl_info.ni_name
536:              || (vdi_is_global && Option.is_some vdi_init_expr) ->
537:           let template_args_opt =
538:             match[@warning "-partial-match"] dec with
539:             | VarDecl _ ->
540:                 None
541:             | VarTemplateSpecializationDecl (template_args, _, _, _, _) ->
542:                 Some template_args
543:           in
544:           (* create a fake procedure that initializes the global variable so that the variable
545:              initializer can be analyzed by the backend (eg, the SIOF checker) *)
546:           let procname =
547:             (* create the corresponding global variable to get the right pname for its
548:                initializer *)
549:             let global =
550:               CVar_decl.mk_sil_global_var tenv trans_unit_ctx decl_info named_decl_info vdi
551:                 template_args_opt qt
552:             in
553:             (* safe use of [Option.value_exn] because it's a global *)
554:             Option.value_exn (Pvar.get_initializer_pname global)
555:           in
556:           if
557:             CMethod_trans.should_create_procdesc cfg procname ~defined:true
558:               ~set_objc_accessor_attr:false
559:           then (
560:             let ms =
561:               CMethodSignature.mk procname None [] (StdTyp.void, Annot.Item.empty)
562:                 ~is_ret_constexpr:vdi_is_constexpr [] decl_info.Clang_ast_t.di_source_range
563:                 ClangMethodKind.C_FUNCTION None None None `None
564:             in
565:             let stmt_info =
566:               { si_pointer= CAst_utils.get_fresh_pointer ()
567:               ; si_source_range= decl_info.di_source_range }
568:             in
569:             let body = `DeclStmt (stmt_info, [], [dec]) in
570:             ignore (CMethod_trans.create_local_procdesc trans_unit_ctx cfg tenv ms [body] []) ;
571:             add_method trans_unit_ctx tenv cfg CContext.ContextNoCls procname body ms None None [] )
572:       (* Note that C and C++ records are treated the same way
573:          Skip translating implicit struct declarations, unless they have
574:          full definition (which happens with C++ lambdas) *)
575:       | ClassTemplateSpecializationDecl (di, _, _, decl_list, _, _, rdi, _, _, _, _)
576:       | CXXRecordDecl (di, _, _, decl_list, _, _, rdi, _)
577:       | RecordDecl (di, _, _, decl_list, _, _, rdi)
578:         when (not di.di_is_implicit) || rdi.rdi_is_complete_definition ->
579:           let method_decls, no_method_decls = List.partition_tf ~f:is_method_decl decl_list in
580:           List.iter ~f:translate no_method_decls ;
581:           CFrontend_errors.protect
582:             ~f:(fun () -> ignore (CType_decl.add_types_from_decl_to_tenv tenv dec))
583:             ~recover:(fun () -> ())
584:             ~pp_context:(fun fmt () ->
585:               F.fprintf fmt "Error adding types from decl '%a'"
586:                 (Pp.of_string ~f:Clang_ast_j.string_of_decl)
587:                 dec ) ;
588:           List.iter ~f:translate method_decls
589:       | _ ->
590:           ()
591:     else if should_store_attributes dec then store_attributes tenv trans_unit_ctx dec ;
592:     match dec with
593:     | EnumDecl _ ->
594:         ignore (CEnum_decl.enum_decl dec)
595:     | LinkageSpecDecl (_, decl_list, _) ->
596:         L.(debug Capture Verbose) "ADDING: LinkageSpecDecl decl list@\n" ;
597:         List.iter ~f:translate decl_list
598:     | NamespaceDecl (_, _, decl_list, _, _) ->
599:         List.iter ~f:translate decl_list
600:     | ClassTemplateDecl (_, _, template_decl_info) | FunctionTemplateDecl (_, _, template_decl_info)
601:       ->
602:         let decl_list = template_decl_info.Clang_ast_t.tdi_specializations in
603:         List.iter ~f:translate decl_list
604:     | _ ->
605:         ()
606: end

(End of file - total 606 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cFrontend_decl.mli"
}
```

**Output:**

```
<path>infer/src/clang/cFrontend_decl.mli</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: (** Translate declarations **)
11:
12: module CFrontend_decl_funct (T : CModule_type.CTranslation) : CModule_type.CFrontend

(End of file - total 12 lines)
</content>
```

---

## Assistant (Explore · Big Pickle · 4.7s)

_Thinking:_

Now let me explore the core translation files - cTrans.ml (the main instruction translator), the CModule_type, the AST exporter, Clang_ast_t types, etc.

Now let me examine the core translation modules and the AST bridge:

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cTrans.ml",
  "limit": 200
}
```

**Output:**

```
<path>infer/src/clang/cTrans.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9: open PolyVariantEqual
10:
11: (** Translates instructions: (statements and expressions) from the ast into sil *)
12:
13: open CTrans_utils
14: open CTrans_utils.Nodes
15: module L = Logging
16:
17: module CTrans_funct (F : CModule_type.CFrontend) : CModule_type.CTranslation = struct
18:   (** Returns the procname and whether is instance, according to the selector information and
19:       according to the method signature with the following priority: 1. method is a predefined model
20:       2. method is found by clang's resolution 3. Method is found by our resolution *)
21:   let get_callee_objc_method context obj_c_message_expr_info callee_ms_opt act_params =
22:     let open CContext in
23:     let selector, mc_type = CMethod_trans.get_objc_method_data obj_c_message_expr_info in
24:     let is_instance = not (CMethod_trans.equal_method_call_type mc_type MCStatic) in
25:     let objc_method_kind = Procname.ObjC_Cpp.objc_method_kind_of_bool is_instance in
26:     let method_kind =
27:       if is_instance then ClangMethodKind.OBJC_INSTANCE else ClangMethodKind.OBJC_CLASS
28:     in
29:     let proc_name =
30:       match CMethod_trans.get_method_name_from_clang callee_ms_opt with
31:       | Some name ->
32:           name
33:       | None ->
34:           (* fall back to our method resolution if clang's fails *)
35:           let class_name =
36:             CMethod_trans.get_class_name_method_call_from_receiver_kind context
37:               obj_c_message_expr_info act_params
38:           in
39:           let parameters = List.map act_params ~f:(fun (_, typ) -> Procname.Parameter.of_typ typ) in
40:           CType_decl.CProcname.NoAstDecl.objc_method_of_string_kind class_name selector
41:             objc_method_kind parameters
42:     in
43:     let predefined_ms_opt =
44:       match proc_name with
45:       | Procname.ObjC_Cpp objc_cpp ->
46:           let class_name = Procname.ObjC_Cpp.get_class_type_name objc_cpp in
47:           CTrans_models.get_predefined_model_method_signature class_name selector
48:             CType_decl.CProcname.NoAstDecl.objc_method_of_string_kind
49:       | _ ->
50:           None
51:     in
52:     match (predefined_ms_opt, callee_ms_opt) with
53:     | Some ms, _ ->
54:         ignore
55:           (CMethod_trans.create_local_procdesc context.translation_unit_context context.cfg
56:              context.tenv ms [] [] ) ;
57:         (ms.CMethodSignature.name, CMethod_trans.MCNoVirtual)
58:     | None, Some ms ->
59:         ignore
60:           (CMethod_trans.create_local_procdesc context.translation_unit_context context.cfg
61:              context.tenv ms [] [] ) ;
62:         if CMethodSignature.is_getter ms || CMethodSignature.is_setter ms then
63:           (proc_name, CMethod_trans.MCNoVirtual)
64:         else (proc_name, mc_type)
65:     | _ ->
66:         CMethod_trans.create_external_procdesc context.translation_unit_context context.cfg
67:           proc_name method_kind None ;
68:         (proc_name, mc_type)
69:
70:
71:   let rec is_block_expr s =
72:     match s with
73:     | `BlockExpr _ ->
74:         true
75:     (* the block can be wrapped in ExprWithCleanups  or ImplicitCastExpr*)
76:     | `ImplicitCastExpr (_, [s'], _, _, _) | `ExprWithCleanups (_, [s'], _, _) ->
77:         is_block_expr s'
78:     | _ ->
79:         false
80:
81:
82:   let objc_exp_of_type_block fun_exp_stmt =
83:     match fun_exp_stmt with
84:     | `ImplicitCastExpr (_, _, ei, _, _) | `PseudoObjectExpr (_, _, ei) ->
85:         CType.is_block_type ei.Clang_ast_t.ei_qual_type
86:     | _ ->
87:         false
88:
89:
90:   let collect_returns trans_result_list = List.map ~f:(fun {return} -> return) trans_result_list
91:
92:   (* If e is a block and the calling node has the priority then we need to release the priority to
93:      allow creation of nodes inside the block.  At the end of block translation, we need to get the
94:      proirity back.  the parameter f will be called with function instruction *)
95:   let exec_with_block_priority_exception f trans_state e stmt_info =
96:     if is_block_expr e && PriorityNode.own_priority_node trans_state.priority stmt_info then (
97:       L.(debug Capture Verbose) "Translating block expression by freeing the priority" ;
98:       f {trans_state with priority= Free} e )
99:     else f trans_state e
100:
101:
102:   let exec_with_node_creation node_name ~f trans_state stmt =
103:     let res_trans = f trans_state stmt in
104:     if not (List.is_empty res_trans.control.instrs) then
105:       let stmt_info, _ = Clang_ast_proj.get_stmt_tuple stmt in
106:       let stmt_info' = {stmt_info with Clang_ast_t.si_pointer= CAst_utils.get_fresh_pointer ()} in
107:       let trans_state_pri = PriorityNode.try_claim_priority_node trans_state stmt_info' in
108:       let sil_loc =
109:         CLocation.location_of_stmt_info trans_state.context.translation_unit_context.source_file
110:           stmt_info'
111:       in
112:       PriorityNode.compute_result_to_parent trans_state_pri sil_loc node_name stmt_info' res_trans
113:     else res_trans
114:
115:
116:   (* This is the standard way of dealing with self:Class or a call [a class]. We translate it as
117:      sizeof(<type pf a>) The only time when we want to translate those expressions differently is
118:      when they are the first argument of method calls. In that case they are not translated as
119:      expressions, but we take the type and create a static method call from it. This is done in
120:      objcMessageExpr_trans. *)
121:   let sizeof_expr_class class_name =
122:     let typ = Typ.mk (Tstruct class_name) in
123:     ( Exp.Sizeof {typ; nbytes= None; dynamic_length= None; subtype= Subtype.exact; nullable= false}
124:     , Typ.mk (Tint IULong) )
125:
126:
127:   let add_reference_if_glvalue (typ : Typ.t) expr_info =
128:     (* glvalue definition per C++11:
129:        http://en.cppreference.com/w/cpp/language/value_category *)
130:     let is_xvalue =
131:       match expr_info.Clang_ast_t.ei_value_kind with `XValue -> true | `LValue | `RValue -> false
132:     in
133:     let is_lvalue =
134:       match expr_info.Clang_ast_t.ei_value_kind with `LValue -> true | `RValue | `XValue -> false
135:     in
136:     match (is_xvalue || is_lvalue, typ.desc) with
137:     | true, Tptr (_, (Pk_lvalue_reference | Pk_rvalue_reference)) ->
138:         (* reference of reference is not allowed in C++ - it's most likely frontend *)
139:         (* trying to add same reference to same type twice*)
140:         (* this is hacky and should be fixed (t9838691) *)
141:         typ
142:     | true, _ ->
143:         if is_lvalue then
144:           let quals = Typ.mk_type_quals ~is_reference:true () in
145:           Typ.mk ~quals (Tptr (typ, Pk_lvalue_reference))
146:         else Typ.mk (Tptr (typ, Pk_lvalue_reference))
147:     | _ ->
148:         typ
149:
150:
151:   (** Execute translation and then possibly adjust the type of the result of translation: In C++,
152:       when expression returns reference to type T, it will be lvalue to T, not T&, but infer needs
153:       it to be T& *)
154:   let exec_with_glvalue_as_reference f trans_state stmt =
155:     let expr_info =
156:       match Clang_ast_proj.get_expr_tuple stmt with
157:       | Some (_, _, ei) ->
158:           ei
159:       | None ->
160:           let stmt_info, _ = Clang_ast_proj.get_stmt_tuple stmt in
161:           CFrontend_errors.incorrect_assumption __POS__ stmt_info.Clang_ast_t.si_source_range
162:             "Clang_ast_proj.get_expr_tuple stmt returns None, stmt is %a"
163:             (Pp.of_string ~f:Clang_ast_j.string_of_stmt)
164:             stmt
165:     in
166:     let res_trans = f trans_state stmt in
167:     let return =
168:       let exp, typ = res_trans.return in
169:       (exp, add_reference_if_glvalue typ expr_info)
170:     in
171:     {res_trans with return}
172:
173:
174:   (** Execute translation of e forcing to release priority (if it's not free) and then setting it
175:       back. This is used in conditional operators where we need to force the priority to be free for
176:       the computation of the expressions*)
177:   let exec_with_priority_exception trans_state e f =
178:     if PriorityNode.is_priority_free trans_state then f trans_state e
179:     else f {trans_state with priority= Free} e
180:
181:
182:   (* Translation will reset Ident counter, save it's state and restore it afterwards *)
183:   let keep_ident_counter ~f =
184:     let ident_state = Ident.NameGenerator.get_current () in
185:     f () ;
186:     Ident.NameGenerator.set_current ident_state
187:
188:
189:   let call_translation ?(is_cpp_lambda_expr = false) context decl =
190:     let open CContext in
191:     keep_ident_counter ~f:(fun () ->
192:         let decl_context = if is_cpp_lambda_expr then `CppLambdaExprTranslation else `Translation in
193:         F.translate_one_declaration context.translation_unit_context context.tenv context.cfg
194:           decl_context decl )
195:
196:
197:   let global_var_decl_translation context decl_ref =
198:     let open CContext in
199:     keep_ident_counter ~f:(fun () ->
200:         CAst_utils.get_decl_opt_with_decl_ref decl_ref

(Showing lines 1-200 of 5555. Use offset=201 to continue.)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cTrans.mli"
}
```

**Output:**

```
<path>infer/src/clang/cTrans.mli</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: module CTrans_funct (F : CModule_type.CFrontend) : CModule_type.CTranslation

(End of file - total 10 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cModule_type.ml"
}
```

**Output:**

```
<path>infer/src/clang/cModule_type.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: type block_data =
11:   { captured_vars: CapturedVar.t list
12:   ; context: CContext.t
13:   ; block_as_arg_attributes: ProcAttributes.block_as_arg_attributes option
14:   ; procname: Procname.t
15:   ; return_type: Clang_ast_t.qual_type }
16:
17: module type CTranslation = sig
18:   (** Translates instructions: (statements and expressions) from the ast into sil *)
19:
20:   val instructions_trans :
21:        CContext.t
22:     -> Clang_ast_t.stmt
23:     -> CFrontend_config.instr_type list
24:     -> Procdesc.Node.t
25:     -> is_destructor_wrapper:bool
26:     -> Procdesc.Node.t list
27:   (** It receives the context, a list of statements from clang ast, list of custom statments to be
28:       added before clang statements and the exit node and it returns a list of cfg nodes that
29:       represent the translation of the stmts into sil. *)
30: end
31:
32: module type CFrontend = sig
33:   val function_decl :
34:        CFrontend_config.translation_unit_context
35:     -> Tenv.t
36:     -> Cfg.t
37:     -> Clang_ast_t.decl
38:     -> block_data option
39:     -> unit
40:
41:   val translate_one_declaration :
42:        CFrontend_config.translation_unit_context
43:     -> Tenv.t
44:     -> Cfg.t
45:     -> CFrontend_config.decl_trans_context
46:     -> Clang_ast_t.decl
47:     -> unit
48: end

(End of file - total 48 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cContext.ml"
}
```

**Output:**

```
<path>infer/src/clang/cContext.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9: module F = Format
10: module Hashtbl = Stdlib.Hashtbl
11: module StmtMap = ClangPointers.Map
12:
13: type cxx_temporary =
14:   {pvar: Pvar.t; typ: Typ.t; qual_type: Clang_ast_t.qual_type; marker: (Pvar.t * Sil.if_kind) option}
15:
16: type var_to_destroy =
17:   | VarDecl of
18:       ( Clang_ast_t.decl_info
19:       * Clang_ast_t.named_decl_info
20:       * Clang_ast_t.qual_type
21:       * Clang_ast_t.var_decl_info )
22:   | CXXTemporary of cxx_temporary
23:
24: let pp_var_to_destroy fmt = function
25:   | VarDecl (_, {ni_name}, _, _) ->
26:       F.pp_print_string fmt ni_name
27:   | CXXTemporary {pvar} ->
28:       Pvar.pp Pp.text fmt pvar
29:
30:
31: type pointer = (* = Clang_ast_t.pointer *) int [@@deriving compare]
32:
33: type curr_class = ContextClsDeclPtr of pointer | ContextNoCls [@@deriving compare]
34:
35: type str_node_map = (string, Procdesc.Node.t) Hashtbl.t
36:
37: type t =
38:   { translation_unit_context: CFrontend_config.translation_unit_context
39:   ; tenv: Tenv.t
40:   ; cfg: Cfg.t
41:   ; procdesc: Procdesc.t
42:   ; immediate_curr_class: curr_class
43:   ; return_param_typ: Typ.t option
44:   ; outer_context: t option
45:   ; mutable blocks_static_vars: (Pvar.t * Typ.t) list Procname.Map.t
46:   ; label_map: str_node_map
47:   ; vars_to_destroy: var_to_destroy list StmtMap.t
48:   ; temporary_names: (Clang_ast_t.pointer, Pvar.t * Typ.t) Hashtbl.t
49:   ; temporaries_constructor_markers: (Pvar.t * Typ.t) Pvar.Map.t }
50:
51: let create_context translation_unit_context tenv cfg procdesc immediate_curr_class return_param_typ
52:     outer_context =
53:   { translation_unit_context
54:   ; tenv
55:   ; cfg
56:   ; procdesc
57:   ; immediate_curr_class
58:   ; return_param_typ
59:   ; outer_context
60:   ; blocks_static_vars= Procname.Map.empty
61:   ; label_map= Hashtbl.create 32
62:   ; vars_to_destroy= StmtMap.empty
63:   ; temporary_names= Hashtbl.create 0
64:   ; temporaries_constructor_markers= Pvar.Map.empty }
65:
66:
67: let rec is_objc_method context =
68:   match context.outer_context with
69:   | Some outer_context ->
70:       is_objc_method outer_context
71:   | None ->
72:       context.procdesc |> Procdesc.get_proc_name |> Procname.is_objc_method
73:
74:
75: let rec is_objc_class_method context =
76:   match context.outer_context with
77:   | Some outer_context ->
78:       is_objc_class_method outer_context
79:   | None ->
80:       let attrs = Procdesc.get_attributes context.procdesc in
81:       ClangMethodKind.equal attrs.ProcAttributes.clang_method_kind ClangMethodKind.OBJC_CLASS
82:
83:
84: let rec get_curr_class context =
85:   match (context.immediate_curr_class, context.outer_context) with
86:   | ContextNoCls, Some outer_context ->
87:       get_curr_class outer_context
88:   | _ ->
89:       context.immediate_curr_class
90:
91:
92: let get_curr_class_decl_ptr stmt_info curr_class =
93:   match curr_class with
94:   | ContextClsDeclPtr ptr ->
95:       ptr
96:   | _ ->
97:       CFrontend_errors.incorrect_assumption __POS__ stmt_info.Clang_ast_t.si_source_range
98:         "current class is not ContextClsDeclPtr"
99:
100:
101: let get_curr_class_ptr stmt_info curr_class =
102:   let decl_ptr = get_curr_class_decl_ptr stmt_info curr_class in
103:   let get_ptr_from_decl_ref = function
104:     | Some dr ->
105:         dr.Clang_ast_t.dr_decl_pointer
106:     | None ->
107:         assert false
108:   in
109:   (* Resolve categories to their class names *)
110:   match CAst_utils.get_decl decl_ptr with
111:   | Some (ObjCCategoryDecl (_, _, _, _, ocdi)) ->
112:       get_ptr_from_decl_ref ocdi.odi_class_interface
113:   | Some (ObjCCategoryImplDecl (_, _, _, _, ocidi)) ->
114:       get_ptr_from_decl_ref ocidi.ocidi_class_interface
115:   | _ ->
116:       decl_ptr
117:
118:
119: let get_curr_class_typename stmt_info context =
120:   let tenv = context.tenv in
121:   let curr_class = get_curr_class context in
122:   match get_curr_class_ptr stmt_info curr_class |> CAst_utils.get_decl with
123:   | Some decl ->
124:       CType_decl.get_record_typename ~tenv decl
125:   | None ->
126:       assert false
127:
128:
129: let add_block_static_var context block_name static_var_typ =
130:   match (context.outer_context, static_var_typ) with
131:   | Some outer_context, (static_var, _) when Pvar.is_global static_var ->
132:       let new_static_vars, duplicate =
133:         try
134:           let static_vars = Procname.Map.find block_name outer_context.blocks_static_vars in
135:           if
136:             List.mem
137:               ~equal:(fun (var1, _) (var2, _) -> Pvar.equal var1 var2)
138:               static_vars static_var_typ
139:           then (static_vars, true)
140:           else (static_var_typ :: static_vars, false)
141:         with Stdlib.Not_found -> ([static_var_typ], false)
142:       in
143:       if not duplicate then
144:         let blocks_static_vars =
145:           Procname.Map.add block_name new_static_vars outer_context.blocks_static_vars
146:         in
147:         outer_context.blocks_static_vars <- blocks_static_vars
148:   | _ ->
149:       ()
150:
151:
152: let rec get_outer_procname context =
153:   match context.outer_context with
154:   | Some outer_context ->
155:       get_outer_procname outer_context
156:   | None ->
157:       Procdesc.get_proc_name context.procdesc
158:
159:
160: module CXXTemporarySet = PrettyPrintable.MakePPSet (struct
161:   type t = cxx_temporary
162:
163:   let pp f {pvar; marker} =
164:     F.fprintf f "(%a,%a)" (Pvar.pp Pp.text_break) pvar
165:       (Pp.option (Pp.pair ~fst:(Pvar.pp Pp.text_break) ~snd:Sil.pp_if_kind))
166:       marker
167:
168:
169:   let compare {pvar= pvar1} {pvar= pvar2} = Pvar.compare pvar1 pvar2
170: end)

(End of file - total 170 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cContext.mli"
}
```

**Output:**

```
<path>infer/src/clang/cContext.mli</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: (** Contains current class and current method to be translated as well as local variables, and the
11:     cfg, and tenv corresponding to the current file. *)
12:
13: module StmtMap = ClangPointers.Map
14:
15: type cxx_temporary =
16:   { pvar: Pvar.t
17:   ; typ: Typ.t
18:   ; qual_type: Clang_ast_t.qual_type
19:   ; marker: (Pvar.t * Sil.if_kind) option
20:         (** [Some (m, _)] means that creating [pvar] should also set [m] to [1] so that we know
21:             whether [pvar] needs to be destroyed after the current full-expression *) }
22:
23: type var_to_destroy =
24:   | VarDecl of
25:       ( Clang_ast_t.decl_info
26:       * Clang_ast_t.named_decl_info
27:       * Clang_ast_t.qual_type
28:       * Clang_ast_t.var_decl_info )
29:   | CXXTemporary of cxx_temporary
30:
31: val pp_var_to_destroy : Format.formatter -> var_to_destroy -> unit
32:
33: type curr_class = ContextClsDeclPtr of int | ContextNoCls [@@deriving compare]
34:
35: type str_node_map = (string, Procdesc.Node.t) Stdlib.Hashtbl.t
36:
37: type t =
38:   { translation_unit_context: CFrontend_config.translation_unit_context
39:   ; tenv: Tenv.t
40:   ; cfg: Cfg.t
41:   ; procdesc: Procdesc.t
42:   ; immediate_curr_class: curr_class
43:   ; return_param_typ: Typ.t option
44:   ; outer_context: t option
45:         (** in case of objc blocks, the context of the method containing the block *)
46:   ; mutable blocks_static_vars: (Pvar.t * Typ.t) list Procname.Map.t
47:   ; label_map: str_node_map
48:   ; vars_to_destroy: var_to_destroy list StmtMap.t
49:         (** mapping from a statement to a list of variables, that go out of scope after the end of
50:             the statement *)
51:   ; temporary_names: (Clang_ast_t.pointer, Pvar.t * Typ.t) Stdlib.Hashtbl.t
52:   ; temporaries_constructor_markers: (Pvar.t * Typ.t) Pvar.Map.t
53:         (** In order to know when to destruct C++ temporaries created in expressions containing
54:             conditionals (e.g. to hold the object created by [X()] in [b?foo(X()):goo()]), we
55:             associate "markers" to each one of them, set to true if and only if the temporary has
56:             been created. This is the map associating each such C++ temporary with its marker
57:             variable. *) }
58:
59: val get_curr_class : t -> curr_class
60:
61: val get_curr_class_typename : Clang_ast_t.stmt_info -> t -> Typ.Name.t
62:
63: val get_curr_class_decl_ptr : Clang_ast_t.stmt_info -> curr_class -> Clang_ast_t.pointer
64:
65: val is_objc_method : t -> bool
66:
67: val is_objc_class_method : t -> bool
68:
69: val create_context :
70:      CFrontend_config.translation_unit_context
71:   -> Tenv.t
72:   -> Cfg.t
73:   -> Procdesc.t
74:   -> curr_class
75:   -> Typ.t option
76:   -> t option
77:   -> t
78:
79: val add_block_static_var : t -> Procname.t -> Pvar.t * Typ.t -> unit
80:
81: val get_outer_procname : t -> Procname.t
82:
83: module CXXTemporarySet : PrettyPrintable.PPSet with type elt = cxx_temporary

(End of file - total 83 lines)
</content>
```

---

## Assistant (Explore · Big Pickle · 5.1s)

_Thinking:_

Now let me look at the AST exporter in facebook-clang-plugins, the Clang_ast_t types, and some of the other key translation modules.

Now let's look at the facebook-clang-plugins ASTExporter, the Clang_ast_t type definitions, and more translation modules:

**Tool: read**

**Input:**

```json
{
  "filePath": "facebook-clang-plugins/libtooling/ASTExporter.cpp"
}
```

**Output:**

```
<path>facebook-clang-plugins/libtooling/ASTExporter.cpp</path>
<type>file</type>
<content>
1: /**
2:  * Copyright (c) 2014, Facebook, Inc.
3:  * Copyright (c) 2003-2014 University of Illinois at Urbana-Champaign.
4:  * All rights reserved.
5:  *
6:  * This file is distributed under the University of Illinois Open Source
7:  * License.
8:  * See LLVM-LICENSE for details.
9:  *
10:  */
11:
12: /**
13:  * Clang frontend plugin to export an AST of clang into Json, Yojson and Biniou
14:  * while conforming to the inlined ATD specifications.
15:  */
16:
17: #include "ASTExporter.h"
18:
19: //===----------------------------------------------------------------------===//
20: // ASTExporter Plugin
21: //===----------------------------------------------------------------------===//
22:
23: static ASTLib::FrontendPluginRegistry::Add<ASTLib::JsonExporterASTAction> X(
24:     "JsonASTExporter",
25:     "Export the AST of source files into ATD-specified Json data");
26:
27: static ASTLib::FrontendPluginRegistry::Add<ASTLib::YojsonExporterASTAction> Y(
28:     "YojsonASTExporter",
29:     "Export the AST of source files into ATD-specified Yojson data");
30:
31: static ASTLib::FrontendPluginRegistry::Add<ASTLib::BiniouExporterASTAction> Z(
32:     "BiniouASTExporter",
33:     "Export the AST of source files into ATD-specified biniou data");

(End of file - total 33 lines)
</content>
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "infer/src/clang/clang_ast_t.atd"
}
```

**Output:**

```
No files found
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "infer/src/clang/clang_ast*.atd"
}
```

**Output:**

```
No files found
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "infer/src/clang/Clang_ast_t.ml*"
}
```

**Output:**

```
No files found
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/CMethod_trans.ml",
  "limit": 100
}
```

**Error:**

```
File not found: infer/src/clang/CMethod_trans.ml

Did you mean one of these?
infer/src/clang/cMethod_trans.ml
infer/src/clang/cMethod_trans.mli
```

---

## Assistant (Explore · Big Pickle · 4.2s)

_Thinking:_

Let me look at the ATD files for Clang AST types and more of the plugin, and the method_trans file.

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cMethod_trans.ml",
  "limit": 120
}
```

**Output:**

```
<path>infer/src/clang/cMethod_trans.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: (** Methods for creating a procdesc from a method or function declaration and for resolving a method
11:     call and finding the right callee *)
12:
13: module L = Logging
14:
15: (** When the methoc call is MCStatic, means that it is a class method. When it is MCVirtual, it
16:     means that it is an instance method and that the method to be called will be determined at
17:     runtime. If it is MCNoVirtual it means that it is an instance method but that the method to be
18:     called will be determined at compile time *)
19: type method_call_type = MCVirtual | MCNoVirtual | MCStatic [@@deriving compare, equal]
20:
21: let method_signature_of_pointer tenv pointer =
22:   try
23:     match CAst_utils.get_decl pointer with
24:     | Some meth_decl ->
25:         let procname = CType_decl.CProcname.from_decl ~tenv meth_decl in
26:         let ms = CType_decl.method_signature_of_decl tenv meth_decl procname in
27:         Some ms
28:     | None ->
29:         None
30:   with CFrontend_errors.Invalid_declaration -> None
31:
32:
33: let get_method_name_from_clang ms_opt =
34:   match ms_opt with
35:   | Some ms -> (
36:     match CAst_utils.get_decl_opt ms.CMethodSignature.pointer_to_parent with
37:     | Some decl -> (
38:       match ObjcCategory_decl.get_base_class_name_from_category decl with
39:       | Some class_typename ->
40:           let procname = ms.CMethodSignature.name in
41:           let new_procname = Procname.replace_class procname class_typename in
42:           Some new_procname
43:       | None ->
44:           Some ms.CMethodSignature.name )
45:     | None ->
46:         Some ms.CMethodSignature.name )
47:   | None ->
48:       None
49:
50:
51: let get_superclass_curr_class_objc context =
52:   let open Clang_ast_t in
53:   let decl_ref =
54:     match CContext.get_curr_class context with
55:     | CContext.ContextClsDeclPtr ptr -> (
56:       match CAst_utils.get_decl ptr with
57:       | Some decl ->
58:           CAst_utils.get_superclass_curr_class_objc_from_decl decl
59:       | None ->
60:           Logging.die InternalError
61:             "Expected that the current class ptr in the context is a valid pointer to class decl, \
62:              but didn't find declaration, ptr is %d "
63:             ptr )
64:     | CContext.ContextNoCls ->
65:         Logging.die InternalError
66:           "This should only be called in the context of a class, but got CContext.ContextNoCls"
67:   in
68:   match decl_ref |> Option.value_map ~f:(fun dr -> dr.dr_name) ~default:None with
69:   | Some name ->
70:       Typ.Name.Objc.from_qual_name (CAst_utils.get_qualified_name name)
71:   | None ->
72:       Logging.die InternalError "Expected to always find a superclass, but found none"
73:
74:
75: (* Gets the class name from a method signature found by clang, if search is successful *)
76: let get_class_name_method_call_from_clang tenv obj_c_message_expr_info =
77:   match obj_c_message_expr_info.Clang_ast_t.omei_decl_pointer with
78:   | Some pointer -> (
79:     match method_signature_of_pointer tenv pointer with
80:     | Some ms -> (
81:       match ms.CMethodSignature.name with
82:       | Procname.ObjC_Cpp objc_cpp ->
83:           Some (Procname.ObjC_Cpp.get_class_type_name objc_cpp)
84:       | _ ->
85:           None )
86:     | None ->
87:         None )
88:   | None ->
89:       None
90:
91:
92: (* Get class name from a method call according to the info given by the receiver kind  *)
93: let get_class_name_method_call_from_receiver_kind context obj_c_message_expr_info act_params =
94:   match obj_c_message_expr_info.Clang_ast_t.omei_receiver_kind with
95:   | `Class qt ->
96:       let sil_type = CType_decl.qual_type_to_sil_type context.CContext.tenv qt in
97:       CType.objc_classname_of_type sil_type
98:   | `Instance -> (
99:     match act_params with
100:     | (_, {Typ.desc= Tptr (t, _)}) :: _ | (_, t) :: _ ->
101:         CType.objc_classname_of_type t
102:     | _ ->
103:         assert false )
104:   | `SuperInstance ->
105:       get_superclass_curr_class_objc context
106:   | `SuperClass ->
107:       get_superclass_curr_class_objc context
108:
109:
110: let get_objc_method_data obj_c_message_expr_info =
111:   let selector = obj_c_message_expr_info.Clang_ast_t.omei_selector in
112:   match obj_c_message_expr_info.Clang_ast_t.omei_receiver_kind with
113:   | `Instance ->
114:       (selector, MCVirtual)
115:   | `SuperInstance ->
116:       (selector, MCNoVirtual)
117:   | `Class _ | `SuperClass ->
118:       (selector, MCStatic)
119:
120:

(Showing lines 1-120 of 411. Use offset=121 to continue.)
</content>
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "**/*.atd",
  "path": "infer/src"
}
```

**Output:**

```
infer/src/atd/pulse_config.atd
infer/src/atd/jsonbug.atd
infer/src/atd/specialized_call_graph.atd
infer/src/atd/jsoncost.atd
infer/src/atd/semdiff_batch.atd
infer/src/atd/jsonconfigimpact.atd
infer/src/atd/sarifbug.atd
infer/src/atd/config_impact_data.atd
infer/src/atd/runstate.atd
infer/src/atd/report_block_list_spec.atd
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "**/clang_ast/**",
  "path": "/home/tablinux/Github/infer"
}
```

**Output:**

```
No files found
```

**Tool: read**

**Input:**

```json
{
  "filePath": "facebook-clang-plugins/libtooling/ASTExporter.h"
}
```

**Output:**

```
<path>facebook-clang-plugins/libtooling/ASTExporter.h</path>
<type>file</type>
<content>
1: /**
2:  * Copyright (c) 2014, Facebook, Inc.
3:  * Copyright (c) 2003-2014 University of Illinois at Urbana-Champaign.
4:  * All rights reserved.
5:  *
6:  * This file is distributed under the University of Illinois Open Source
7:  * License.
8:  * See LLVM-LICENSE for details.
9:  *
10:  */
11:
12: /**
13:  * Utility class to export an AST of clang into Json and Yojson (and ultimately
14:  * Biniou)
15:  * while conforming to the inlined ATD specifications.
16:  *
17:  * /!\
18:  * '//@atd' comments are meant to be extracted and processed to generate ATD
19:  * specifications for the Json dumper.
20:  * Do not modify ATD comments without modifying the Json emission accordingly
21:  * (and conversely).
22:  * See ATD_GUIDELINES.md for more guidelines on how to write and test ATD
23:  * annotations.
24:  *
25:  * This file was obtained by modifying the file ASTdumper.cpp from the
26:  * LLVM/clang project.
27:  * The general layout should be maintained to make future merging easier.
28:  */
29:
30: #pragma once
31: #include <memory>
32:
33: #include <clang/AST/ASTConsumer.h>
34: #include <clang/AST/ASTContext.h>
35: #include <clang/AST/Attr.h>
36: #include <clang/AST/AttrVisitor.h>
37: #include <clang/AST/CommentVisitor.h>
38: #include <clang/AST/DeclCXX.h>
39: #include <clang/AST/DeclLookups.h>
40: #include <clang/AST/DeclObjC.h>
41: #include <clang/AST/DeclVisitor.h>
42: #include <clang/AST/Mangle.h>
43: #include <clang/AST/RecursiveASTVisitor.h>
44: #include <clang/AST/StmtVisitor.h>
45: #include <clang/AST/TypeVisitor.h>
46: #include <clang/Basic/Module.h>
47: #include <clang/Basic/SourceManager.h>
48: #include <clang/Basic/TargetInfo.h>
49: #include <clang/Frontend/CompilerInstance.h>
50: #include <clang/Frontend/FrontendDiagnostic.h>
51: #include <clang/Frontend/FrontendPluginRegistry.h>
52:
53: #include <llvm/Support/raw_ostream.h>
54:
55: #include "AttrParameterVectorStream.h"
56: #include "NamePrinter.h"
57: #include "SimplePluginASTAction.h"
58: #include "atdlib/ATDWriter.h"
59:
60: //===----------------------------------------------------------------------===//
61: // ASTExporter Visitor
62: //===----------------------------------------------------------------------===//
63:
64: namespace ASTLib {
65:
66: struct ASTExporterOptions : ASTPluginLib::PluginASTOptionsBase {
67:   bool withPointers = true;
68:   bool dumpComments = false;
69:   bool useMacroExpansionLocation = true;
70:   ATDWriter::ATDWriterOptions atdWriterOptions = {
71:       .useYojson = false,
72:       .prettifyJson = true,
73:   };
74:
75:   void loadValuesFromEnvAndMap(
76:       const ASTPluginLib::PluginASTOptionsBase::argmap_t &map) {
77:     ASTPluginLib::PluginASTOptionsBase::loadValuesFromEnvAndMap(map);
78:     loadBool(map, "AST_WITH_POINTERS", withPointers);
79:     loadBool(map, "USE_YOJSON", atdWriterOptions.useYojson);
80:     loadBool(map, "PRETTIFY_JSON", atdWriterOptions.prettifyJson);
81:   }
82: };
83:
84: using namespace clang;
85: using namespace clang::comments;
86:
87: template <class Impl>
88: struct TupleSizeBase {
89:   // Decls
90:
91: #define DECL(DERIVED, BASE)                              \
92:   int DERIVED##DeclTupleSize() {                         \
93:     return static_cast<Impl *>(this)->BASE##TupleSize(); \
94:   }
95: #define ABSTRACT_DECL(DECL) DECL
96: #include <clang/AST/DeclNodes.inc>
97:
98:   int tupleSizeOfDeclKind(const Decl::Kind kind) {
99:     switch (kind) {
100: #define DECL(DERIVED, BASE) \
101:   case Decl::DERIVED:       \
102:     return static_cast<Impl *>(this)->DERIVED##DeclTupleSize();
103: #define ABSTRACT_DECL(DECL)
104: #include <clang/AST/DeclNodes.inc>
105:     }
106:     llvm_unreachable("Decl that isn't part of DeclNodes.inc!");
107:   }
108:
109:   // Stmts
110:
111: #define STMT(CLASS, PARENT)                                \
112:   int CLASS##TupleSize() {                                 \
113:     return static_cast<Impl *>(this)->PARENT##TupleSize(); \
114:   }
115: #define ABSTRACT_STMT(STMT) STMT
116: #include <clang/AST/StmtNodes.inc>
117:
118:   int tupleSizeOfStmtClass(const Stmt::StmtClass stmtClass) {
119:     switch (stmtClass) {
120: #define STMT(CLASS, PARENT) \
121:   case Stmt::CLASS##Class:  \
122:     return static_cast<Impl *>(this)->CLASS##TupleSize();
123: #define ABSTRACT_STMT(STMT)
124: #include <clang/AST/StmtNodes.inc>
125:     case Stmt::NoStmtClass:
126:       break;
127:     }
128:     llvm_unreachable("Stmt that isn't part of StmtNodes.inc!");
129:   }
130:
131:   // Comments
132:
133: #define COMMENT(CLASS, PARENT)                             \
134:   int CLASS##TupleSize() {                                 \
135:     return static_cast<Impl *>(this)->PARENT##TupleSize(); \
136:   }
137: #define ABSTRACT_COMMENT(COMMENT) COMMENT
138: #include <clang/AST/CommentNodes.inc>
139:
140:   int tupleSizeOfCommentKind(const CommentKind kind) {
141:     switch (kind) {
142: #define COMMENT(CLASS, PARENT) \
143:   case CommentKind::CLASS:     \
144:     return static_cast<Impl *>(this)->CLASS##TupleSize();
145: #define ABSTRACT_COMMENT(COMMENT)
146: #include <clang/AST/CommentNodes.inc>
147:     case CommentKind::None:
148:       break;
149:     }
150:     llvm_unreachable("Comment that isn't part of CommentNodes.inc!");
151:   }
152:
153:   // Types
154:
155: #define TYPE(DERIVED, BASE)                              \
156:   int DERIVED##TypeTupleSize() {                         \
157:     return static_cast<Impl *>(this)->BASE##TupleSize(); \
158:   }
159: #define ABSTRACT_TYPE(DERIVED, BASE) TYPE(DERIVED, BASE)
160: #include <clang/AST/TypeNodes.inc>
161:
162:   int tupleSizeOfTypeClass(const Type::TypeClass typeClass) {
163:     switch (typeClass) {
164: #define TYPE(DERIVED, BASE) \
165:   case Type::DERIVED:       \
166:     return static_cast<Impl *>(this)->DERIVED##TypeTupleSize();
167: #define ABSTRACT_TYPE(DERIVED, BASE)
168: #include <clang/AST/TypeNodes.inc>
169:     }
170:     llvm_unreachable("Type that isn't part of TypeNodes.def!");
171:   }
172:
173:   // Attributes
174:
175: #define ATTR(NAME) \
176:   int NAME##AttrTupleSize() { return 1; }
177: #include <clang/Basic/AttrList.inc>
178:
179:   int tupleSizeOfAttrKind(const attr::Kind attrKind) {
180:     switch (attrKind) {
181: #define ATTR(NAME)       \
182:   case attr::Kind::NAME: \
183:     return static_cast<Impl *>(this)->NAME##AttrTupleSize();
184: #include <clang/Basic/AttrList.inc>
185:     }
186:     llvm_unreachable("Attr that isn't part of AttrList.inc!");
187:   }
188: };
189:
190: typedef ATDWriter::JsonWriter<raw_ostream> JsonWriter;
191:
192: template <class ATDWriter = JsonWriter>
193: class ASTExporter : public ConstDeclVisitor<ASTExporter<ATDWriter>>,
194:                     public ConstStmtVisitor<ASTExporter<ATDWriter>>,
195:                     public ConstCommentVisitor<ASTExporter<ATDWriter>>,
196:                     public TypeVisitor<ASTExporter<ATDWriter>>,
197:                     public ConstAttrVisitor<ASTExporter<ATDWriter>>,
198:                     public TupleSizeBase<ASTExporter<ATDWriter>> {
199:   typedef typename ATDWriter::ObjectScope ObjectScope;
200:   typedef typename ATDWriter::ArrayScope ArrayScope;
201:   typedef typename ATDWriter::TupleScope TupleScope;
202:   typedef typename ATDWriter::VariantScope VariantScope;
203:   ATDWriter OF;
204:
205:   ASTContext &Context;
206:
207:   const ASTExporterOptions &Options;
208:
209:   std::unique_ptr<MangleContext> Mangler;
210:
211:   // Encoding of NULL pointers into suitable empty nodes
212:   // This is a hack but using option types in children lists would make the Json
213:   // terribly verbose.
214:   // Also these useless nodes could have occurred in the original AST anyway :)
215:   //
216:   // Note: We are not using std::unique_ptr because 'delete' appears to be
217:   // protected (at least on Stmt).
218:   const Stmt *const NullPtrStmt;
219:   const Decl *const NullPtrDecl;
220:   const Comment *const NullPtrComment;
221:
222:   // Keep track of the last location we print out so that we can
223:   // print out deltas from then on out.
224:   const char *LastLocFilename;
225:   unsigned LastLocLine;
226:   unsigned LastLocColumn;
227:
228:   // Keep track of the last macro location we print out so that we can
229:   // print out deltas from then on out.
230:   const char *LastMacroLocFilename;
231:   unsigned LastMacroLocLine;
232:
233:   // The \c FullComment parent of the comment being dumped.
234:   const FullComment *FC;
235:
236:   NamePrinter<ATDWriter> NamePrint;
237:
238:  public:
239:   ASTExporter(raw_ostream &OS,
240:               ASTContext &Context,
241:               const ASTExporterOptions &Opts)
242:       : OF(OS, Opts.atdWriterOptions),
243:         Context(Context),
244:         Options(Opts),
245:         Mangler(
246:             ItaniumMangleContext::create(Context, Context.getDiagnostics())),
247:         NullPtrStmt(new (Context) NullStmt(SourceLocation())),
248:         NullPtrDecl(EmptyDecl::Create(
249:             Context, Context.getTranslationUnitDecl(), SourceLocation())),
250:         NullPtrComment(new(Context) Comment(
251:             CommentKind::None, SourceLocation(), SourceLocation())),
252:         LastLocFilename(""),
253:         LastLocLine(~0U),
254:         LastLocColumn(~0U),
255:         LastMacroLocFilename(""),
256:         LastMacroLocLine(~0U),
257:         FC(0),
258:         NamePrint(Context.getSourceManager(), OF) {}
259:
260:   void dumpDecl(const Decl *D);
261:   void dumpStmt(const Stmt *S);
262:   void dumpFullComment(const FullComment *C);
263:   void dumpType(const Type *T);
264:   void dumpPointerToType(const Type *T);
265:   void dumpQualTypeNoQuals(const QualType &qt);
266:   void dumpClassLambdaCapture(const LambdaCapture *C);
267:   void dumpVersionTuple(const VersionTuple &VT);
268:
269:   // Utilities
270:   void dumpMacroLoc(bool is_macro,
271:                     bool is_different_macro_file,
272:                     bool is_different_macro_line,
273:                     PresumedLoc MLoc);
274:   void dumpPointer(const void *Ptr);
275:   void dumpSourceRange(SourceRange R);
276:   void dumpSourceLocation(SourceLocation Loc);
277:   void dumpQualType(const QualType &qt);
278:   void dumpTypeOld(const Type *T);
279:   void dumpDeclRef(const Decl &Node);
280:   bool hasNodes(const DeclContext *DC);
281:   void dumpLookups(const DeclContext &DC);
282:   void dumpSelector(const Selector sel);
283:   void dumpName(const NamedDecl &decl);
284:   void dumpInputKind(const InputKind kind);
285:   void dumpIntegerTypeWidths(const TargetInfo &info);
286:   void dumpVarDeclInfo(const VarDecl *D);
287:
288:   bool alwaysEmitParent(const Decl *D);
289:
290:   void emitAPInt(bool isSigned, const llvm::APInt &value);
291:
292:   // C++ Utilities
293:   void dumpAccessSpecifier(AccessSpecifier AS);
294:   void dumpCXXCtorInitializer(const CXXCtorInitializer &Init);
295:   void dumpDeclarationName(const DeclarationName &Name);
296:   void dumpNestedNameSpecifierLoc(NestedNameSpecifierLoc NNS);
297:   void dumpTemplateArgument(const TemplateArgument &Arg);
298:   void dumpTemplateArguments(const TemplateArgumentList &Args);
299:   void dumpTemplateSpecialization(const TemplateDecl *D,
300:                                   const TemplateArgumentList &Args);
301:   void dumpCXXBaseSpecifier(const CXXBaseSpecifier &Base);
302:
303: #define DECLARE_VISITOR(NAME) \
304:   int NAME##TupleSize();      \
305:   void Visit##NAME(const NAME *D);
306: #define DECLARE_LOWERCASE_VISITOR(NAME) \
307:   int NAME##TupleSize();                \
308:   void visit##NAME(const NAME *D);
309:
310:   // Decls
311:   DECLARE_VISITOR(Decl)
312:   DECLARE_VISITOR(DeclContext)
313:   DECLARE_VISITOR(BlockDecl)
314:   DECLARE_VISITOR(CapturedDecl)
315:   DECLARE_VISITOR(LinkageSpecDecl)
316:   DECLARE_VISITOR(NamespaceDecl)
317:   DECLARE_VISITOR(ObjCContainerDecl)
318:   DECLARE_VISITOR(TagDecl)
319:   DECLARE_VISITOR(TypeDecl)
320:   DECLARE_VISITOR(TranslationUnitDecl)
321:   DECLARE_VISITOR(NamedDecl)
322:   DECLARE_VISITOR(ValueDecl)
323:   DECLARE_VISITOR(TypedefDecl)
324:   DECLARE_VISITOR(EnumDecl)
325:   DECLARE_VISITOR(RecordDecl)
326:   DECLARE_VISITOR(EnumConstantDecl)
327:   DECLARE_VISITOR(IndirectFieldDecl)
328:   DECLARE_VISITOR(FunctionDecl)
329:   DECLARE_VISITOR(FieldDecl)
330:   DECLARE_VISITOR(VarDecl)
331:   // no use for these yet, ignore them
332:   // DECLARE_VISITOR(FileScopeAsmDecl)
333:   DECLARE_VISITOR(ImportDecl)
334:
335:   // C++ Decls
336:   DECLARE_VISITOR(UsingDirectiveDecl)
337:   DECLARE_VISITOR(NamespaceAliasDecl)
338:   DECLARE_VISITOR(CXXRecordDecl)
339:   DECLARE_VISITOR(ClassTemplateSpecializationDecl)
340:   DECLARE_VISITOR(CXXMethodDecl)
341:   DECLARE_VISITOR(ClassTemplateDecl)
342:   DECLARE_VISITOR(FunctionTemplateDecl)
343:   DECLARE_VISITOR(FriendDecl)
344:   DECLARE_VISITOR(VarTemplateSpecializationDecl)
345:   DECLARE_VISITOR(DecompositionDecl)
346:   DECLARE_VISITOR(BindingDecl)
347:
348:   // ObjC Decls
349:   DECLARE_VISITOR(ObjCIvarDecl)
350:   DECLARE_VISITOR(ObjCMethodDecl)
351:   DECLARE_VISITOR(ObjCCategoryDecl)
352:   DECLARE_VISITOR(ObjCCategoryImplDecl)
353:   DECLARE_VISITOR(ObjCProtocolDecl)
354:   DECLARE_VISITOR(ObjCInterfaceDecl)
355:   DECLARE_VISITOR(ObjCImplementationDecl)
356:   DECLARE_VISITOR(ObjCCompatibleAliasDecl)
357:   DECLARE_VISITOR(ObjCPropertyDecl)
358:   DECLARE_VISITOR(ObjCPropertyImplDecl)
359:
360:   // Stmts
361:   DECLARE_VISITOR(Stmt)
362:   DECLARE_VISITOR(AttributedStmt)
363:   DECLARE_VISITOR(CoreturnStmt)
364:   DECLARE_VISITOR(CoroutineBodyStmt)
365:   DECLARE_VISITOR(CXXCatchStmt)
366:   DECLARE_VISITOR(DeclStmt)
367:   DECLARE_VISITOR(GotoStmt)
368:   DECLARE_VISITOR(IfStmt)
369:   DECLARE_VISITOR(LabelStmt)
370:   DECLARE_VISITOR(SwitchStmt)
371:
372:   // Exprs
373:   DECLARE_VISITOR(Expr)
374:   DECLARE_VISITOR(CastExpr)
375:   DECLARE_VISITOR(ExplicitCastExpr)
376:   DECLARE_VISITOR(ImplicitCastExpr)
377:   DECLARE_VISITOR(DeclRefExpr)
378:   DECLARE_VISITOR(PredefinedExpr)
379:   DECLARE_VISITOR(CharacterLiteral)
380:   DECLARE_VISITOR(IntegerLiteral)
381:   DECLARE_VISITOR(FixedPointLiteral)
382:   DECLARE_VISITOR(FloatingLiteral)
383:   DECLARE_VISITOR(StringLiteral)
384:   //    DECLARE_VISITOR(InitListExpr)
385:   DECLARE_VISITOR(UnaryOperator)
386:   DECLARE_VISITOR(UnaryExprOrTypeTraitExpr)
387:   DECLARE_VISITOR(MemberExpr)
388:   DECLARE_VISITOR(ExtVectorElementExpr)
389:   DECLARE_VISITOR(BinaryOperator)
390:   DECLARE_VISITOR(CompoundAssignOperator)
391:   DECLARE_VISITOR(AtomicExpr)
392:   DECLARE_VISITOR(AddrLabelExpr)
393:   DECLARE_VISITOR(BlockExpr)
394:   DECLARE_VISITOR(OpaqueValueExpr)
395:   DECLARE_VISITOR(OffsetOfExpr)
396:
397:   // C++
398:   DECLARE_VISITOR(CXXNamedCastExpr)
399:   DECLARE_VISITOR(CXXBoolLiteralExpr)
400:   DECLARE_VISITOR(CXXConstructExpr)
401:   DECLARE_VISITOR(CXXInheritedCtorInitExpr)
402:   DECLARE_VISITOR(CXXBindTemporaryExpr)
403:   DECLARE_VISITOR(MaterializeTemporaryExpr)
404:   DECLARE_VISITOR(ExprWithCleanups)
405:   DECLARE_VISITOR(OverloadExpr)
406:   DECLARE_VISITOR(UnresolvedLookupExpr)
407:   void dumpCXXTemporary(const CXXTemporary *Temporary);
408:   DECLARE_VISITOR(LambdaExpr)
409:   DECLARE_VISITOR(CXXNewExpr)
410:   DECLARE_VISITOR(CXXDeleteExpr)
411:   DECLARE_VISITOR(CXXDefaultArgExpr)
412:   DECLARE_VISITOR(CXXDefaultInitExpr)
413:   DECLARE_VISITOR(TypeTraitExpr)
414:   DECLARE_VISITOR(GenericSelectionExpr)
415:   DECLARE_VISITOR(CXXNoexceptExpr)
416:
417:   // ObjC
418:   DECLARE_VISITOR(ObjCAtCatchStmt)
419:   DECLARE_VISITOR(ObjCEncodeExpr)
420:   DECLARE_VISITOR(ObjCMessageExpr)
421:   DECLARE_VISITOR(ObjCBoxedExpr)
422:   DECLARE_VISITOR(ObjCSelectorExpr)
423:   DECLARE_VISITOR(ObjCProtocolExpr)
424:   DECLARE_VISITOR(ObjCPropertyRefExpr)
425:   DECLARE_VISITOR(ObjCSubscriptRefExpr)
426:   DECLARE_VISITOR(ObjCIvarRefExpr)
427:   DECLARE_VISITOR(ObjCBoolLiteralExpr)
428:   DECLARE_VISITOR(ObjCAvailabilityCheckExpr)
429:   DECLARE_VISITOR(ObjCArrayLiteral)
430:   DECLARE_VISITOR(ObjCDictionaryLiteral)
431:   DECLARE_VISITOR(ObjCBridgedCastExpr)
432:
433:   // Comments
434:   const char *getCommandName(unsigned CommandID);
435:   void dumpComment(const Comment *C);
436:
437:   // Inline comments
438:   DECLARE_LOWERCASE_VISITOR(Comment)
439:   // DECLARE_LOWERCASE_VISITOR(TextComment)
440:   //    void visitInlineCommandComment(const InlineCommandComment *C);
441:   //    void visitHTMLStartTagComment(const HTMLStartTagComment *C);
442:   //    void visitHTMLEndTagComment(const HTMLEndTagComment *C);
443:   //
444:   //    // Block comments.
445:   //    void visitBlockCommandComment(const BlockCommandComment *C);
446:   //    void visitParamCommandComment(const ParamCommandComment *C);
447:   //    void visitTParamCommandComment(const TParamCommandComment *C);
448:   //    void visitVerbatimBlockComment(const VerbatimBlockComment *C);
449:   //    void visitVerbatimBlockLineComment(const VerbatimBlockLineComment *C);
450:   //    void visitVerbatimLineComment(const VerbatimLineComment *C);
451:
452:   // Types - no template type handling yet
453:   int TypeWithChildInfoTupleSize();
454:   DECLARE_VISITOR(Type)
455:   DECLARE_VISITOR(AdjustedType)
456:   DECLARE_VISITOR(ArrayType)
457:   DECLARE_VISITOR(ConstantArrayType)
458:   //  DECLARE_VISITOR(DependentSizedArrayType)
459:   //  DECLARE_VISITOR(IncompleteArrayType)
460:   DECLARE_VISITOR(VariableArrayType)
461:   DECLARE_VISITOR(AtomicType)
462:   DECLARE_VISITOR(AttributedType) // getEquivalentType() + getAttrKind -> string
463:   //  DECLARE_VISITOR(AutoType)
464:   DECLARE_VISITOR(BlockPointerType)
465:   DECLARE_VISITOR(BuiltinType)
466:   //  DECLARE_VISITOR(ComplexType)
467:   DECLARE_VISITOR(DecltypeType)
468:   //  DECLARE_VISITOR(DependentSizedExtVectorType)
469:   DECLARE_VISITOR(FunctionType)
470:   //  DECLARE_VISITOR(FunctionNoProtoType)
471:   DECLARE_VISITOR(FunctionProtoType)
472:   //  DECLARE_VISITOR(InjectedClassNameType)
473:   DECLARE_VISITOR(MacroQualifiedType)
474:   DECLARE_VISITOR(MemberPointerType)
475:   DECLARE_VISITOR(ObjCObjectPointerType)
476:   DECLARE_VISITOR(ObjCObjectType)
477:   DECLARE_VISITOR(ObjCInterfaceType)
478:   DECLARE_VISITOR(ParenType)
479:   DECLARE_VISITOR(PointerType)
480:   DECLARE_VISITOR(ReferenceType)
481:   DECLARE_VISITOR(TagType)
482:   DECLARE_VISITOR(TypedefType)
483:
484:   void dumpAttrKind(attr::Kind Kind);
485:   void dumpAttr(const Attr *A);
486:   DECLARE_VISITOR(Attr)
487:   DECLARE_VISITOR(AnnotateAttr)
488:   DECLARE_VISITOR(AvailabilityAttr)
489:   DECLARE_VISITOR(SentinelAttr)
490:   DECLARE_VISITOR(VisibilityAttr)
491:
492:   void dumpTypeAttr(AttributedType::Kind kind);
493:   void dumpObjCLifetimeQual(Qualifiers::ObjCLifetime qual);
494:
495:   /* #define TYPE(CLASS, PARENT) DECLARE_VISITOR(CLASS##Type) */
496:   /* #define ABSTRACT_TYPE(CLASS, PARENT) */
497:   /* #include <clang/AST/TypeNodes.def> */
498: };
499:
500: //===----------------------------------------------------------------------===//
501: //  Utilities
502: //===----------------------------------------------------------------------===//
503:
504: bool hasMeaningfulTypeInfo(const Type *T) {
505:   // clang goes into an infinite loop trying to compute the TypeInfo of
506:   // dependent types, and a width of 0 if the type doesn't have a constant size
507:   return T && !T->isIncompleteType() && !T->isDependentType() &&
508:          T->isConstantSizeType();
509: }
510:
511: std::unordered_map<const void *, int> pointerMap;
512: int pointerCounter = 1;
513:
514: //@atd type pointer = int
515: template <class ATDWriter>
516: void writePointer(ATDWriter &OF, bool withPointers, const void *Ptr) {
517:   if (!Ptr) {
518:     OF.emitInteger(0);
519:     return;
520:   }
521:   if (pointerMap.find(Ptr) == pointerMap.end()) {
522:     pointerMap[Ptr] = pointerCounter++;
523:   }
524:   OF.emitInteger(pointerMap[Ptr]);
525: }
526:
527: template <class ATDWriter>
528: void ASTExporter<ATDWriter>::dumpPointer(const void *Ptr) {
529:   writePointer(OF, Options.withPointers, Ptr);
530: }
531:
532: template <class ATDWriter>
533: void ASTExporter<ATDWriter>::dumpMacroLoc(bool is_macro,
534:                                           bool is_different_macro_file,
535:                                           bool is_different_macro_line,
536:                                           PresumedLoc MLoc) {
537:   if (is_macro) {
538:     OF.emitFlag("is_macro", is_macro);
539:     if (is_different_macro_file) {
540:       OF.emitTag("macro_file");
541:       OF.emitString(Options.normalizeSourcePath(MLoc.getFilename()));
542:       OF.emitTag("macro_line");
543:       OF.emitInteger(MLoc.getLine());
544:     } else if (is_different_macro_line) {
545:       OF.emitTag("macro_line");
546:       OF.emitInteger(MLoc.getLine());
547:     }
548:   }
549: }
550:
551: //@atd type source_file = string
552: //@atd type source_location = {
553: //@atd   ?file <ocaml mutable> : source_file option;
554: //@atd   ?line <ocaml mutable> : int option;
555: //@atd   ?column <ocaml mutable> : int option;
556: //@atd   ~is_macro: bool;
557: //@atd   ?macro_file <ocaml mutable> : source_file option;
558: //@atd   ?macro_line <ocaml mutable> : int option;
559: //@atd } <ocaml field_prefix="sl_" validator="Clang_ast_visit.visit_source_loc">
560: template <class ATDWriter>
561: void ASTExporter<ATDWriter>::dumpSourceLocation(SourceLocation Loc) {
562:   const SourceManager &SM = Context.getSourceManager();
563:   SourceLocation ExpLoc =
564:       Options.useMacroExpansionLocation ? SM.getExpansionLoc(Loc) : Loc;
565:   SourceLocation SpellingLoc = SM.getSpellingLoc(ExpLoc);
566:
567:   // The general format we print out is filename:line:col, but we drop pieces
568:   // that haven't changed since the last loc printed.
569:   PresumedLoc PLoc = SM.getPresumedLoc(SpellingLoc);
570:   SourceLocation MSourceLoc = SM.getSpellingLoc(Loc);
571:   PresumedLoc MLoc = SM.getPresumedLoc(MSourceLoc);
572:
573:   if (PLoc.isInvalid()) {
574:     ObjectScope Scope(OF, 0);
575:     return;
576:   }
577:   bool is_different_macro_file = false;
578:   bool is_different_macro_line = false;
579:   bool is_macro = Loc.isMacroID() && !SM.isWrittenInBuiltinFile(MSourceLoc) &&
580:                   !SM.isWrittenInCommandLineFile(MSourceLoc) &&
581:                   !SM.isWrittenInScratchSpace(MSourceLoc);
582:   int macro_fields_count = is_macro;
583:   if (is_macro) {
584:     if (strcmp(MLoc.getFilename(), LastMacroLocFilename) != 0) {
585:       is_different_macro_file = true;
586:       macro_fields_count += 2;
587:     } else if (MLoc.getLine() != LastMacroLocLine) {
588:       is_different_macro_line = true;
589:       macro_fields_count += 1;
590:     }
591:     LastMacroLocFilename = MLoc.getFilename();
592:     LastMacroLocLine = MLoc.getLine();
593:   }
594:   if (strcmp(PLoc.getFilename(), LastLocFilename) != 0) {
595:     ObjectScope Scope(OF, 3 + macro_fields_count);
596:     OF.emitTag("file");
597:     // Normalizing filenames matters because the current directory may change
598:     // during the compilation of large projects.
599:     OF.emitString(Options.normalizeSourcePath(PLoc.getFilename()));
600:     OF.emitTag("line");
601:     OF.emitInteger(PLoc.getLine());
602:     OF.emitTag("column");
603:     OF.emitInteger(PLoc.getColumn());
604:     dumpMacroLoc(
605:         is_macro, is_different_macro_file, is_different_macro_line, MLoc);
606:   } else if (PLoc.getLine() != LastLocLine) {
607:     ObjectScope Scope(OF, 2 + macro_fields_count);
608:     OF.emitTag("line");
609:     OF.emitInteger(PLoc.getLine());
610:     OF.emitTag("column");
611:     OF.emitInteger(PLoc.getColumn());
612:     dumpMacroLoc(
613:         is_macro, is_different_macro_file, is_different_macro_line, MLoc);
614:   } else if (PLoc.getColumn() != LastLocColumn) {
615:     ObjectScope Scope(OF, 1 + macro_fields_count);
616:     OF.emitTag("column");
617:     OF.emitInteger(PLoc.getColumn());
618:     dumpMacroLoc(
619:         is_macro, is_different_macro_file, is_different_macro_line, MLoc);
620:   } else {
621:     ObjectScope Scope(OF, macro_fields_count);
622:     dumpMacroLoc(
623:         is_macro, is_different_macro_file, is_different_macro_line, MLoc);
624:     return;
625:   }
626:   LastLocFilename = PLoc.getFilename();
627:   LastLocLine = PLoc.getLine();
628:   LastLocColumn = PLoc.getColumn();
629: }
630:
631: //@atd type source_range = (source_location * source_location)
632: template <class ATDWriter>
633: void ASTExporter<ATDWriter>::dumpSourceRange(SourceRange R) {
634:   TupleScope Scope(OF, 2);
635:   dumpSourceLocation(R.getBegin());
636:   dumpSourceLocation(R.getEnd());
637: }
638:
639: //@atd type qual_type = {
640: //@atd   type_ptr : type_ptr;
641: //@atd   ~is_const : bool;
642: //@atd   ~is_restrict : bool;
643: //@atd   ~is_volatile : bool;
644: //@atd } <ocaml field_prefix="qt_">
645: template <class ATDWriter>
646: void ASTExporter<ATDWriter>::dumpQualType(const QualType &qt) {
647:   clang::Qualifiers Quals =
648:       qt.isNull() ? clang::Qualifiers() : qt.getQualifiers();
649:   bool isConst = Quals.hasConst();
650:   bool isRestrict = Quals.hasRestrict();
651:   bool isVolatile = Quals.hasVolatile();
652:   ObjectScope oScope(OF, 1 + isConst + isRestrict + isVolatile);
653:   OF.emitTag("type_ptr");
654:   dumpQualTypeNoQuals(qt);
655:   OF.emitFlag("is_const", isConst);
656:   OF.emitFlag("is_restrict", isRestrict);
657:   OF.emitFlag("is_volatile", isVolatile);
658: }
659:
660: //@atd type named_decl_info = {
661: //@atd   name : string;
662: //@atd   qual_name : string list;
663: //@atd } <ocaml field_prefix="ni_">
664: template <class ATDWriter>
665: void ASTExporter<ATDWriter>::dumpName(const NamedDecl &Decl) {
666:   // dump name
667:   ObjectScope oScope(OF, 2);
668:
669:   OF.emitTag("name");
670:
671:   std::string name = Decl.getNameAsString();
672:   if (name.length() == 0) {
673:     const FieldDecl *FD = dyn_cast<FieldDecl>(&Decl);
674:     if (FD) {
675:       name = "__anon_field_" + std::to_string(FD->getFieldIndex());
676:     }
677:   }
678:   OF.emitString(name);
679:
680:   OF.emitTag("qual_name");
681:   NamePrint.printDeclName(Decl);
682: }
683:
684: //@atd type decl_ref = {
685: //@atd   kind : decl_kind;
686: //@atd   decl_pointer : pointer;
687: //@atd   ?name : named_decl_info option;
688: //@atd   ~is_hidden : bool;
689: //@atd   ?qual_type : qual_type option
690: //@atd } <ocaml field_prefix="dr_">
691: //@atd type decl_kind = [
692: #define DECL(DERIVED, BASE) //@atd | DERIVED
693: #define ABSTRACT_DECL(DECL) DECL
694: #include <clang/AST/DeclNodes.inc>
695: //@atd ]
696: template <class ATDWriter>
697: void ASTExporter<ATDWriter>::dumpDeclRef(const Decl &D) {
698:   const NamedDecl *ND = dyn_cast<NamedDecl>(&D);
699:   const ValueDecl *VD = dyn_cast<ValueDecl>(&D);
700:   bool IsHidden = ND && !ND->isUnconditionallyVisible();
701:   ObjectScope Scope(OF, 2 + (bool)ND + (bool)VD + IsHidden);
702:
703:   OF.emitTag("kind");
704:   OF.emitSimpleVariant(D.getDeclKindName());
705:   OF.emitTag("decl_pointer");
706:   dumpPointer(&D);
707:   if (ND) {
708:     OF.emitTag("name");
709:     dumpName(*ND);
710:     OF.emitFlag("is_hidden", IsHidden);
711:   }
712:   if (VD) {
713:     OF.emitTag("qual_type");
714:     dumpQualType(VD->getType());
715:   }
716: }
717:
718: template <class ATDWriter>
719: int ASTExporter<ATDWriter>::DeclContextTupleSize() {
720:   return 2;
721: }
722: //@atd #define decl_context_tuple decl list * decl_context_info
723: //@atd type decl_context_info = {
724: //@atd   ~has_external_lexical_storage : bool;
725: //@atd   ~has_external_visible_storage : bool
726: //@atd } <ocaml field_prefix="dci_">
727: template <class ATDWriter>
728: void ASTExporter<ATDWriter>::VisitDeclContext(const DeclContext *DC) {
729:   if (!DC) {
730:     { ArrayScope Scope(OF, 0); }
731:     { ObjectScope Scope(OF, 0); }
732:     return;
733:   }
734:   {
735:     std::vector<Decl *> declsToDump;
736:     for (auto I : DC->decls()) {
737:       declsToDump.push_back(I);
738:     }
739:     /* Some typedefs are not part of AST. 'instancetype' is one of them.
740:     Export it nevertheless as part of TranslationUnitDecl context. */
741:     // getObjCInstanceType() should return null type when 'instancetype' is not
742:     // known yet - it doesn't work this way due to bug in clang, but keep
743:     // the check for when the bug is fixed.
744:     if (isa<TranslationUnitDecl>(DC) &&
745:         Context.getObjCInstanceType().getTypePtrOrNull()) {
746:       declsToDump.push_back(Context.getObjCInstanceTypeDecl());
747:     }
748:     ArrayScope Scope(OF, declsToDump.size());
749:     for (auto I : declsToDump) {
750:       dumpDecl(I);
751:     }
752:   }
753:   {
754:     bool HasExternalLexicalStorage = DC->hasExternalLexicalStorage();
755:     bool HasExternalVisibleStorage = DC->hasExternalVisibleStorage();
756:     ObjectScope Scope(OF,
757:                       0 + HasExternalLexicalStorage +
758:                           HasExternalVisibleStorage); // not covered by tests
759:
760:     OF.emitFlag("has_external_lexical_storage", HasExternalLexicalStorage);
761:     OF.emitFlag("has_external_visible_storage", HasExternalVisibleStorage);
762:   }
763: }
764:
765: //@atd type lookups = {
766: //@atd   decl_ref : decl_ref;
767: //@atd   ?primary_context_pointer : pointer option;
768: //@atd   lookups : lookup list;
769: //@atd   ~has_undeserialized_decls : bool;
770: //@atd } <ocaml field_prefix="lups_">
771: //@atd type lookup = {
772: //@atd   decl_name : string;
773: //@atd   decl_refs : decl_ref list;
774: //@atd } <ocaml field_prefix="lup_">
775: template <class ATDWriter>
776: void ASTExporter<ATDWriter>::dumpLookups(const DeclContext &DC) {
777:   ObjectScope Scope(OF, 4); // not covered by tests
778:
779:   OF.emitTag("decl_ref");
780:   dumpDeclRef(cast<Decl>(DC));
781:
782:   const DeclContext *Primary = DC.getPrimaryContext();
783:   if (Primary != &DC) {
784:     OF.emitTag("primary_context_pointer");
785:     dumpPointer(cast<Decl>(Primary));
786:   }
787:
788:   OF.emitTag("lookups");
789:   {
790:     ArrayScope Scope(OF);
791:     DeclContext::all_lookups_iterator I = Primary->noload_lookups_begin(),
792:                                       E = Primary->noload_lookups_end();
793:     while (I != E) {
794:       DeclarationName Name = I.getLookupName();
795:       DeclContextLookupResult R = *I++;
796:
797:       ObjectScope Scope(OF, 2); // not covered by tests
798:       OF.emitTag("decl_name");
799:       OF.emitString(Name.getAsString());
800:
801:       OF.emitTag("decl_refs");
802:       {
803:         ArrayScope Scope(OF);
804:         for (DeclContextLookupResult::iterator RI = R.begin(), RE = R.end();
805:              RI != RE;
806:              ++RI) {
807:           dumpDeclRef(**RI);
808:         }
809:       }
810:     }
811:   }
812:
813:   bool HasUndeserializedLookups = Primary->hasExternalVisibleStorage();
814:   OF.emitFlag("has_undeserialized_decls", HasUndeserializedLookups);
815: }
816:
817: //===----------------------------------------------------------------------===//
818: //  C++ Utilities
819: //===----------------------------------------------------------------------===//
820:
821: //@atd type access_specifier = [ None | Public | Protected | Private ]
822: template <class ATDWriter>
823: void ASTExporter<ATDWriter>::dumpAccessSpecifier(AccessSpecifier AS) {
824:   switch (AS) {
825:   case AS_public:
826:     OF.emitSimpleVariant("Public");
827:     break;
828:   case AS_protected:
829:     OF.emitSimpleVariant("Protected");
830:     break;
831:   case AS_private:
832:     OF.emitSimpleVariant("Private");
833:     break;
834:   case AS_none:
835:     OF.emitSimpleVariant("None");
836:     break;
837:   default:
838:     llvm_unreachable("Unknown access_specifier is given!");
839:   }
840: }
841:
842: //@atd type cxx_ctor_initializer = {
843: //@atd   subject : cxx_ctor_initializer_subject;
844: //@atd   source_range : source_range;
845: //@atd   ?init_expr : stmt option;
846: //@atd } <ocaml field_prefix="xci_">
847: //@atd type cxx_ctor_initializer_subject = [
848: //@atd   Member of decl_ref
849: //@atd | Delegating of type_ptr
850: //@atd | BaseClass of (type_ptr * bool)
851: //@atd ]
852: template <class ATDWriter>
853: void ASTExporter<ATDWriter>::dumpCXXCtorInitializer(
854:     const CXXCtorInitializer &Init) {
855:   const Expr *E = Init.getInit();
856:   ObjectScope Scope(OF, 2 + (bool)E);
857:
858:   OF.emitTag("subject");
859:   const FieldDecl *FD = Init.getAnyMember();
860:   if (FD) {
861:     VariantScope Scope(OF, "Member");
862:     dumpDeclRef(*FD);
863:   } else if (Init.isDelegatingInitializer()) {
864:     VariantScope Scope(OF, "Delegating");
865:     dumpQualTypeNoQuals(Init.getTypeSourceInfo()->getType());
866:   } else {
867:     VariantScope Scope(OF, "BaseClass");
868:     {
869:       TupleScope Scope(OF, 2);
870:       dumpQualTypeNoQuals(Init.getTypeSourceInfo()->getType());
871:       OF.emitBoolean(Init.isBaseVirtual());
872:     }
873:   }
874:   OF.emitTag("source_range");
875:   dumpSourceRange(Init.getSourceRange());
876:   if (E) {
877:     OF.emitTag("init_expr");
878:     dumpStmt(E);
879:   }
880: }
881:
882: //@atd type declaration_name = {
883: //@atd   kind : declaration_name_kind;
884: //@atd   name : string;
885: //@atd }  <ocaml field_prefix="dn_">
886: //@atd type declaration_name_kind = [
887: //@atd   Identifier
888: //@atd | ObjCZeroArgSelector
889: //@atd | ObjCOneArgSelector
890: //@atd | ObjCMultiArgSelector
891: //@atd | CXXConstructorName
892: //@atd | CXXDestructorName
893: //@atd | CXXConversionFunctionName
894: //@atd | CXXOperatorName
895: //@atd | CXXLiteralOperatorName
896: //@atd | CXXUsingDirective
897: //@atd | CXXDeductionGuideName
898: //@atd ]
899: template <class ATDWriter>
900: void ASTExporter<ATDWriter>::dumpDeclarationName(const DeclarationName &Name) {
901:   ObjectScope Scope(OF, 2); // not covered by tests
902:   OF.emitTag("kind");
903:   switch (Name.getNameKind()) {
904:   case DeclarationName::Identifier:
905:     OF.emitSimpleVariant("Identifier");
906:     break;
907:   case DeclarationName::ObjCZeroArgSelector:
908:     OF.emitSimpleVariant("ObjCZeroArgSelector");
909:     break;
910:   case DeclarationName::ObjCOneArgSelector:
911:     OF.emitSimpleVariant("ObjCOneArgSelector");
912:     break;
913:   case DeclarationName::ObjCMultiArgSelector:
914:     OF.emitSimpleVariant("ObjCMultiArgSelector");
915:     break;
916:   case DeclarationName::CXXConstructorName:
917:     OF.emitSimpleVariant("CXXConstructorName");
918:     break;
919:   case DeclarationName::CXXDestructorName:
920:     OF.emitSimpleVariant("CXXDestructorName");
921:     break;
922:   case DeclarationName::CXXConversionFunctionName:
923:     OF.emitSimpleVariant("CXXConversionFunctionName");
924:     break;
925:   case DeclarationName::CXXOperatorName:
926:     OF.emitSimpleVariant("CXXOperatorName");
927:     break;
928:   case DeclarationName::CXXLiteralOperatorName:
929:     OF.emitSimpleVariant("CXXLiteralOperatorName");
930:     break;
931:   case DeclarationName::CXXUsingDirective:
932:     OF.emitSimpleVariant("CXXUsingDirective");
933:     break;
934:   case DeclarationName::CXXDeductionGuideName:
935:     OF.emitSimpleVariant("CXXDeductionGuideName");
936:     break;
937:   default:
938:     llvm_unreachable("Unknown declaration_name is given!");
939:   }
940:   OF.emitTag("name");
941:   OF.emitString(Name.getAsString());
942: }
943: //@atd type nested_name_specifier_loc = {
944: //@atd   kind : specifier_kind;
945: //@atd   ?ref : decl_ref option;
946: //@atd } <ocaml field_prefix="nnsl_">
947: //@atd type specifier_kind = [
948: //@atd    Identifier
949: //@atd  | Namespace
950: //@atd  | NamespaceAlias
951: //@atd  | TypeSpec
952: //@atd  | TypeSpecWithTemplate
953: //@atd  | Global
954: //@atd  | Super
955: //@atd ]
956: template <class ATDWriter>
957: void ASTExporter<ATDWriter>::dumpNestedNameSpecifierLoc(
958:     NestedNameSpecifierLoc NNS) {
959:   SmallVector<NestedNameSpecifierLoc, 8> NestedNames;
960:   while (NNS) {
961:     NestedNames.push_back(NNS);
962:     NNS = NNS.getPrefix();
963:   }
964:   ArrayScope Scope(OF, NestedNames.size());
965:   while (!NestedNames.empty()) {
966:     NNS = NestedNames.pop_back_val();
967:     NestedNameSpecifier::SpecifierKind Kind =
968:         NNS.getNestedNameSpecifier()->getKind();
969:     ObjectScope Scope(OF, 2);
970:     OF.emitTag("kind");
971:     switch (Kind) {
972:     case NestedNameSpecifier::Identifier:
973:       OF.emitSimpleVariant("Identifier");
974:       break;
975:     case NestedNameSpecifier::Namespace:
976:       OF.emitSimpleVariant("Namespace");
977:       OF.emitTag("ref");
978:       dumpDeclRef(*NNS.getNestedNameSpecifier()->getAsNamespace());
979:       break;
980:     case NestedNameSpecifier::NamespaceAlias:
981:       OF.emitSimpleVariant("NamespaceAlias");
982:       OF.emitTag("ref");
983:       dumpDeclRef(*NNS.getNestedNameSpecifier()->getAsNamespaceAlias());
984:       break;
985:     case NestedNameSpecifier::TypeSpec:
986:       OF.emitSimpleVariant("TypeSpec");
987:       break;
988:     case NestedNameSpecifier::Global:
989:       OF.emitSimpleVariant("Global");
990:       break;
991:     case NestedNameSpecifier::Super:
992:       OF.emitSimpleVariant("Super");
993:       break;
994:     default:
995:       llvm_unreachable("Unknown specifier_kind is given!");
996:     }
997:   }
998: }
999:
1000: // template <class ATDWriter>
1001: // void ASTExporter<ATDWriter>::dumpTemplateParameters(const
1002: // TemplateParameterList *TPL) {
1003: //  if (!TPL)
1004: //    return;
1005: //
1006: //  for (TemplateParameterList::const_iterator I = TPL->begin(), E = TPL->end();
1007: //       I != E; ++I)
1008: //    dumpDecl(*I);
1009: //}
1010: //
1011: // template <class ATDWriter>
1012: // void ASTExporter<ATDWriter>::dumpTemplateArgumentListInfo(
1013: //    const TemplateArgumentListInfo &TALI) {
1014: //  for (unsigned i = 0, e = TALI.size(); i < e; ++i) {
1015: //    dumpTemplateArgumentLoc(TALI[i]);
1016: //  }
1017: //}
1018: //
1019: // template <class ATDWriter>
1020: // void ASTExporter<ATDWriter>::dumpTemplateArgumentLoc(const
1021: // TemplateArgumentLoc &A) {
1022: //  dumpTemplateArgument(A.getArgument(), A.getSourceRange());
1023: //}
1024:
1025: template <class ATDWriter>
1026: bool ASTExporter<ATDWriter>::alwaysEmitParent(const Decl *D) {
1027:   if (isa<ObjCMethodDecl>(D) || isa<CXXMethodDecl>(D) || isa<FieldDecl>(D) ||
1028:       isa<ParmVarDecl>(D) || isa<ObjCIvarDecl>(D) || isa<BlockDecl>(D) ||
1029:       isa<ObjCInterfaceDecl>(D) || isa<ObjCImplementationDecl>(D) ||
1030:       isa<ObjCCategoryDecl>(D) || isa<ObjCCategoryImplDecl>(D) ||
1031:       isa<ObjCPropertyDecl>(D) || isa<RecordDecl>(D) ||
1032:       isa<ObjCProtocolDecl>(D)) {
1033:     return true;
1034:   }
1035:   return false;
1036: }
1037: //===----------------------------------------------------------------------===//
1038: //  Decl dumping methods.
1039: //===----------------------------------------------------------------------===//
1040:
1041: #define DECL(DERIVED, BASE) //@atd #define @DERIVED@_decl_tuple @BASE@_tuple
1042: #define ABSTRACT_DECL(DECL) DECL
1043: #include <clang/AST/DeclNodes.inc>
1044: template <class ATDWriter>
1045: void ASTExporter<ATDWriter>::dumpDecl(const Decl *D) {
1046:   if (!D) {
1047:     // We use a fixed EmptyDecl node to represent null pointers
1048:     D = NullPtrDecl;
1049:   }
1050:   VariantScope Scope(OF, std::string(D->getDeclKindName()) + "Decl");
1051:   {
1052:     TupleScope Scope(OF, ASTExporter::tupleSizeOfDeclKind(D->getKind()));
1053:     ConstDeclVisitor<ASTExporter<ATDWriter>>::Visit(D);
1054:   }
1055: }
1056:
1057: template <class ATDWriter>
1058: int ASTExporter<ATDWriter>::DeclTupleSize() {
1059:   return 1;
1060: }
1061:
1062: //@atd #define decl_tuple decl_info
1063: //@atd type decl_info = {
1064: //@atd   pointer : pointer;
1065: //@atd   ?parent_pointer : pointer option;
1066: //@atd   source_range : source_range;
1067: //@atd   ?owning_module : string option;
1068: //@atd   ~is_hidden : bool;
1069: //@atd   ~is_implicit : bool;
1070: //@atd   ~is_used : bool;
1071: //@atd   ~is_this_declaration_referenced : bool;
1072: //@atd   ~is_invalid_decl : bool;
1073: //@atd   ~attributes : attribute list;
1074: //@atd   ?full_comment : comment option;
1075: //@atd   ~access <ocaml default="`None"> : access_specifier
1076: //@atd } <ocaml field_prefix="di_">
1077: template <class ATDWriter>
1078: void ASTExporter<ATDWriter>::VisitDecl(const Decl *D) {
1079:   {
1080:     bool ShouldEmitParentPointer =
1081:         alwaysEmitParent(D) ||
1082:         D->getLexicalDeclContext() != D->getDeclContext();
1083:     Module *M = D->getImportedOwningModule();
1084:     if (!M) {
1085:       M = D->getLocalOwningModule();
1086:     }
1087:     const NamedDecl *ND = dyn_cast<NamedDecl>(D);
1088:     bool IsNDHidden = ND && !ND->isUnconditionallyVisible();
1089:     bool IsDImplicit = D->isImplicit();
1090:     bool IsDUsed = D->isUsed();
1091:     bool IsDReferenced = D->isThisDeclarationReferenced();
1092:     bool IsDInvalid = D->isInvalidDecl();
1093:     bool HasAttributes = D->hasAttrs();
1094:     const FullComment *Comment =
1095:         Options.dumpComments
1096:             ? D->getASTContext().getLocalCommentForDeclUncached(D)
1097:             : nullptr;
1098:     AccessSpecifier Access = D->getAccess();
1099:     bool HasAccess = Access != AccessSpecifier::AS_none;
1100:     int size = 2 + ShouldEmitParentPointer + (bool)M + IsNDHidden +
1101:                IsDImplicit + IsDUsed + IsDReferenced + IsDInvalid +
1102:                HasAttributes + (bool)Comment + HasAccess;
1103:     ObjectScope Scope(OF, size);
1104:
1105:     OF.emitTag("pointer");
1106:     dumpPointer(D);
1107:     if (ShouldEmitParentPointer) {
1108:       OF.emitTag("parent_pointer");
1109:       dumpPointer(cast<Decl>(D->getDeclContext()));
1110:     }
1111:
1112:     OF.emitTag("source_range");
1113:     dumpSourceRange(D->getSourceRange());
1114:     if (M) {
1115:       OF.emitTag("owning_module");
1116:       OF.emitString(M->getFullModuleName());
1117:     }
1118:     OF.emitFlag("is_hidden", IsNDHidden);
1119:     OF.emitFlag("is_implicit", IsDImplicit);
1120:     OF.emitFlag("is_used", IsDUsed);
1121:     OF.emitFlag("is_this_declaration_referenced", IsDReferenced);
1122:     OF.emitFlag("is_invalid_decl", IsDInvalid);
1123:
1124:     if (HasAttributes) {
1125:       OF.emitTag("attributes");
1126:       ArrayScope ArrayAttr(OF, D->getAttrs().size());
1127:       for (auto I : D->getAttrs()) {
1128:         dumpAttr(I);
1129:       }
1130:     }
1131:
1132:     if (Comment) {
1133:       OF.emitTag("full_comment");
1134:       dumpFullComment(Comment);
1135:     }
1136:
1137:     if (HasAccess) {
1138:       OF.emitTag("access");
1139:       dumpAccessSpecifier(Access);
1140:     }
1141:   }
1142: }
1143:
1144: template <class ATDWriter>
1145: int ASTExporter<ATDWriter>::CapturedDeclTupleSize() {
1146:   return DeclTupleSize() + DeclContextTupleSize();
1147: }
1148: //@atd #define captured_decl_tuple decl_tuple * decl_context_tuple
1149: template <class ATDWriter>
1150: void ASTExporter<ATDWriter>::VisitCapturedDecl(const CapturedDecl *D) {
1151:   VisitDecl(D);
1152:   VisitDeclContext(D);
1153: }
1154:
1155: template <class ATDWriter>
1156: int ASTExporter<ATDWriter>::LinkageSpecDeclTupleSize() {
1157:   return DeclTupleSize() + DeclContextTupleSize();
1158: }
1159: //@atd #define linkage_spec_decl_tuple decl_tuple * decl_context_tuple
1160: template <class ATDWriter>
1161: void ASTExporter<ATDWriter>::VisitLinkageSpecDecl(const LinkageSpecDecl *D) {
1162:   VisitDecl(D);
1163:   VisitDeclContext(D);
1164: }
1165:
1166: template <class ATDWriter>
1167: int ASTExporter<ATDWriter>::NamespaceDeclTupleSize() {
1168:   return NamedDeclTupleSize() + DeclContextTupleSize() + 1;
1169: }
1170: //@atd #define namespace_decl_tuple named_decl_tuple * decl_context_tuple * namespace_decl_info
1171: //@atd type namespace_decl_info = {
1172: //@atd   ~is_inline : bool;
1173: //@atd } <ocaml field_prefix="ndi_">
1174: template <class ATDWriter>
1175: void ASTExporter<ATDWriter>::VisitNamespaceDecl(const NamespaceDecl *D) {
1176:   VisitNamedDecl(D);
1177:   VisitDeclContext(D);
1178:
1179:   bool IsInline = D->isInline();
1180:   ObjectScope Scope(OF, 0 + IsInline);
1181:
1182:   OF.emitFlag("is_inline", IsInline);
1183: }
1184:
1185: template <class ATDWriter>
1186: int ASTExporter<ATDWriter>::ObjCContainerDeclTupleSize() {
1187:   return NamedDeclTupleSize() + DeclContextTupleSize();
1188: }
1189: //@atd #define obj_c_container_decl_tuple named_decl_tuple * decl_context_tuple
1190: template <class ATDWriter>
1191: void ASTExporter<ATDWriter>::VisitObjCContainerDecl(
1192:     const ObjCContainerDecl *D) {
1193:   VisitNamedDecl(D);
1194:   VisitDeclContext(D);
1195: }
1196:
1197: template <class ATDWriter>
1198: int ASTExporter<ATDWriter>::TagDeclTupleSize() {
1199:   return TypeDeclTupleSize() + DeclContextTupleSize() + 1;
1200: }
1201: //@atd type tag_kind = [
1202: //@atd   TTK_Struct
1203: //@atd | TTK_Interface
1204: //@atd | TTK_Union
1205: //@atd | TTK_Class
1206: //@atd | TTK_Enum
1207: //@atd ]
1208: //@atd #define tag_decl_tuple type_decl_tuple * decl_context_tuple * tag_kind
1209: template <class ATDWriter>
1210: void ASTExporter<ATDWriter>::VisitTagDecl(const TagDecl *D) {
1211:   VisitTypeDecl(D);
1212:   VisitDeclContext(D);
1213:   switch (D->getTagKind()) {
1214:   case TagTypeKind::Struct:
1215:     OF.emitSimpleVariant("TTK_Struct");
1216:     break;
1217:   case TagTypeKind::Interface:
1218:     OF.emitSimpleVariant("TTK_Interface");
1219:     break;
1220:   case TagTypeKind::Union:
1221:     OF.emitSimpleVariant("TTK_Union");
1222:     break;
1223:   case TagTypeKind::Class:
1224:     OF.emitSimpleVariant("TTK_Class");
1225:     break;
1226:   case TagTypeKind::Enum:
1227:     OF.emitSimpleVariant("TTK_Enum");
1228:     break;
1229:   default:
1230:     llvm_unreachable("Unknown tag_kind is given!");
1231:   }
1232: }
1233:
1234: template <class ATDWriter>
1235: int ASTExporter<ATDWriter>::TypeDeclTupleSize() {
1236:   return NamedDeclTupleSize() + 1;
1237: }
1238: //@atd #define type_decl_tuple named_decl_tuple * type_ptr
1239: template <class ATDWriter>
1240: void ASTExporter<ATDWriter>::VisitTypeDecl(const TypeDecl *D) {
1241:   VisitNamedDecl(D);
1242:   const Type *T = D->getTypeForDecl();
1243:   dumpPointerToType(T);
1244: }
1245:
1246: template <class ATDWriter>
1247: int ASTExporter<ATDWriter>::ValueDeclTupleSize() {
1248:   return NamedDeclTupleSize() + 1;
1249: }
1250: //@atd #define value_decl_tuple named_decl_tuple * qual_type
1251: template <class ATDWriter>
1252: void ASTExporter<ATDWriter>::VisitValueDecl(const ValueDecl *D) {
1253:   VisitNamedDecl(D);
1254:   dumpQualType(D->getType());
1255: }
1256:
1257: template <class ATDWriter>
1258: int ASTExporter<ATDWriter>::TranslationUnitDeclTupleSize() {
1259:   return DeclTupleSize() + DeclContextTupleSize() + 1;
1260: }
1261: //@atd type input_kind = [
1262: //@atd   IK_None
1263: //@atd | IK_Asm
1264: //@atd | IK_C
1265: //@atd | IK_CXX
1266: //@atd | IK_ObjC
1267: //@atd | IK_ObjCXX
1268: //@atd | IK_OpenCL
1269: //@atd | IK_CUDA
1270: //@atd | IK_HIP
1271: //@atd | IK_RenderScript
1272: //@atd | IK_LLVM_IR
1273: //@atd | IK_HLSL
1274: //@atd ]
1275: template <class ATDWriter>
1276: void ASTExporter<ATDWriter>::dumpInputKind(InputKind kind) {
1277:   // Despite here we deal only with the language field of InputKind, there are
1278:   // new info in InputKind that can still be used, e.g. whether the source is
1279:   // preprocessed (PP), or precompiled.
1280:   switch (kind.getLanguage()) {
1281:   case Language::Unknown:
1282:     OF.emitSimpleVariant("IK_None");
1283:     break;
1284:   case Language::Asm:
1285:     OF.emitSimpleVariant("IK_Asm");
1286:     break;
1287:   case Language::C:
1288:     OF.emitSimpleVariant("IK_C");
1289:     break;
1290:   case Language::CXX:
1291:     OF.emitSimpleVariant("IK_CXX");
1292:     break;
1293:   case Language::ObjC:
1294:     OF.emitSimpleVariant("IK_ObjC");
1295:     break;
1296:   case Language::ObjCXX:
1297:     OF.emitSimpleVariant("IK_ObjCXX");
1298:     break;
1299:   case Language::OpenCL:
1300:     OF.emitSimpleVariant("IK_OpenCL");
1301:     break;
1302:   case Language::OpenCLCXX:
1303:     OF.emitSimpleVariant("IK_OpenCLCXX");
1304:     break;
1305:   case Language::CUDA:
1306:     OF.emitSimpleVariant("IK_CUDA");
1307:     break;
1308:   case Language::LLVM_IR:
1309:     OF.emitSimpleVariant("IK_LLVM_IR");
1310:     break;
1311:   case Language::HIP:
1312:     OF.emitSimpleVariant("IK_HIP");
1313:     break;
1314:   case Language::HLSL:
1315:     OF.emitSimpleVariant("IK_HLSL");
1316:     break;
1317:   default:
1318:     llvm_unreachable("Unknown input_kind is given!");
1319:   }
1320: }
1321: //@atd type integer_type_widths = {
1322: //@atd char_type : int;
1323: //@atd short_type : int;
1324: //@atd int_type : int;
1325: //@atd long_type : int;
1326: //@atd longlong_type : int;
1327: //@atd } <ocaml field_prefix="itw_">
1328: template <class ATDWriter>
1329: void ASTExporter<ATDWriter>::dumpIntegerTypeWidths(const TargetInfo &info) {
1330:   ObjectScope Scope(OF, 5);
1331:   OF.emitTag("char_type");
1332:   OF.emitInteger(info.getCharWidth());
1333:   OF.emitTag("short_type");
1334:   OF.emitInteger(info.getShortWidth());
1335:   OF.emitTag("int_type");
1336:   OF.emitInteger(info.getIntWidth());
1337:   OF.emitTag("long_type");
1338:   OF.emitInteger(info.getLongWidth());
1339:   OF.emitTag("longlong_type");
1340:   OF.emitInteger(info.getLongLongWidth());
1341: }
1342: //@atd #define translation_unit_decl_tuple decl_tuple * decl_context_tuple * translation_unit_decl_info
1343: //@atd type  translation_unit_decl_info = {
1344: //@atd   input_path : source_file;
1345: //@atd   input_kind : input_kind;
1346: //@atd   integer_type_widths : integer_type_widths;
1347: //@atd   ~is_objc_arc_on : bool;
1348: //@atd   types : c_type list;
1349: //@atd } <ocaml field_prefix="tudi_">
1350: template <class ATDWriter>
1351: void ASTExporter<ATDWriter>::VisitTranslationUnitDecl(
1352:     const TranslationUnitDecl *D) {
1353:   VisitDecl(D);
1354:   VisitDeclContext(D);
1355:   bool IsObjCArcOn = D->getASTContext().getLangOpts().ObjCAutoRefCount;
1356:   ObjectScope Scope(OF, 4 + IsObjCArcOn);
1357:   OF.emitTag("input_path");
1358:   OF.emitString(
1359:       Options.normalizeSourcePath(Options.inputFile.getFile().str().c_str()));
1360:   OF.emitTag("input_kind");
1361:   dumpInputKind(Options.inputFile.getKind());
1362:   OF.emitTag("integer_type_widths");
1363:   dumpIntegerTypeWidths(Context.getTargetInfo());
1364:   OF.emitFlag("is_objc_arc_on", IsObjCArcOn);
1365:   OF.emitTag("types");
1366:   const auto &types = Context.getTypes();
1367:   ArrayScope aScope(OF, types.size() + 1); // + 1 for nullptr
1368:   for (const Type *type : types) {
1369:     dumpType(type);
1370:   }
1371:   // Just in case, add NoneType to dumped types
1372:   dumpType(nullptr);
1373: }
1374:
1375: template <class ATDWriter>
1376: int ASTExporter<ATDWriter>::NamedDeclTupleSize() {
1377:   return DeclTupleSize() + 1;
1378: }
1379: //@atd #define named_decl_tuple decl_tuple * named_decl_info
1380: template <class ATDWriter>
1381: void ASTExporter<ATDWriter>::VisitNamedDecl(const NamedDecl *D) {
1382:   VisitDecl(D);
1383:   dumpName(*D);
1384: }
1385:
1386: template <class ATDWriter>
1387: int ASTExporter<ATDWriter>::TypedefDeclTupleSize() {
1388:   return ASTExporter::TypedefNameDeclTupleSize() + 1;
1389: }
1390: //@atd #define typedef_decl_tuple typedef_name_decl_tuple * typedef_decl_info
1391: //@atd type typedef_decl_info = {
1392: //@atd   ~is_module_private : bool
1393: //@atd } <ocaml field_prefix="tdi_">
1394: template <class ATDWriter>
1395: void ASTExporter<ATDWriter>::VisitTypedefDecl(const TypedefDecl *D) {
1396:   ASTExporter<ATDWriter>::VisitTypedefNameDecl(D);
1397:
1398:   bool IsModulePrivate = D->isModulePrivate();
1399:   ObjectScope Scope(OF, 0 + IsModulePrivate);
1400:
1401:   OF.emitFlag("is_module_private", IsModulePrivate);
1402: }
1403:
1404: template <class ATDWriter>
1405: int ASTExporter<ATDWriter>::EnumDeclTupleSize() {
1406:   return TagDeclTupleSize() + 1;
1407: }
1408: //@atd #define enum_decl_tuple tag_decl_tuple * enum_decl_info
1409: //@atd type enum_decl_info = {
1410: //@atd   ?scope : enum_decl_scope option;
1411: //@atd   ~is_module_private : bool
1412: //@atd } <ocaml field_prefix="edi_">
1413: //@atd type enum_decl_scope = [Class | Struct]
1414: template <class ATDWriter>
1415: void ASTExporter<ATDWriter>::VisitEnumDecl(const EnumDecl *D) {
1416:   VisitTagDecl(D);
1417:
1418:   bool IsScoped = D->isScoped();
1419:   bool IsModulePrivate = D->isModulePrivate();
1420:   ObjectScope Scope(OF, 0 + IsScoped + IsModulePrivate); // not covered by tests
1421:
1422:   if (IsScoped) {
1423:     OF.emitTag("scope");
1424:     if (D->isScopedUsingClassTag())
1425:       OF.emitSimpleVariant("Class");
1426:     else
1427:       OF.emitSimpleVariant("Struct");
1428:   }
1429:   OF.emitFlag("is_module_private", IsModulePrivate);
1430: }
1431:
1432: template <class ATDWriter>
1433: int ASTExporter<ATDWriter>::RecordDeclTupleSize() {
1434:   return TagDeclTupleSize() + 1;
1435: }
1436: //@atd #define record_decl_tuple tag_decl_tuple * record_decl_info
1437: //@atd type record_decl_info = {
1438: //@atd   definition_ptr : pointer;
1439: //@atd   ~is_module_private : bool;
1440: //@atd   ~is_complete_definition : bool;
1441: //@atd   ~is_dependent_type : bool;
1442: //@atd } <ocaml field_prefix="rdi_">
1443: template <class ATDWriter>
1444: void ASTExporter<ATDWriter>::VisitRecordDecl(const RecordDecl *D) {
1445:   VisitTagDecl(D);
1446:
1447:   bool IsModulePrivate = D->isModulePrivate();
1448:   bool IsCompleteDefinition = D->isCompleteDefinition();
1449:   bool IsDependentType = D->isDependentType();
1450:   ObjectScope Scope(
1451:       OF, 1 + IsModulePrivate + IsCompleteDefinition + IsDependentType);
1452:   OF.emitTag("definition_ptr");
1453:   dumpPointer(D->getDefinition());
1454:   OF.emitFlag("is_module_private", IsModulePrivate);
1455:   OF.emitFlag("is_complete_definition", IsCompleteDefinition);
1456:   OF.emitFlag("is_dependent_type", IsDependentType);
1457: }
1458:
1459: template <class ATDWriter>
1460: int ASTExporter<ATDWriter>::EnumConstantDeclTupleSize() {
1461:   return ValueDeclTupleSize() + 1;
1462: }
1463: //@atd #define enum_constant_decl_tuple value_decl_tuple * enum_constant_decl_info
1464: //@atd type enum_constant_decl_info = {
1465: //@atd   ?init_expr : stmt option
1466: //@atd } <ocaml field_prefix="ecdi_">
1467: template <class ATDWriter>
1468: void ASTExporter<ATDWriter>::VisitEnumConstantDecl(const EnumConstantDecl *D) {
1469:   VisitValueDecl(D);
1470:
1471:   const Expr *Init = D->getInitExpr();
1472:   ObjectScope Scope(OF, 0 + (bool)Init); // not covered by tests
1473:
1474:   if (Init) {
1475:     OF.emitTag("init_expr");
1476:     dumpStmt(Init);
1477:   }
1478: }
1479:
1480: template <class ATDWriter>
1481: int ASTExporter<ATDWriter>::IndirectFieldDeclTupleSize() {
1482:   return ValueDeclTupleSize() + 1;
1483: }
1484: //@atd #define indirect_field_decl_tuple value_decl_tuple * decl_ref list
1485: template <class ATDWriter>
1486: void ASTExporter<ATDWriter>::VisitIndirectFieldDecl(
1487:     const IndirectFieldDecl *D) {
1488:   VisitValueDecl(D);
1489:   ArrayScope Scope(
1490:       OF,
1491:       std::distance(D->chain_begin(), D->chain_end())); // not covered by tests
1492:   for (auto I : D->chain()) {
1493:     dumpDeclRef(*I);
1494:   }
1495: }
1496:
1497: template <class ATDWriter>
1498: int ASTExporter<ATDWriter>::FunctionDeclTupleSize() {
1499:   return ASTExporter::DeclaratorDeclTupleSize() + 1;
1500: }
1501: //@atd #define function_decl_tuple declarator_decl_tuple * function_decl_info
1502: //@atd type function_decl_info = {
1503: //@atd   ?mangled_name : string option;
1504: //@atd   ~is_cpp : bool;
1505: //@atd   ~is_inline : bool;
1506: //@atd   ~is_module_private : bool;
1507: //@atd   ~is_pure : bool;
1508: //@atd   ~is_deleted : bool;
1509: //@atd   ~is_no_return : bool;
1510: //@atd   ~is_constexpr : bool;
1511: //@atd   ~is_variadic : bool;
1512: //@atd   ~is_static : bool;
1513: //@atd   ~parameters : decl list;
1514: //@atd   ?decl_ptr_with_body : pointer option;
1515: //@atd   ?body : stmt option;
1516: //@atd   ?template_specialization : template_specialization_info option;
1517: //@atd   ?point_of_instantiation : source_location option
1518: //@atd } <ocaml field_prefix="fdi_">
1519: template <class ATDWriter>
1520: void ASTExporter<ATDWriter>::VisitFunctionDecl(const FunctionDecl *D) {
1521:   ASTExporter<ATDWriter>::VisitDeclaratorDecl(D);
1522:   // We purposedly do not call VisitDeclContext(D).
1523:
1524:   auto DNkind = D->getDeclName().getNameKind();
1525:   bool ShouldMangleName = Mangler->shouldMangleDeclName(D) &&
1526:                           DNkind != DeclarationName::CXXDeductionGuideName &&
1527:                           DNkind != DeclarationName::CXXUsingDirective;
1528:   bool IsInlineSpecified = D->isInlineSpecified();
1529:   bool IsModulePrivate = D->isModulePrivate();
1530:   bool IsPure = D->isPureVirtual();
1531:   bool IsDeleted = D->isDeleted();
1532:   bool IsCpp = Mangler->getASTContext().getLangOpts().CPlusPlus;
1533:   bool IsVariadic = D->isVariadic();
1534:   bool IsStatic = false; // static functions
1535:   if (D->getStorageClass() == SC_Static) {
1536:     IsStatic = true;
1537:   }
1538:   auto IsNoReturn = D->isNoReturn();
1539:   bool IsConstexpr = D->isConstexpr();
1540:   bool HasParameters = !D->param_empty();
1541:   const FunctionDecl *DeclWithBody = D;
1542:   // FunctionDecl::hasBody() will set DeclWithBody pointer to decl that
1543:   // has body. If there is no body in all decls of that function,
1544:   // then we need to set DeclWithBody to nullptr manually
1545:   if (!D->hasBody(DeclWithBody)) {
1546:     DeclWithBody = nullptr;
1547:   }
1548:   bool HasDeclarationBody = D->doesThisDeclarationHaveABody();
1549:   FunctionTemplateDecl *TemplateDecl = D->getPrimaryTemplate();
1550:   SourceLocation PointOfInstantiation = D->getPointOfInstantiation();
1551:   bool IsValidPointOfInstantiation = PointOfInstantiation.isValid();
1552:   int size = ShouldMangleName + IsCpp + IsInlineSpecified + IsModulePrivate +
1553:              IsPure + IsDeleted + IsNoReturn + IsConstexpr + IsVariadic +
1554:              IsStatic + HasParameters + (bool)DeclWithBody +
1555:              HasDeclarationBody + (bool)TemplateDecl +
1556:              IsValidPointOfInstantiation;
1557:   ObjectScope Scope(OF, size);
1558:
1559:   if (ShouldMangleName) {
1560:     OF.emitTag("mangled_name");
1561:     SmallString<64> Buf;

(Output capped at 50 KB. Showing lines 1-1561. Use offset=1562 to continue.)
</content>
```

---

## Assistant (Explore · Big Pickle · 7.5s)

_Thinking:_

Great, I now have a very thorough understanding of the ASTExporter. Let me now look at the ATD-generated types for Clang AST, the clang_ast_t types, and a few more key files: the cType_to_sil_type.ml for type translation, ClangWrapper, ClangCommand (for how the plugin is invoked), and the frontend config.

Let me look at the Clang AST types, the type translation, and how the plugin is invoked:

**Tool: glob**

**Input:**

```json
{
  "pattern": "**/atdlib/atdwriter*",
  "path": "facebook-clang-plugins"
}
```

**Output:**

```
No files found
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "**/clang_ast_t.ml",
  "path": "/home/tablinux/Github/infer"
}
```

**Output:**

```
infer/src/atd/clang_ast_t.ml
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cType_to_sil_type.ml",
  "limit": 100
}
```

**Output:**

```
<path>infer/src/clang/cType_to_sil_type.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9: module L = Logging
10:
11: let get_builtin_objc_typename builtin_type =
12:   match builtin_type with
13:   | `ObjCId ->
14:       Typ.Name.C.from_string CFrontend_config.objc_object
15:   | `ObjCClass ->
16:       Typ.Name.C.from_string CFrontend_config.objc_class
17:
18:
19: let get_builtin_objc_type builtin_type =
20:   let typ = Typ.mk (Tstruct (get_builtin_objc_typename builtin_type)) in
21:   match builtin_type with `ObjCId -> typ.Typ.desc | `ObjCClass -> Typ.Tptr (typ, Typ.Pk_pointer)
22:
23:
24: let type_desc_of_builtin_type_kind builtin_type_kind =
25:   match builtin_type_kind with
26:   | `Void ->
27:       Typ.Tvoid
28:   | `Bool ->
29:       Typ.Tint IBool
30:   | `Char_U ->
31:       Typ.Tint IUChar
32:   | `UChar ->
33:       Typ.Tint IUChar
34:   | `WChar_U ->
35:       Typ.Tint IUChar
36:   | `Char_S ->
37:       Typ.Tint IChar
38:   | `SChar ->
39:       Typ.Tint ISChar
40:   | `WChar_S | `Char16 | `Char32 ->
41:       Typ.Tint IChar
42:   | `UShort ->
43:       Typ.Tint IUShort
44:   | `Short ->
45:       Typ.Tint IShort
46:   | `UInt | `UInt128 ->
47:       Typ.Tint IUInt
48:   | `ULong ->
49:       Typ.Tint IULong
50:   | `ULongLong ->
51:       Typ.Tint IULongLong
52:   | `Int | `Int128 ->
53:       Typ.Tint IInt
54:   | `Long ->
55:       Typ.Tint ILong
56:   | `LongLong ->
57:       Typ.Tint ILongLong
58:   | `Half ->
59:       Typ.Tint IShort (*?*)
60:   | `Float ->
61:       Typ.Tfloat FFloat
62:   | `Double ->
63:       Typ.Tfloat FDouble
64:   | `LongDouble ->
65:       Typ.Tfloat FLongDouble
66:   | `NullPtr ->
67:       Typ.Tint IInt
68:   | `ObjCId ->
69:       get_builtin_objc_type `ObjCId
70:   | `ObjCClass ->
71:       get_builtin_objc_type `ObjCClass
72:   | _ ->
73:       Typ.Tvoid
74:
75:
76: let type_of_builtin_type_kind ?(is_const = false) builtin_type_kind =
77:   let desc = type_desc_of_builtin_type_kind builtin_type_kind in
78:   let quals = Typ.mk_type_quals ~is_const () in
79:   Typ.mk ~quals desc
80:
81:
82: let pointer_attribute_of_objc_attribute ~attr_info =
83:   match attr_info.Clang_ast_t.ati_lifetime with
84:   | `OCL_None | `OCL_Strong ->
85:       Typ.Pk_pointer
86:   | `OCL_ExplicitNone ->
87:       Typ.Pk_objc_unsafe_unretained
88:   | `OCL_Weak ->
89:       Typ.Pk_objc_weak
90:   | `OCL_Autoreleasing ->
91:       Typ.Pk_objc_autoreleasing
92:
93:
94: let block_pointer_attr_of_attr_info attr_info =
95:   Option.value_map ~default:Typ.Pk_pointer
96:     ~f:(fun attr_info ->
97:       match attr_info.Clang_ast_t.ati_attr_kind with
98:       | Clang_ast_t.NonNullAttrKind ->
99:           Typ.Pk_objc_nonnull_block
100:       | Clang_ast_t.TypeNonNullAttrKind ->

(Showing lines 1-100 of 321. Use offset=101 to continue.)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/ClangCommand.ml",
  "limit": 100
}
```

**Output:**

```
<path>infer/src/clang/ClangCommand.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9: module L = Logging
10:
11: type t =
12:   { exec: string
13:   ; argv: string list
14:   ; orig_argv: string list
15:   ; quoting_style: ClangQuotes.style
16:   ; is_driver: bool }
17:
18: (** name of the plugin to use *)
19: let plugin_name = "BiniouASTExporter"
20:
21: let value_of_argv_option argv opt_name =
22:   List.fold
23:     ~f:(fun (prev_arg, result) arg ->
24:       let result' =
25:         if Option.is_some result then result
26:         else if String.equal opt_name prev_arg then Some arg
27:         else None
28:       in
29:       (arg, result') )
30:     ~init:("", None) argv
31:   |> snd
32:
33:
34: (** Like [value_of_argv_option] but also searches inside @argfiles recursively. *)
35: let rec value_of_argv_option_deep argv opt_name =
36:   let strip s =
37:     String.strip s |> Utils.strip_balanced_once ~drop:(function '"' | '\'' -> true | _ -> false)
38:   in
39:   let rec aux prev_arg = function
40:     | [] ->
41:         None
42:     | at_argfile :: tl when String.is_prefix at_argfile ~prefix:"@" -> (
43:         let argfile = String.chop_prefix_exn ~prefix:"@" at_argfile in
44:         match In_channel.read_lines argfile with
45:         | lines ->
46:             let result = value_of_argv_option_deep (List.map ~f:strip lines) opt_name in
47:             if Option.is_some result then result else aux "" tl
48:         | exception _ ->
49:             aux "" tl )
50:     | arg :: _ when String.equal opt_name prev_arg ->
51:         Some arg
52:     | arg :: tl ->
53:         aux arg tl
54:   in
55:   aux "" argv
56:
57:
58: let value_of_option {orig_argv} = value_of_argv_option orig_argv
59:
60: let has_flag {orig_argv} flag = List.exists ~f:(String.equal flag) orig_argv
61:
62: let can_attach_ast_exporter cmd =
63:   let is_supported_language cmd =
64:     match value_of_option cmd "-x" with
65:     | None ->
66:         if cmd.is_driver then (* let's continue and ask clang -### *) true
67:         else (
68:           L.external_warning "malformed -cc1 command has no \"-x\" flag!" ;
69:           false )
70:     | Some "cuda" ->
71:         false
72:     | Some lang when String.is_prefix ~prefix:"assembler" lang ->
73:         false
74:     | Some _ ->
75:         true
76:   in
77:   (* -Eonly is -cc1 flag that gets produced by 'clang -M -### ...' *)
78:   let is_preprocessor_only cmd = has_flag cmd "-E" || has_flag cmd "-Eonly" in
79:   (cmd.is_driver || has_flag cmd "-cc1")
80:   && is_supported_language cmd
81:   && not (is_preprocessor_only cmd)
82:
83:
84: let may_capture cmd = can_attach_ast_exporter cmd
85:
86: let argv_cons a b = a :: b
87:
88: let argv_do_if cond action x = if cond then action x else x
89:
90: let file_arg_cmd_sanitizer cmd =
91:   let file = ClangQuotes.mk_arg_file "clang_command_" cmd.quoting_style cmd.argv in
92:   {cmd with argv= [Format.sprintf "@%s" file]}
93:
94:
95: let libcxx_include_to_override_regex =
96:   Option.map ~f:Str.regexp Config.clang_libcxx_include_to_override_regex
97:
98:
99: let fcp_clang_resource_include_dir =
100:   let clang_lib_dir = Config.fcp_dir ^/ "clang" ^/ "install" ^/ "lib" ^/ "clang" in

(Showing lines 1-100 of 362. Use offset=101 to continue.)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cFrontend_config.ml"
}
```

**Output:**

```
<path>infer/src/clang/cFrontend_config.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: (** Module that contains constants and global state used in the frontend *)
11:
12: type clang_lang = C | CPP | ObjC | ObjCPP [@@deriving compare, equal]
13:
14: type translation_unit_context =
15:   { lang: clang_lang
16:   ; source_file: SourceFile.t
17:   ; integer_type_widths: IntegerWidths.t
18:   ; is_objc_arc_on: bool }
19:
20: type decl_trans_context = [`DeclTraversal | `Translation | `CppLambdaExprTranslation]
21:
22: type instr_type =
23:   | ClangStmt of Procdesc.Node.stmt_nodekind * Clang_ast_t.stmt
24:   | CXXConstructorInit of Clang_ast_t.cxx_ctor_initializer
25:
26: (** Constants *)
27:
28: let alloc = "alloc"
29:
30: let allocWithZone = "allocWithZone:"
31:
32: let arrayWithObjects_count = "arrayWithObjects:count:"
33:
34: let dictionaryWithObjects_forKeys_count = "dictionaryWithObjects:forKeys:count:"
35:
36: let dealloc = "dealloc"
37:
38: let assert_fail = "__assert_fail"
39:
40: let assert_rtn = "__assert_rtn"
41:
42: let biniou_buffer_size =
43:   (* the C++ standard suggests that implementation should support string literals up to this length *)
44:   65535
45:
46:
47: let builtin_expect = "__builtin_expect"
48:
49: let builtin_memset_chk = "__builtin___memset_chk"
50:
51: let builtin_object_size = "__builtin_object_size"
52:
53: (** script to run our own clang *)
54: let clang_bin xx =
55:   Config.bin_dir ^/ Filename.parent_dir_name ^/ Filename.parent_dir_name ^/ "facebook-clang-plugins"
56:   ^/ "clang" ^/ "install" ^/ "bin" ^/ "clang" ^ xx
57:
58:
59: let class_method = "class"
60:
61: let cxx_constructor = "__cxx_constructor"
62:
63: let fbAssertWithSignalAndLogFunctionHelper = "FBAssertWithSignalAndLogFunctionHelper"
64:
65: let google_LogMessageFatal = "google::LogMessageFatal_LogMessageFatal"
66:
67: let google_MakeCheckOpString = "google::MakeCheckOpString"
68:
69: let handleFailureInFunction = "handleFailureInFunction:file:lineNumber:description:"
70:
71: let handleFailureInMethod = "handleFailureInMethod:object:file:lineNumber:description:"
72:
73: let infer = "infer"
74:
75: let init = "init"
76:
77: let is_kind_of_class = "isKindOfClass:"
78:
79: let malloc = "malloc"
80:
81: let new_str = "new"
82:
83: let next_object = "nextObject"
84:
85: let nsenumerator_cl = "NSEnumerator"
86:
87: let nsstring_cl = "NSString"
88:
89: let objc_class = "objc_class"
90:
91: let objc_object = "objc_object"
92:
93: let object_enumerator = "objectEnumerator"
94:
95: let return_param = "__return_param"
96:
97: let self = "self"
98:
99: let std_addressof = QualifiedCppName.Match.of_fuzzy_qual_names ["std::addressof"]
100:
101: let string_with_utf8_m = "stringWithUTF8String:"
102:
103: let this = "this"
104:
105: let replace_with_deref_first_arg_attr = "__infer_replace_with_deref_first_arg"
106:
107: let modeled_function_attributes = [replace_with_deref_first_arg_attr]
108:
109: (** Global state *)
110:
111: let enum_map = ref ClangPointers.Map.empty
112:
113: let global_translation_unit_decls : Clang_ast_t.decl list ref = ref []
114:
115: let log_out = ref Format.std_formatter
116:
117: let sil_types_map = ref Clang_ast_extend.TypePointerMap.empty
118:
119: let procedures_attempted = ref 0
120:
121: let procedures_failed = ref 0
122:
123: let reset_global_state () =
124:   enum_map := ClangPointers.Map.empty ;
125:   global_translation_unit_decls := [] ;
126:   log_out := Format.std_formatter ;
127:   sil_types_map := Clang_ast_extend.TypePointerMap.empty ;
128:   procedures_attempted := 0 ;
129:   procedures_failed := 0

(End of file - total 129 lines)
</content>
```

---

## Assistant (Explore · Big Pickle · 6.4s)

_Thinking:_

Let me now look at the ATD-generated Clang_ast_t module, the ClangWrapper, and more of the ClangCommand for the plugin args. Let me also look at how `ClangWrapper.ml` works, as it seems to be the tool invocation wrapper, and `with_plugin_args` in ClangCommand.

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/atd/clang_ast_t.ml",
  "limit": 120
}
```

**Output:**

```
<path>infer/src/atd/clang_ast_t.ml</path>
<type>file</type>
<content>
1: (* Auto-generated from "clang_ast.atd" *)
2: [@@@ocaml.warning "-27-32-33-35-39"]
3:
4: type access_specifier = [ `None | `Public | `Protected | `Private ]
5:
6: type atomic_expr_kind = [
7:     `AO__atomic_add_fetch | `AO__atomic_and_fetch | `AO__atomic_clear
8:   | `AO__atomic_compare_exchange | `AO__atomic_compare_exchange_n
9:   | `AO__atomic_exchange | `AO__atomic_exchange_n | `AO__atomic_fetch_add
10:   | `AO__atomic_fetch_and | `AO__atomic_fetch_max | `AO__atomic_fetch_min
11:   | `AO__atomic_fetch_nand | `AO__atomic_fetch_or | `AO__atomic_fetch_sub
12:   | `AO__atomic_fetch_xor | `AO__atomic_load | `AO__atomic_load_n
13:   | `AO__atomic_max_fetch | `AO__atomic_min_fetch | `AO__atomic_nand_fetch
14:   | `AO__atomic_or_fetch | `AO__atomic_store | `AO__atomic_store_n
15:   | `AO__atomic_sub_fetch | `AO__atomic_test_and_set | `AO__atomic_xor_fetch
16:   | `AO__c11_atomic_compare_exchange_strong
17:   | `AO__c11_atomic_compare_exchange_weak | `AO__c11_atomic_exchange
18:   | `AO__c11_atomic_fetch_add | `AO__c11_atomic_fetch_and
19:   | `AO__c11_atomic_fetch_max | `AO__c11_atomic_fetch_min
20:   | `AO__c11_atomic_fetch_nand | `AO__c11_atomic_fetch_or
21:   | `AO__c11_atomic_fetch_sub | `AO__c11_atomic_fetch_xor
22:   | `AO__c11_atomic_init | `AO__c11_atomic_load | `AO__c11_atomic_store
23:   | `AO__hip_atomic_compare_exchange_strong
24:   | `AO__hip_atomic_compare_exchange_weak | `AO__hip_atomic_exchange
25:   | `AO__hip_atomic_fetch_add | `AO__hip_atomic_fetch_and
26:   | `AO__hip_atomic_fetch_max | `AO__hip_atomic_fetch_min
27:   | `AO__hip_atomic_fetch_or | `AO__hip_atomic_fetch_sub
28:   | `AO__hip_atomic_fetch_xor | `AO__hip_atomic_load | `AO__hip_atomic_store
29:   | `AO__opencl_atomic_compare_exchange_strong
30:   | `AO__opencl_atomic_compare_exchange_weak | `AO__opencl_atomic_exchange
31:   | `AO__opencl_atomic_fetch_add | `AO__opencl_atomic_fetch_and
32:   | `AO__opencl_atomic_fetch_max | `AO__opencl_atomic_fetch_min
33:   | `AO__opencl_atomic_fetch_or | `AO__opencl_atomic_fetch_sub
34:   | `AO__opencl_atomic_fetch_xor | `AO__opencl_atomic_init
35:   | `AO__opencl_atomic_load | `AO__opencl_atomic_store
36:   | `AO__scoped_atomic_add_fetch | `AO__scoped_atomic_and_fetch
37:   | `AO__scoped_atomic_compare_exchange
38:   | `AO__scoped_atomic_compare_exchange_n | `AO__scoped_atomic_exchange
39:   | `AO__scoped_atomic_exchange_n | `AO__scoped_atomic_fetch_add
40:   | `AO__scoped_atomic_fetch_and | `AO__scoped_atomic_fetch_max
41:   | `AO__scoped_atomic_fetch_min | `AO__scoped_atomic_fetch_nand
42:   | `AO__scoped_atomic_fetch_or | `AO__scoped_atomic_fetch_sub
43:   | `AO__scoped_atomic_fetch_xor | `AO__scoped_atomic_load
44:   | `AO__scoped_atomic_load_n | `AO__scoped_atomic_max_fetch
45:   | `AO__scoped_atomic_min_fetch | `AO__scoped_atomic_nand_fetch
46:   | `AO__scoped_atomic_or_fetch | `AO__scoped_atomic_store
47:   | `AO__scoped_atomic_store_n | `AO__scoped_atomic_sub_fetch
48:   | `AO__scoped_atomic_xor_fetch
49: ]
50:
51: type atomic_expr_info = { aei_kind (*atd kind *): atomic_expr_kind }
52:
53: type attribute_kind =
54:     AddressSpaceAttrKind | AllocatingAttrKind | AnnotateTypeAttrKind
55:   | ArmAgnosticAttrKind | ArmInAttrKind | ArmInOutAttrKind
56:   | ArmMveStrictPolymorphismAttrKind | ArmOutAttrKind | ArmPreservesAttrKind
57:   | ArmStreamingAttrKind | ArmStreamingCompatibleAttrKind
58:   | BTFTypeTagAttrKind | BlockingAttrKind | CFIUncheckedCalleeAttrKind
59:   | CmseNSCallAttrKind | ExtVectorTypeAttrKind | HLSLContainedTypeAttrKind
60:   | HLSLGroupSharedAddressSpaceAttrKind | HLSLROVAttrKind
61:   | HLSLRawBufferAttrKind | HLSLResourceClassAttrKind | NoDerefAttrKind
62:   | NonAllocatingAttrKind | NonBlockingAttrKind | ObjCGCAttrKind
63:   | ObjCInertUnsafeUnretainedAttrKind | ObjCKindOfAttrKind
64:   | OpenCLConstantAddressSpaceAttrKind | OpenCLGenericAddressSpaceAttrKind
65:   | OpenCLGlobalAddressSpaceAttrKind | OpenCLGlobalDeviceAddressSpaceAttrKind
66:   | OpenCLGlobalHostAddressSpaceAttrKind | OpenCLLocalAddressSpaceAttrKind
67:   | OpenCLPrivateAddressSpaceAttrKind | PointerAuthAttrKind | Ptr32AttrKind
68:   | Ptr64AttrKind | SPtrAttrKind | TypeNonNullAttrKind
69:   | TypeNullUnspecifiedAttrKind | TypeNullableResultAttrKind | UPtrAttrKind
70:   | WebAssemblyFuncrefAttrKind | AtomicAttrKind | CXXAssumeAttrKind
71:   | CodeAlignAttrKind | FallThroughAttrKind | HLSLControlFlowHintAttrKind
72:   | HLSLLoopHintAttrKind | LikelyAttrKind | MustTailAttrKind
73:   | OpenCLUnrollHintAttrKind | UnlikelyAttrKind | AlwaysInlineAttrKind
74:   | NoInlineAttrKind | NoMergeAttrKind | SuppressAttrKind
75:   | AArch64SVEPcsAttrKind | AArch64VectorPcsAttrKind | AcquireHandleAttrKind
76:   | AnyX86NoCfCheckAttrKind | CDeclAttrKind | CountedByAttrKind
77:   | CountedByOrNullAttrKind | DeviceKernelAttrKind | FastCallAttrKind
78:   | IntelOclBiccAttrKind | LifetimeBoundAttrKind | LifetimeCaptureByAttrKind
79:   | M68kRTDAttrKind | MSABIAttrKind | NSReturnsRetainedAttrKind
80:   | ObjCOwnershipAttrKind | PascalAttrKind | PcsAttrKind
81:   | PreserveAllAttrKind | PreserveMostAttrKind | PreserveNoneAttrKind
82:   | RISCVVLSCCAttrKind | RISCVVectorCCAttrKind | RegCallAttrKind
83:   | SizedByAttrKind | SizedByOrNullAttrKind | StdCallAttrKind
84:   | SwiftAsyncCallAttrKind | SwiftAttrAttrKind | SwiftCallAttrKind
85:   | SysVABIAttrKind | ThisCallAttrKind | TypeNullableAttrKind
86:   | VectorCallAttrKind | AnnotateAttrKind | HLSLParamModifierAttrKind
87:   | SwiftAsyncContextAttrKind | SwiftContextAttrKind
88:   | SwiftErrorResultAttrKind | SwiftIndirectResultAttrKind
89:   | CFConsumedAttrKind | CarriesDependencyAttrKind | NSConsumedAttrKind
90:   | NonNullAttrKind | OSConsumedAttrKind | PassObjectSizeAttrKind
91:   | ReleaseHandleAttrKind | UseHandleAttrKind | HLSLPackOffsetAttrKind
92:   | HLSLSV_DispatchThreadIDAttrKind | HLSLSV_GroupIDAttrKind
93:   | HLSLSV_GroupIndexAttrKind | HLSLSV_GroupThreadIDAttrKind
94:   | HLSLSV_PositionAttrKind | AMDGPUFlatWorkGroupSizeAttrKind
95:   | AMDGPUMaxNumWorkGroupsAttrKind | AMDGPUNumSGPRAttrKind
96:   | AMDGPUNumVGPRAttrKind | AMDGPUWavesPerEUAttrKind | ARMInterruptAttrKind
97:   | ARMInterruptSaveFPAttrKind | ARMSaveFPAttrKind | AVRInterruptAttrKind
98:   | AVRSignalAttrKind | AcquireCapabilityAttrKind | AcquiredAfterAttrKind
99:   | AcquiredBeforeAttrKind | AlignMac68kAttrKind | AlignNaturalAttrKind
100:   | AlignedAttrKind | AllocAlignAttrKind | AllocSizeAttrKind
101:   | AlwaysDestroyAttrKind | AnalyzerNoReturnAttrKind
102:   | AnyX86InterruptAttrKind | AnyX86NoCallerSavedRegistersAttrKind
103:   | ArcWeakrefUnavailableAttrKind | ArgumentWithTypeTagAttrKind
104:   | ArmBuiltinAliasAttrKind | ArmLocallyStreamingAttrKind | ArmNewAttrKind
105:   | ArtificialAttrKind | AsmLabelAttrKind | AssertCapabilityAttrKind
106:   | AssumeAlignedAttrKind | AvailabilityAttrKind
107:   | AvailableOnlyInDefaultEvalMethodAttrKind | BPFFastCallAttrKind
108:   | BPFPreserveAccessIndexAttrKind | BPFPreserveStaticOffsetAttrKind
109:   | BTFDeclTagAttrKind | BlocksAttrKind | BuiltinAttrKind
110:   | C11NoReturnAttrKind | CFAuditedTransferAttrKind | CFGuardAttrKind
111:   | CFICanonicalJumpTableAttrKind | CFReturnsNotRetainedAttrKind
112:   | CFReturnsRetainedAttrKind | CFUnknownTransferAttrKind
113:   | CPUDispatchAttrKind | CPUSpecificAttrKind | CUDAConstantAttrKind
114:   | CUDADeviceAttrKind | CUDADeviceBuiltinSurfaceTypeAttrKind
115:   | CUDADeviceBuiltinTextureTypeAttrKind | CUDAGlobalAttrKind
116:   | CUDAGridConstantAttrKind | CUDAHostAttrKind | CUDAInvalidTargetAttrKind
117:   | CUDALaunchBoundsAttrKind | CUDASharedAttrKind | CXX11NoReturnAttrKind
118:   | CallableWhenAttrKind | CallbackAttrKind | CapabilityAttrKind
119:   | CapturedRecordAttrKind | CleanupAttrKind | ClspvLibclcBuiltinAttrKind
120:   | CmseNSEntryAttrKind | CodeModelAttrKind | CodeSegAttrKind | ColdAttrKind

(Showing lines 1-120 of 2192. Use offset=121 to continue.)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/ClangWrapper.ml"
}
```

**Output:**

```
<path>infer/src/clang/ClangWrapper.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9: module F = Format
10: module L = Logging
11:
12: type action_item =
13:   | CanonicalCommand of ClangCommand.t  (** commands output by [clang -###] *)
14:   | DriverCommand of ClangCommand.t  (** commands prior to [clang -###] treatment *)
15:   | ClangError of string
16:   | ClangWarning of string
17:
18: let status_string_of_action_item = function
19:   | CanonicalCommand _ ->
20:       (* we would very much want to print which file is being captured but we cannot extract the
21:          file name from a [ClangCommand.t] so we cannot do that here; instead, the correct file name
22:          is extracted and send to the progress bar in [Capture] once we start parsing the clang
23:          AST *)
24:       "capturing source file"
25:   | DriverCommand _ ->
26:       "running clang -###"
27:   | ClangError s | ClangWarning s ->
28:       s
29:
30:
31: let check_for_existing_file args =
32:   match (Config.buck_mode, Config.clang_ignore_regex) with
33:   | Some (ClangCompilationDB _), Some clang_ignore_regex ->
34:       let arg_files, args_list = List.partition_tf ~f:(String.is_prefix ~prefix:"@") args in
35:       let read_arg_files args_list arg_file_at =
36:         let file = String.slice arg_file_at 1 (String.length arg_file_at) in
37:         let args_list_file = In_channel.read_lines file in
38:         List.append args_list args_list_file
39:       in
40:       let all_args_ = List.fold_left ~f:read_arg_files ~init:args_list arg_files in
41:       let all_args = List.map ~f:String.strip all_args_ in
42:       let rec check_for_existing_file_arg args =
43:         match args with
44:         | [] ->
45:             ()
46:         | option :: rest ->
47:             if String.equal option "-c" then
48:               (* infer-capture-all flavour of buck produces path to generated file that doesn't exist.
49:                  Create empty file empty file and pass that to clang. This is to enable compilation to continue *)
50:               match List.hd rest with
51:               | Some arg ->
52:                   if Str.string_match clang_ignore_regex arg 0 && not (ISys.file_exists arg) then (
53:                     IUnix.mkdir_p (Filename.dirname arg) ;
54:                     let file = IUnix.openfile ~mode:[O_CREAT; O_RDONLY] arg in
55:                     Unix.close file )
56:               | None ->
57:                   ()
58:             else check_for_existing_file_arg rest
59:       in
60:       check_for_existing_file_arg all_args
61:   | _ ->
62:       ()
63:
64:
65: (** Given a clang command, return a list of new commands to run according to the results of `clang
66:     \-### [args]`. *)
67: let clang_driver_action_items : ClangCommand.t -> action_item list =
68:   let whitespace_regexp = lazy (Str.regexp_string "\" \"") in
69:   let clang_warning_regexp = lazy (Str.regexp "clang[^ :]*: warning: ") in
70:   let commands_or_errors =
71:     (* commands generated by `clang -### ...` start with ' "/absolute/path/to/binary"' *)
72:     Str.regexp " \"/\\|clang[^ :]*: \\(error\\|warning\\): "
73:   in
74:   let ignored_errors =
75:     Str.regexp "clang[^ :]*: \\(error\\|warning\\): unsupported argument .* to option 'fsanitize='"
76:   in
77:   fun cmd ->
78:     let clang_hashhashhash =
79:       Printf.sprintf "%s 2>&1"
80:         ( ClangCommand.prepend_arg "-###" cmd
81:         |>
82:         (* c++ modules are not supported, so let clang know in case it was passed "-fmodules".
83:               Unfortunately we cannot know accurately if "-fmodules" was passed because we don't go
84:               into argument files at this point ("clang -### ..." will do that for us), so we also pass
85:               "-Qunused-arguments" to silence the potential warning that "-fno-cxx-modules" was
86:               ignored. Moreover, "-fno-cxx-modules" is only accepted by the clang driver so we have to
87:               pass it now.
88:
89:               Using clang instead of gcc may trigger warnings about unsupported optimization flags;
90:               passing -Wno-ignored-optimization-argument prevents that.
91:
92:               Clang adds "-faddrsig" by default on ELF targets. This is ok in itself, but for some
93:               reason that flag is the only one to show up *after* the source file name in the -cc1
94:               commands emitted by [clang -### ...]. Passing [-fno-addrsig] ensures that the source
95:               path is always the last argument. *)
96:         ClangCommand.append_args
97:           [ "-fno-cxx-modules"
98:           ; "-Qunused-arguments"
99:           ; "-Wno-ignored-optimization-argument"
100:           ; "-fno-addrsig" ]
101:         |>
102:         (* If -fembed-bitcode is passed, it leads to multiple cc1 commands, which try to read .bc
103:               files that don't get generated, and fail. So pass -fembed-bitcode=off to disable. *)
104:         ClangCommand.append_args ["-fembed-bitcode=off"]
105:         |> ClangCommand.command_to_run )
106:     in
107:     L.(debug Capture Medium) "clang -### invocation: %s@\n" clang_hashhashhash ;
108:     let normalized_commands = ref [] in
109:     let one_line line =
110:       if String.is_prefix ~prefix:" \"" line then
111:         CanonicalCommand
112:           (* massage line to remove edge-cases for splitting *)
113:           ( match
114:               "\"" ^ line ^ " \""
115:               |>
116:               (* split by whitespace *)
117:               Str.split (Lazy.force whitespace_regexp)
118:             with
119:           | prog :: args ->
120:               ClangCommand.mk ~is_driver:false ClangQuotes.EscapedDoubleQuotes ~prog ~args
121:           | [] ->
122:               L.(die InternalError) "ClangWrapper: argv cannot be empty" )
123:       else if Str.string_match (Lazy.force clang_warning_regexp) line 0 then ClangWarning line
124:       else ClangError line
125:     in
126:     let consume_input i =
127:       try
128:         while true do
129:           let line = In_channel.input_line_exn i in
130:           (* keep only commands and errors *)
131:           if
132:             Str.string_match commands_or_errors line 0
133:             && not (Str.string_match ignored_errors line 0)
134:           then normalized_commands := one_line line :: !normalized_commands
135:         done
136:       with End_of_file -> ()
137:     in
138:     (* collect stdout and stderr output together (in reverse order) *)
139:     Utils.with_process_in clang_hashhashhash consume_input |> ignore ;
140:     normalized_commands := List.rev !normalized_commands ;
141:     !normalized_commands
142:
143:
144: (** Given a list of arguments for clang [args], return a list of new commands to run according to
145:     the results of `clang -### [args]` if the command can be analysed. *)
146: let normalize ~prog ~args : action_item list =
147:   let cmd = ClangCommand.mk ~is_driver:true ClangQuotes.SingleQuotes ~prog ~args in
148:   if ClangCommand.may_capture cmd then clang_driver_action_items cmd else [DriverCommand cmd]
149:
150:
151: let exec_action_item ~prog ~args = function
152:   | ClangError error ->
153:       (* An error in the output of `clang -### ...`. Outputs the error and fail. This is because
154:          `clang -###` pretty much never fails, but warns of failures on stderr instead. *)
155:       L.(die UserError)
156:         "Failed to execute compilation command:@\n\
157:          '%s' %a@\n\
158:          @\n\
159:          Error message:@\n\
160:          %s@\n\
161:          @\n\
162:          *** Infer needs a working compilation command to run."
163:         prog Pp.cli_args args error
164:   | ClangWarning warning ->
165:       L.external_warning "%s@\n" warning
166:   | CanonicalCommand clang_cmd ->
167:       Capture.capture clang_cmd
168:   | DriverCommand clang_cmd ->
169:       if
170:         (not Config.skip_non_capture_clang_commands)
171:         || Option.exists Config.buck_mode ~f:BuckMode.is_clang_compilation_db
172:       then Capture.run_clang clang_cmd Utils.echo_in
173:       else
174:         L.debug Capture Quiet "Skipping seemingly uninteresting clang driver command %s@\n"
175:           (ClangCommand.command_to_run clang_cmd)
176:
177:
178: let parallel_threshold = 1
179:
180: let s fmt l = match l with [_] -> () | [] | _ :: _ :: _ -> F.pp_print_char fmt 's'
181:
182: let exec_in_parallel ~prog ~args commands =
183:   L.progress "Starting parallel capture for %d command%a@\n%!" (List.length commands) s commands ;
184:   let tasks () = TaskGenerator.of_list ~finish:TaskGenerator.finish_always_none commands in
185:   ProcessPool.create ~tasks ~jobs:Config.jobs ~child_prologue:ignore ~child_epilogue:ignore
186:     ~f:(fun command ->
187:       !WorkerPoolState.update_status
188:         (Some (Mtime_clock.now ()))
189:         (status_string_of_action_item command) ;
190:       exec_action_item ~prog ~args command ;
191:       None )
192:     ()
193:   |> ProcessPool.run |> ignore
194:
195:
196: let exec_all_commands ~prog ~args commands =
197:   if Int.equal Config.jobs 1 || List.length commands <= parallel_threshold then (
198:     L.debug Capture Medium "Starting sequential capture for %d command%a@\n%!"
199:       (List.length commands) s commands ;
200:     List.iter ~f:(exec_action_item ~prog ~args) commands )
201:   else exec_in_parallel ~prog ~args commands
202:
203:
204: let exe ~prog ~args =
205:   let xx_suffix = match String.is_suffix ~suffix:"++" prog with true -> "++" | false -> "" in
206:   (* use clang in facebook-clang-plugins *)
207:   let clang_xx = CFrontend_config.clang_bin xx_suffix in
208:   check_for_existing_file args ;
209:   let commands = normalize ~prog:clang_xx ~args in
210:   (* xcodebuild projects may require the object files to be generated by the Apple compiler, eg to
211:      generate precompiled headers compatible with Apple's clang. *)
212:   let prog, should_run_original_command =
213:     match Config.fcp_apple_clang with
214:     | Some bin ->
215:         let bin_xx = bin ^ xx_suffix in
216:         L.(debug Capture Medium) "Will run Apple clang %s" bin_xx ;
217:         (bin_xx, true)
218:     | None ->
219:         (clang_xx, false)
220:   in
221:   exec_all_commands ~prog ~args commands ;
222:   if List.is_empty commands || should_run_original_command then (
223:     if List.is_empty commands then
224:       (* No command to execute after -###, let's execute the original command
225:          instead.
226:
227:          In particular, this can happen when
228:          - there are only assembly commands to execute, which we skip, or
229:          - the user tries to run `infer -- clang -c file_that_does_not_exist.c`. In this case, this
230:          will fail with the appropriate error message from clang instead of silently analyzing 0
231:          files. *)
232:       L.(debug Capture Quiet)
233:         "WARNING: `clang -### <args>` returned an empty set of commands to run and no error. Will \
234:          run the original command directly:@\n\
235:         \  %s@\n"
236:         (String.concat ~sep:" " @@ (prog :: args)) ;
237:     Process.create_process_and_wait ~prog ~args () )

(End of file - total 237 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/ClangCommand.ml",
  "offset": 101,
  "limit": 200
}
```

**Output:**

```
<path>infer/src/clang/ClangCommand.ml</path>
<type>file</type>
<content>
101:   lazy
102:     ( match Stdlib.Sys.readdir clang_lib_dir |> Array.to_list with
103:     | [version] ->
104:         let include_dir = clang_lib_dir ^/ version ^/ "include" in
105:         if ISys.file_exists include_dir then Some include_dir
106:         else (
107:           L.external_warning "Clang resource include directory does not exist: %s@\n" include_dir ;
108:           None )
109:     | versions ->
110:         L.external_warning "Expected exactly one version directory in %s, found: [%s]@\n"
111:           clang_lib_dir
112:           (String.concat ~sep:", " versions) ;
113:         None
114:     | exception Sys_error msg ->
115:         L.external_warning "Cannot read clang resource directory %s: %s@\n" clang_lib_dir msg ;
116:         None )
117:
118:
119: (** Filter arguments from [args], looking into argfiles too. [replace_options_arg prev arg] returns
120:     [arg'], where [arg'] is the new version of [arg] given the preceding arguments (in reverse
121:     order) [prev]. *)
122: let filter_and_replace_unsupported_args ?(replace_options_arg = fun _ s -> s) ?(post_args = [])
123:     ?(pre_args = []) args =
124:   (* [prev] is the previously seen argument, [res_rev] is the reversed result, [changed] is true if
125:      some change has been performed *)
126:   let rec aux in_argfiles (prev_is_block_listed_with_arg, res_rev, changed) args =
127:     match args with
128:     | [] ->
129:         (prev_is_block_listed_with_arg, res_rev, changed)
130:     | _ :: tl when prev_is_block_listed_with_arg ->
131:         (* in the unlikely event that a block listed flag with arg sits as the last option in some
132:          arg file, we need to remove its argument now *)
133:         aux in_argfiles (false, res_rev, true) tl
134:     | at_argfile :: tl
135:       when String.is_prefix at_argfile ~prefix:"@" && not (IString.Set.mem at_argfile in_argfiles)
136:       -> (
137:         let in_argfiles' = IString.Set.add at_argfile in_argfiles in
138:         let argfile = String.slice at_argfile 1 (String.length at_argfile) in
139:         match In_channel.read_lines argfile with
140:         | lines ->
141:             (* poor parsing of arguments with some stripping supported; hope that tools generating
142:                argfiles more or less put one argument per line *)
143:             let strip s =
144:               String.strip s
145:               |> Utils.strip_balanced_once ~drop:(function '"' | '\'' -> true | _ -> false)
146:             in
147:             let last_in_file_is_block_listed, rev_res_with_file_args, changed_file =
148:               List.map ~f:strip lines
149:               |> aux in_argfiles' (prev_is_block_listed_with_arg, res_rev, false)
150:             in
151:             if changed_file then
152:               aux in_argfiles' (last_in_file_is_block_listed, rev_res_with_file_args, true) tl
153:             else
154:               (* keep the same argfile if we haven't needed to change anything in it *)
155:               aux in_argfiles' (last_in_file_is_block_listed, at_argfile :: res_rev, changed) tl
156:         | exception e ->
157:             L.external_warning "Error reading argument file '%s': %s@\n" at_argfile
158:               (Exn.to_string e) ;
159:             aux in_argfiles' (false, at_argfile :: res_rev, changed) tl )
160:     | flag :: tl
161:       when List.mem ~equal:String.equal Config.clang_block_listed_flags flag
162:            || String.lsplit2 ~on:'=' flag
163:               |> function
164:               | Some (flag, _arg) ->
165:                   List.mem ~equal:String.equal Config.clang_block_listed_flags_with_arg flag
166:               | None ->
167:                   false ->
168:         aux in_argfiles (false, res_rev, true) tl
169:     | flag :: tl when List.mem ~equal:String.equal Config.clang_block_listed_flags_with_arg flag ->
170:         (* remove the flag and its arg separately in case we are at the end of an argfile *)
171:         aux in_argfiles (true, res_rev, true) tl
172:     | arg :: tl ->
173:         let arg' = replace_options_arg res_rev arg in
174:         aux in_argfiles (false, arg' :: res_rev, changed || not (phys_equal arg arg')) tl
175:   in
176:   match aux IString.Set.empty (false, [], false) args with
177:   | _, res_rev, _ ->
178:       (* return non-reversed list *)
179:       List.append pre_args (List.rev_append res_rev post_args)
180:
181:
182: (** Work around various path or library issues occurring when one tries to substitute Apple's
183:     version of clang with a different version. Also mitigate version discrepancies in clang's fatal
184:     warnings. *)
185: let clang_cc1_cmd_sanitizer cmd =
186:   let replace_args arg = function
187:     | Some override_regex when Str.string_match override_regex arg 0 ->
188:         Lazy.force fcp_clang_resource_include_dir |> Option.value ~default:arg
189:     | _ ->
190:         arg
191:   in
192:   (* command line options not supported by the opensource compiler or the plugins *)
193:   let replace_options_arg options arg =
194:     match (options, arg) with
195:     | [], _ ->
196:         arg
197:     | "-arch" :: _, "armv7k" ->
198:         (* replace armv7k arch with armv7 *) "armv7"
199:     | _, arg when String.is_suffix arg ~suffix:"dep.tmp" ->
200:         (* compilation-database Buck integration produces path to `dep.tmp` file that doesn't exist. Create it *)
201:         IUnix.mkdir_p (Filename.dirname arg) ;
202:         arg
203:     | "-dependency-file" :: _, _
204:       when Option.exists Config.buck_mode ~f:BuckMode.is_clang_compilation_db ->
205:         (* In compilation database mode, dependency files are not assumed to exist *)
206:         "/dev/null"
207:     | "-idirafter" :: _, arg ->
208:         replace_args arg Config.clang_idirafter_to_override_regex
209:     | "-isystem" :: _, arg ->
210:         replace_args arg Config.clang_isystem_to_override_regex
211:     | "-I" :: _, arg -> (
212:       match libcxx_include_to_override_regex with
213:       | Some libcxx_include_to_override_regex
214:         when Str.string_match libcxx_include_to_override_regex arg 0 ->
215:           Config.fcp_dir ^/ "clang" ^/ "install" ^/ "include" ^/ "c++" ^/ "v1"
216:       | _ ->
217:           arg )
218:     | _ ->
219:         arg
220:   in
221:   let explicit_sysroot_passed = has_flag cmd "-isysroot" in
222:   (* supply isysroot only when SDKROOT is not set up and explicit isysroot is not provided,
223:      cf. https://lists.apple.com/archives/xcode-users/2005/Dec/msg00524.html
224:      for details on the effects of setting SDKROOT *)
225:   let implicit_sysroot =
226:     if not explicit_sysroot_passed then
227:       Option.map Config.implicit_sdk_root ~f:(fun x -> ["-isysroot"; x]) |> Option.value ~default:[]
228:     else []
229:   in
230:   let pre_args_rev = [] |> List.rev_append implicit_sysroot in
231:   let post_args_rev =
232:     []
233:     |> List.rev_append ["-include"; Config.lib_dir ^/ "clang_wrappers" ^/ "global_defines.h"]
234:     |>
235:     (* Never error on warnings. Clang is often more strict than Apple's version.  These arguments
236:           are appended at the end to override previous opposite settings.  How it's done: suppress
237:           all the warnings, since there are no warnings, compiler can't elevate them to error
238:           level. *)
239:     argv_cons "-Wno-everything"
240:   in
241:   let clang_arguments =
242:     filter_and_replace_unsupported_args ~replace_options_arg ~post_args:(List.rev post_args_rev)
243:       ~pre_args:(List.rev pre_args_rev) cmd.argv
244:   in
245:   (* When the bundled clang is used as the driver for -### expansion, it discovers its own libc++
246:      headers but may omit the SDK's C++ headers (e.g., cxxabi.h). We cannot simply add the SDK's
247:      c++/v1 directory to the include path because this breaks the #include_next chain for
248:      stdatomic.h: the clang resource dir's stdatomic.h does #include_next and finds the SDK's
249:      c++/v1/stdatomic.h (guarded by _LIBCPP_STDATOMIC_H, already defined), swallowing the C
250:      atomics definitions. Instead, we create a temporary directory containing only the needed
251:      headers (cxxabi.h and __cxxabi_config.h) symlinked from the SDK, avoiding the conflict.
252:      Only for C++ compilations; these headers are not needed for plain C.
253:      Note: -isysroot is typically nested inside @argfiles so we must search them recursively. *)
254:   let clang_arguments =
255:     if cmd.is_driver then
256:       let lang = value_of_argv_option_deep clang_arguments "-x" in
257:       let is_cxx_compilation =
258:         match lang with
259:         | Some l ->
260:             String.is_prefix l ~prefix:"c++" || String.is_suffix l ~suffix:"++"
261:         | None ->
262:             (* No explicit -x flag; check if source file extension implies C++/ObjC++ *)
263:             List.exists clang_arguments ~f:(fun arg ->
264:                 List.exists [".mm"; ".cpp"; ".cc"; ".cxx"; ".c++"; ".C"] ~f:(fun suffix ->
265:                     String.is_suffix arg ~suffix ) )
266:       in
267:       if is_cxx_compilation then
268:         match value_of_argv_option_deep clang_arguments "-isysroot" with
269:         | Some sysroot ->
270:             let sdk_cxx_include = sysroot ^/ "usr" ^/ "include" ^/ "c++" ^/ "v1" in
271:             let cxxabi_h = sdk_cxx_include ^/ "cxxabi.h" in
272:             if ISys.file_exists cxxabi_h then (
273:               let sdk_cxx_include_abs =
274:                 if Filename.is_relative sdk_cxx_include then Unix.getcwd () ^/ sdk_cxx_include
275:                 else sdk_cxx_include
276:               in
277:               let tmp_dir = IFilename.temp_dir "infer_cxxabi" "" in
278:               let symlink src dst =
279:                 let src_path = sdk_cxx_include_abs ^/ src in
280:                 if ISys.file_exists src_path then
281:                   try IUnix.symlink ~target:src_path ~link_name:(tmp_dir ^/ dst) ()
282:                   with Unix.Unix_error _ -> ()
283:               in
284:               symlink "cxxabi.h" "cxxabi.h" ;
285:               symlink "__cxxabi_config.h" "__cxxabi_config.h" ;
286:               clang_arguments @ ["-Xclang"; "-internal-isystem"; "-Xclang"; tmp_dir] )
287:             else clang_arguments
288:         | None ->
289:             clang_arguments
290:       else clang_arguments
291:     else clang_arguments
292:   in
293:   file_arg_cmd_sanitizer {cmd with argv= clang_arguments}
294:
295:
296: let mk ~is_driver quoting_style ~prog ~args =
297:   (* Some arguments break the compiler so they need to be removed even before the normalization step *)
298:   let sanitized_args = filter_and_replace_unsupported_args args in
299:   let sanitized_args =
300:     if is_driver then sanitized_args @ Config.clang_extra_flags else sanitized_args

(Showing lines 101-300 of 362. Use offset=301 to continue.)
</content>
```

---

## Assistant (Explore · Big Pickle · 7.8s)

_Thinking:_

Let me now look at how the plugin args are appended, the Clang_ast_t type for decl, and also look at how cTrans.ml handles instruction translation (the core translation). Let me also see the ATD file for clang_ast to understand the schema generation.

Let me examine the plugin argument setup and explore `cTrans.ml` more deeply (the instruction-level translation):

**Tool: read**

**Input:**

```json
{
  "offset": 301,
  "filePath": "infer/src/clang/ClangCommand.ml"
}
```

**Output:**

```
<path>infer/src/clang/ClangCommand.ml</path>
<type>file</type>
<content>
301:   in
302:   {exec= prog; orig_argv= sanitized_args; argv= sanitized_args; quoting_style; is_driver}
303:
304:
305: let to_unescaped_args cmd =
306:   let mk_exec_argv normalizer =
307:     let {exec; argv} = normalizer cmd in
308:     exec :: argv
309:   in
310:   if can_attach_ast_exporter cmd then mk_exec_argv clang_cc1_cmd_sanitizer
311:   else if String.is_prefix ~prefix:"clang" (Filename.basename cmd.exec) then
312:     (* `clang` supports argument files and the commands can be longer than the maximum length of the
313:        command line, so put arguments in a file *)
314:     mk_exec_argv file_arg_cmd_sanitizer
315:   else (* other commands such as `ld` do not support argument files *)
316:     mk_exec_argv (fun x -> x)
317:
318:
319: let pp f cmd = to_unescaped_args cmd |> Pp.cli_args f
320:
321: let command_to_run cmd =
322:   to_unescaped_args cmd
323:   |> List.map ~f:(ClangQuotes.quote cmd.quoting_style)
324:   |> String.concat ~sep:" "
325:
326:
327: let with_plugin_args args =
328:   let plugin_arg_flag = "-plugin-arg-" ^ plugin_name in
329:   let args_before_rev =
330:     []
331:     |>
332:     (* -cc1 has to be the first argument or clang will think it runs in driver mode *)
333:     argv_cons "-cc1"
334:     |> List.rev_append
335:          [ "-load"
336:          ; Config.clang_plugin_path
337:          ; (* (t7400979) this is a workaround to avoid that clang crashes when the -fmodules flag and the
338:            YojsonASTExporter plugin are used. Since the -plugin argument disables the generation of .o
339:            files, we invoke apple clang again to generate the expected artifacts. This will keep
340:            xcodebuild plus all the sub-steps happy. *)
341:            (if has_flag args "-fmodules" then "-plugin" else "-add-plugin")
342:          ; plugin_name
343:          ; plugin_arg_flag
344:          ; "-"
345:          ; plugin_arg_flag
346:          ; "PREPEND_CURRENT_DIR=1"
347:          ; plugin_arg_flag
348:          ; "MAX_STRING_SIZE=" ^ string_of_int CFrontend_config.biniou_buffer_size ]
349:   in
350:   (* add -O0 option to avoid compiler obfuscation of AST *)
351:   let args_after_rev =
352:     [] |> argv_cons "-O0" |> argv_cons "-fno-builtin"
353:     |> argv_do_if Config.fcp_syntax_only (argv_cons "-fsyntax-only")
354:   in
355:   {args with argv= List.rev_append args_before_rev (args.argv @ List.rev args_after_rev)}
356:
357:
358: let prepend_arg arg clang_args = {clang_args with argv= arg :: clang_args.argv}
359:
360: let append_args args clang_args = {clang_args with argv= clang_args.argv @ args}
361:
362: let get_orig_argv {exec; orig_argv} = exec :: orig_argv

(End of file - total 362 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "offset": 200,
  "filePath": "infer/src/clang/cTrans.ml",
  "limit": 200
}
```

**Output:**

```
<path>infer/src/clang/cTrans.ml</path>
<type>file</type>
<content>
200:         CAst_utils.get_decl_opt_with_decl_ref decl_ref
201:         |> Option.iter ~f:(fun decl ->
202:                F.translate_one_declaration context.translation_unit_context context.tenv context.cfg
203:                  `Translation decl ) )
204:
205:
206:   let create_var_exp_tmp_var trans_state expr_info ~clang_pointer ~var_name =
207:     let context = trans_state.context in
208:     let procdesc = context.CContext.procdesc in
209:     let pvar, typ =
210:       CVar_decl.mk_temp_sil_var_for_expr context ~name:var_name ~clang_pointer expr_info
211:     in
212:     let var_data = ProcAttributes.default_var_data pvar typ in
213:     Procdesc.append_locals procdesc [var_data] ;
214:     (Exp.Lvar pvar, typ)
215:
216:
217:   let get_forwarded_params trans_state sil_loc =
218:     (* forward all parameters of constructor except this *)
219:     let context = trans_state.context in
220:     let pdesc = context.procdesc in
221:     let attr = Procdesc.get_attributes pdesc in
222:     let procname = Procdesc.get_proc_name pdesc in
223:     attr.formals (* remove this, which should always be the first formal parameter *) |> List.tl_exn
224:     |> List.fold_right ~init:([], [])
225:          ~f:(fun (formal, typ, _) (forwarded_params, forwarded_init_exps) ->
226:            let pvar = Pvar.mk formal procname in
227:            let id = Ident.create_fresh Ident.knormal in
228:            ( (Exp.Var id, typ) :: forwarded_params
229:            , Sil.Load {id; e= Exp.Lvar pvar; typ; loc= sil_loc} :: forwarded_init_exps ) )
230:
231:
232:   let create_call_instr trans_state (return_type : Typ.t) function_sil params_sil sil_loc call_flags
233:       ~is_inherited_ctor =
234:     let ret_id_typ = (Ident.create_fresh Ident.knormal, return_type) in
235:     let call_flags =
236:       {call_flags with CallFlags.cf_is_objc_getter_setter= trans_state.is_objc_getter_setter_call}
237:     in
238:     let ret_id', params, initd_exps, ret_exps, call_flags =
239:       (* Assumption: should_add_return_param will return true only for struct types *)
240:       if CType_decl.should_add_return_param return_type then
241:         let param_type = Typ.mk (Typ.Tptr (return_type, Typ.Pk_pointer)) in
242:         let var_exp =
243:           match trans_state.var_exp_typ with
244:           | Some (exp, _) ->
245:               exp
246:           | _ ->
247:               let procdesc = trans_state.context.CContext.procdesc in
248:               let pvar = CVar_decl.mk_temp_sil_var procdesc ~name:"__temp_return_" in
249:               let var_data = ProcAttributes.default_var_data pvar return_type in
250:               Procdesc.append_locals procdesc [var_data] ;
251:               Exp.Lvar pvar
252:         in
253:         (* It is very confusing - same expression has two different types in two contexts:*)
254:         (* 1. if passed as parameter it's RETURN_TYPE* since we are passing it as rvalue *)
255:         (* 2. for return expression it's RETURN_TYPE since backend allows to treat it as lvalue*)
256:         (*    of RETURN_TYPE *)
257:         (* Implications: *)
258:         (* Fields: field_deref_trans relies on it - if exp has RETURN_TYPE then *)
259:         (*         it means that it's not lvalue in clang's AST (it'd be reference otherwise) *)
260:         (* Methods: method_deref_trans actually wants a pointer to the object, which is*)
261:         (*          equivalent of value of ret_param. Since ret_exp has type RETURN_TYPE,*)
262:         (*          we optionally add pointer there to avoid backend confusion. *)
263:         (*          It works either way *)
264:         (* Passing by value: may cause problems - there needs to be extra Sil.Load, but*)
265:         (*                   doing so would create problems with methods. Passing structs by*)
266:         (*                   value doesn't work good anyway. This may need to be revisited later*)
267:         let ret_param = (var_exp, param_type) in
268:         let ret_exp = (var_exp, return_type) in
269:         ( mk_fresh_void_id_typ ()
270:         , params_sil @ [ret_param]
271:         , [var_exp]
272:         , ret_exp
273:         , {call_flags with CallFlags.cf_assign_last_arg= true} )
274:       else
275:         ( ret_id_typ
276:         , params_sil
277:         , []
278:         , (let i, t = ret_id_typ in
279:            (Exp.Var i, t) )
280:         , call_flags )
281:     in
282:     let forwarded_params, forwarded_init_instrs =
283:       if is_inherited_ctor then get_forwarded_params trans_state sil_loc else ([], [])
284:     in
285:     let call_instr =
286:       match function_sil with
287:       | Exp.Var _ ->
288:           let closure_param = (function_sil, Typ.mk (Typ.Tfun None)) in
289:           let builtin =
290:             if call_flags.CallFlags.cf_is_objc_block then BuiltinDecl.__call_objc_block
291:             else BuiltinDecl.__call_c_function_ptr
292:           in
293:           Sil.Call
294:             ( ret_id'
295:             , Exp.Const (Const.Cfun builtin)
296:             , closure_param :: (params @ forwarded_params)
297:             , sil_loc
298:             , call_flags )
299:       | _ ->
300:           Sil.Call (ret_id', function_sil, params @ forwarded_params, sil_loc, call_flags)
301:     in
302:     mk_trans_result ret_exps
303:       {empty_control with instrs= forwarded_init_instrs @ [call_instr]; initd_exps}
304:
305:
306:   (** Given a captured var, return the instruction to assign it to a temp *)
307:   let assign_captured_var loc ({CapturedVar.pvar; typ; capture_mode} as captured) =
308:     match (capture_mode : CapturedVar.capture_mode) with
309:     | ByReference ->
310:         ((Exp.Lvar pvar, captured), None)
311:     | ByValue ->
312:         let id = Ident.create_fresh Ident.knormal in
313:         let instr = Sil.Load {id; e= Exp.Lvar pvar; typ; loc} in
314:         ((Exp.Var id, captured), Some instr)
315:
316:
317:   let closure_trans closure_pname captured_vars context stmt_info expr_info =
318:     let open CContext in
319:     let loc =
320:       CLocation.location_of_stmt_info context.translation_unit_context.source_file stmt_info
321:     in
322:     let qual_type = expr_info.Clang_ast_t.ei_qual_type in
323:     let typ = CType_decl.qual_type_to_sil_type context.tenv qual_type in
324:     let ids_instrs = List.map ~f:(assign_captured_var loc) captured_vars in
325:     let captured_vars, instrs = List.unzip ids_instrs in
326:     let instrs = List.filter_opt instrs in
327:     let closure = Exp.Closure {name= closure_pname; captured_vars} in
328:     mk_trans_result (closure, typ) {empty_control with instrs}
329:
330:
331:   let stringLiteral_trans trans_state expr_info str =
332:     let typ = CType_decl.get_type_from_expr_info expr_info trans_state.context.CContext.tenv in
333:     let exp = Exp.Const (Const.Cstr str) in
334:     mk_trans_result (exp, typ) empty_control
335:
336:
337:   (** FROM CLANG DOCS: "Implements the GNU __null extension, which is a name for a null pointer
338:       constant that has integral type (e.g., int or long) and is the same size and alignment as a
339:       pointer. The __null extension is typically only used by system headers, which define NULL as
340:       __null in C++ rather than using 0 (which is an integer that may not match the size of a
341:       pointer)". So we implement it as the constant zero *)
342:   let gNUNullExpr_trans trans_state expr_info =
343:     let typ = CType_decl.get_type_from_expr_info expr_info trans_state.context.CContext.tenv in
344:     let exp = Exp.Const (Const.Cint IntLit.zero) in
345:     mk_trans_result (exp, typ) empty_control
346:
347:
348:   let nullPtrExpr_trans trans_state expr_info =
349:     let typ = CType_decl.get_type_from_expr_info expr_info trans_state.context.CContext.tenv in
350:     mk_trans_result (Exp.null, typ) empty_control
351:
352:
353:   let objCSelectorExpr_trans trans_state expr_info selector =
354:     stringLiteral_trans trans_state expr_info selector
355:
356:
357:   let objCEncodeExpr_trans trans_state expr_info objc_encode_expr_info =
358:     let type_raw = objc_encode_expr_info.Clang_ast_t.oeei_raw in
359:     stringLiteral_trans trans_state expr_info type_raw
360:
361:
362:   let objCProtocolExpr_trans trans_state expr_info decl_ref =
363:     let name =
364:       match decl_ref.Clang_ast_t.dr_name with Some s -> s.Clang_ast_t.ni_name | _ -> ""
365:     in
366:     stringLiteral_trans trans_state expr_info name
367:
368:
369:   let characterLiteral_trans trans_state expr_info n =
370:     let typ = CType_decl.get_type_from_expr_info expr_info trans_state.context.CContext.tenv in
371:     let exp = Exp.Const (Const.Cint (IntLit.of_int n)) in
372:     mk_trans_result (exp, typ) empty_control
373:
374:
375:   let booleanValue_trans trans_state expr_info b =
376:     characterLiteral_trans trans_state expr_info (if b then 1 else 0)
377:
378:
379:   let floatingLiteral_trans trans_state expr_info float_string =
380:     let typ = CType_decl.get_type_from_expr_info expr_info trans_state.context.CContext.tenv in
381:     let exp = Exp.Const (Const.Cfloat (float_of_string float_string)) in
382:     mk_trans_result (exp, typ) empty_control
383:
384:
385:   (* Note currently we don't have support for different qual type like long, unsigned long, etc. *)
386:   and integerLiteral_trans trans_state expr_info integer_literal_info =
387:     let typ = CType_decl.get_type_from_expr_info expr_info trans_state.context.CContext.tenv in
388:     let exp =
389:       try
390:         let i = IntLit.of_string integer_literal_info.Clang_ast_t.ili_value in
391:         let exp = Exp.int i in
392:         exp
393:       with Failure _ ->
394:         (* Parse error: return a nondeterministic value *)
395:         let id = Ident.create_fresh Ident.knormal in
396:         Exp.Var id
397:     in
398:     mk_trans_result (exp, typ) empty_control
399:

(Showing lines 200-399 of 5555. Use offset=400 to continue.)
</content>
```

**Tool: grep**

**Input:**

```json
{
  "pattern": "instructions_trans",
  "include": "cTrans.ml",
  "path": "infer/src/clang"
}
```

**Output:**

```
Found 1 matches
infer/src/clang/cTrans.ml:
  Line 5520:   let instructions_trans context body extra_instrs exit_node ~is_destructor_wrapper =

```

---

## Assistant (Explore · Big Pickle · 7.6s)

_Thinking:_

Let me now look at the `instructions_trans` function, which is the main entry point for translating statements to SIL nodes. Let me also look at how statement dispatch works and the `dune` file to understand the build order.

Let me look at the main statement translation function and the dune build configuration:

**Tool: read**

**Input:**

```json
{
  "offset": 5520,
  "filePath": "infer/src/clang/cTrans.ml"
}
```

**Output:**

```
<path>infer/src/clang/cTrans.ml</path>
<type>file</type>
<content>
5520:   let instructions_trans context body extra_instrs exit_node ~is_destructor_wrapper =
5521:     let default_trans_state = CTrans_utils.default_trans_state context in
5522:     let trans_state = {default_trans_state with succ_nodes= [exit_node]} in
5523:     let procname = Procdesc.get_proc_name context.CContext.procdesc in
5524:     let is_destructor =
5525:       match procname with
5526:       | Procname.ObjC_Cpp cpp_pname ->
5527:           Procname.ObjC_Cpp.is_destructor cpp_pname
5528:       | _ ->
5529:           false
5530:     in
5531:     let stmt_info, _ = Clang_ast_proj.get_stmt_tuple body in
5532:     let destructor_res, body =
5533:       if is_destructor_wrapper then
5534:         let stmt_info' = {stmt_info with si_pointer= CAst_utils.get_fresh_pointer ()} in
5535:         ( cxx_inject_virtual_base_class_destructors trans_state stmt_info'
5536:           (* destructor wrapper only have calls to virtual base class destructors in its body *)
5537:         , `CompoundStmt (stmt_info', []) )
5538:       else if is_destructor then
5539:         (* Injecting destructor call nodes of fields at the end of the body *)
5540:         (cxx_inject_field_destructors_in_destructor_body trans_state stmt_info, body)
5541:       else (None, body)
5542:     in
5543:     let succ_nodes =
5544:       match destructor_res with
5545:       | Some {control= {root_nodes= _ :: _ as root_nodes}} ->
5546:           root_nodes
5547:       | Some {control= {root_nodes= []}} | None ->
5548:           trans_state.succ_nodes
5549:     in
5550:     let trans_state' = {trans_state with succ_nodes} in
5551:     let instrs = extra_instrs @ [CFrontend_config.ClangStmt (DefineBody, body)] in
5552:     let instrs_trans = List.map ~f:get_custom_stmt_trans instrs in
5553:     let res_control, _ = exec_trans_instrs trans_state' instrs_trans in
5554:     res_control.root_nodes
5555: end

(End of file - total 5555 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/dune"
}
```

**Output:**

```
<path>infer/src/clang/dune</path>
<type>file</type>
<content>
1: (* -*- tuareg -*- *)
2: (*
3:  * Copyright (c) Facebook, Inc. and its affiliates.
4:  *
5:  * This source code is licensed under the MIT license found in the
6:  * LICENSE file in the root directory of this source tree.
7:  *)
8: (* use strings so that it looks like OCaml even before substituting, e.g. to use ocamlformat *)
9:
10: let is_yes = String.equal "yes"
11:
12: let is_empty = String.equal ""
13:
14: let clang = is_yes "yes"
15:
16: let erlang = is_yes "no"
17:
18: let hack = is_yes "no"
19:
20: let java = is_yes "no"
21:
22: let python = is_yes "no"
23:
24: let rust = is_yes "no"
25:
26: let swift = is_yes "no"
27:
28: let swift_llvm = is_yes "no"
29:
30: let facebook = is_yes "no"
31:
32: let windows = is_yes "no"
33:
34: let darwin = String.equal "Linux" "Darwin"
35:
36: let if_platform_env ?(else_ = "") s =
37:   match Sys.getenv_opt "PLATFORM_ENV" with Some pe when String.length pe > 0 -> s | _ -> else_
38:
39:
40: let platform_linking_flags =
41:   if windows then "(:standard -cclib -lgcc_s -cclib -lole32)"
42:   else
43:     if_platform_env
44:       (Printf.sprintf "-noautolink %s %s %s "
45:          ( if swift then
46:              "(:include %{project_root}/src/sledge/llvm-config_ldflags.sexp) \
47:               (:include %{project_root}/src/linking-flags-llvm.sexp) "
48:            else "" )
49:          "(:include %{project_root}/src/linking-flags.sexp)"
50:          "-cclib -Wl,-Bstatic -cclib -lzstd -cclib -Wl,-Bdynamic" )
51:     ~else_:(
52:        if swift && swift_llvm then
53:         "(:include %{project_root}/src/sledge/llvm-config_ldflags.sexp) \
54:         (:include %{project_root}/src/linking-flags-llvm.sexp) \
55:         (:include %{project_root}/src/linking-flags-llvm-swift.sexp) "
56:       else
57:        "") ;;
58:
59: ;;
60: (* -*- tuareg -*- *)
61: (*
62:  * Copyright (c) Facebook, Inc. and its affiliates.
63:  *
64:  * This source code is licensed under the MIT license found in the
65:  * LICENSE file in the root directory of this source tree.
66:  *)
67: (* NOTE: prepend dune.common to this file! *)
68:
69: let clang =
70:   Printf.sprintf
71:     {|(library
72:  (name ClangFrontend)
73:  (public_name infer.ClangFrontend)
74:  (modules %s)
75:  (flags
76:   (:standard
77:      -open Core -open IStdlib -open IStd -open OpenSource -open ATDGenerated
78:      -open IBase -open IR -open Absint -open Checkers -open Backend -open Textuallib))
79:  (libraries oUnit core IStdlib ATDGenerated IBase IR Absint Checkers Backend Textuallib)
80:  (preprocess (pps ppx_compare))
81: )|}
82:     (if clang then ":standard \\ ClangFrontendStubs" else "ClangFrontendStubs")
83:
84:
85: let documentation = "(documentation (package infer) (mld_files ClangFrontend))" ;;
86:
87: Jbuild_plugin.V1.send (String.concat "\n" [clang; documentation])

(End of file - total 87 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cTrans_utils.ml",
  "limit": 100
}
```

**Output:**

```
<path>infer/src/clang/cTrans_utils.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9: module F = Format
10: module Hashtbl = Stdlib.Hashtbl
11:
12: (** Utility methods to support the translation of clang ast constructs into sil instructions. *)
13:
14: module L = Logging
15:
16: (** Extract the element of a singleton list. If the list is not a singleton it crashes. *)
17: let extract_item_from_singleton l pp source_range warning_string =
18:   match l with
19:   | [item] ->
20:       item
21:   | _ ->
22:       L.die InternalError "At %a: List has %d elements, 1 expected:@\n[@[<h>%a@]]@\n%s"
23:         (Pp.of_string ~f:Clang_ast_j.string_of_source_range)
24:         source_range (List.length l) (Pp.semicolon_seq pp) l warning_string
25:
26:
27: let source_range_of_stmt stmt =
28:   let {Clang_ast_t.si_source_range}, _ = Clang_ast_proj.get_stmt_tuple stmt in
29:   si_source_range
30:
31:
32: module Nodes = struct
33:   let prune_kind b if_kind =
34:     Procdesc.Node.Prune_node
35:       (b, if_kind, if b then PruneNodeKind_TrueBranch else PruneNodeKind_FalseBranch)
36:
37:
38:   let is_true_prune_node n =
39:     match Procdesc.Node.get_kind n with Procdesc.Node.Prune_node (true, _, _) -> true | _ -> false
40:
41:
42:   let create_prune_node proc_desc ~branch ~negate_cond e_cond instrs_cond loc if_kind =
43:     let e_cond = if negate_cond then Exp.UnOp (Unop.LNot, e_cond, None) else e_cond in
44:     let instrs_cond' = instrs_cond @ [Sil.Prune (e_cond, loc, branch, if_kind)] in
45:     Procdesc.create_node proc_desc loc (prune_kind branch if_kind) instrs_cond'
46:
47:
48:   (** Check if this binary opertor requires the creation of a node in the cfg. *)
49:   let is_binary_assign_op boi =
50:     match boi.Clang_ast_t.boi_kind with
51:     | `Assign
52:     | `MulAssign
53:     | `DivAssign
54:     | `RemAssign
55:     | `AddAssign
56:     | `SubAssign
57:     | `ShlAssign
58:     | `ShrAssign
59:     | `AndAssign
60:     | `XorAssign
61:     | `OrAssign ->
62:         true
63:     | `PtrMemD
64:     | `PtrMemI
65:     | `Mul
66:     | `Div
67:     | `Rem
68:     | `Add
69:     | `Sub
70:     | `Shl
71:     | `Shr
72:     | `LT
73:     | `GT
74:     | `LE
75:     | `GE
76:     | `EQ
77:     | `NE
78:     | `And
79:     | `Xor
80:     | `Or
81:     | `LAnd
82:     | `LOr
83:     | `Cmp
84:     | `Comma ->
85:         false
86: end
87:
88: module GotoLabel = struct
89:   let find_goto_label context label sil_loc =
90:     try Hashtbl.find context.CContext.label_map label
91:     with Stdlib.Not_found ->
92:       let node_name = Format.sprintf "GotoLabel_%s" label in
93:       let new_node =
94:         Procdesc.create_node context.CContext.procdesc sil_loc (Procdesc.Node.Skip_node node_name)
95:           []
96:       in
97:       Hashtbl.add context.CContext.label_map label new_node ;
98:       new_node
99: end
100:

(Showing lines 1-100 of 822. Use offset=101 to continue.)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/ast_expressions.ml",
  "limit": 100
}
```

**Output:**

```
<path>infer/src/clang/ast_expressions.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: (** This module creates extra ast constructs that are needed for the translation *)
9:
10: open! IStd
11:
12: let create_qual_type ?(quals = Typ.mk_type_quals ()) qt_type_ptr =
13:   { Clang_ast_t.qt_type_ptr
14:   ; qt_is_const= Typ.is_const quals
15:   ; qt_is_volatile= Typ.is_volatile quals
16:   ; qt_is_restrict= Typ.is_restrict quals }
17:
18:
19: let builtin_to_qual_type kind = create_qual_type (Clang_ast_extend.Builtin kind)
20:
21: let create_pointer_qual_type ?quals typ = create_qual_type ?quals (Clang_ast_extend.PointerOf typ)
22:
23: let create_reference_qual_type ?quals typ =
24:   create_qual_type ?quals (Clang_ast_extend.ReferenceOf typ)
25:
26:
27: let create_int_type = builtin_to_qual_type `Int
28:
29: let create_void_type = builtin_to_qual_type `Void
30:
31: let create_void_star_type = create_pointer_qual_type create_void_type
32:
33: let create_id_type = create_pointer_qual_type (builtin_to_qual_type `ObjCId)
34:
35: let create_char_type = builtin_to_qual_type `Char_S
36:
37: let create_char_star_type ?quals () = create_pointer_qual_type ?quals create_char_type
38:
39: let create_class_qual_type ?quals typename =
40:   create_qual_type ?quals (Clang_ast_extend.ClassType typename)
41:
42:
43: let create_class_pointer_qual_type ?quals typename =
44:   create_pointer_qual_type ?quals (create_class_qual_type ?quals typename)
45:
46:
47: let create_decl_info stmt_info pointer =
48:   { Clang_ast_t.di_pointer= pointer
49:   ; di_parent_pointer= None
50:   ; di_source_range= stmt_info.Clang_ast_t.si_source_range
51:   ; di_owning_module= None
52:   ; di_is_hidden= false
53:   ; di_is_implicit= false
54:   ; di_is_used= true
55:   ; di_is_this_declaration_referenced= true
56:   ; di_is_invalid_decl= false
57:   ; di_attributes= []
58:   ; di_full_comment= None
59:   ; di_access= `None }
60:
61:
62: let default_var_decl_info =
63:   { Clang_ast_t.vdi_is_global= false
64:   ; vdi_is_extern= false
65:   ; vdi_is_static= false
66:   ; vdi_is_static_local= false
67:   ; vdi_is_static_data_member= false
68:   ; vdi_is_constexpr= false
69:   ; vdi_is_init_ice= false
70:   ; vdi_init_expr= None
71:   ; vdi_is_init_expr_cxx11_constant= false
72:   ; vdi_parm_index_in_function= None }
73:
74:
75: let create_named_decl_info name = {Clang_ast_t.ni_name= name; ni_qual_name= [name]}
76:
77: let create_decl_ref pointer ni qual_type =
78:   { Clang_ast_t.dr_kind= `Var
79:   ; dr_decl_pointer= pointer
80:   ; dr_name= Some ni
81:   ; dr_is_hidden= false
82:   ; dr_qual_type= Some qual_type }
83:
84:
85: let create_decl_ref_expr stmt_info pointer ni qual_type =
86:   let open Clang_ast_t in
87:   `DeclRefExpr
88:     ( stmt_info
89:     , []
90:     , {ei_qual_type= qual_type; ei_value_kind= `LValue; ei_object_kind= `Ordinary}
91:     , {drti_decl_ref= Some (create_decl_ref pointer ni qual_type)} )
92:
93:
94: let create_integer_literal n =
95:   let stmt_info = CAst_utils.dummy_stmt_info () in
96:   let expr_info =
97:     {Clang_ast_t.ei_qual_type= create_int_type; ei_value_kind= `RValue; ei_object_kind= `Ordinary}
98:   in
99:   let integer_literal_info = {Clang_ast_t.ili_is_signed= true; ili_bitwidth= 32; ili_value= n} in
100:   `IntegerLiteral (stmt_info, [], expr_info, integer_literal_info)

(Showing lines 1-100 of 167. Use offset=101 to continue.)
</content>
```

---

## Assistant (Explore · Big Pickle · 11.5s)

_Thinking:_

Now let me look at the `get_custom_stmt_trans` function and the statement dispatch mechanism in cTrans.ml, which is the core of the statement-to-SIL translation. Let me also look at the PriorityNode module and how control flow nodes are created.

Let me look at the key dispatch function `get_custom_stmt_trans` and the `exec_trans_instrs` function:

**Tool: grep**

**Input:**

```json
{
  "include": "cTrans.ml",
  "pattern": "get_custom_stmt_trans",
  "path": "infer/src/clang"
}
```

**Output:**

```
Found 2 matches
infer/src/clang/cTrans.ml:
  Line 5500:   and get_custom_stmt_trans stmt trans_state =

  Line 5552:     let instrs_trans = List.map ~f:get_custom_stmt_trans instrs in

```

**Tool: grep**

**Input:**

```json
{
  "include": "cTrans.ml",
  "pattern": "exec_trans_instrs",
  "path": "infer/src/clang"
}
```

**Output:**

```
Found 6 matches
infer/src/clang/cTrans.ml:
  Line 5461:   and exec_trans_instrs trans_state trans_stmt_fun_list : control * (Exp.t * Typ.t) list =

  Line 5462:     let rec exec_trans_instrs_rev trans_state rev_trans_fun_list =

  Line 5476:             exec_trans_instrs_rev {trans_state' with var_exp_typ= None} trans_stmt_fun_list'

  Line 5491:       exec_trans_instrs_rev trans_state (List.rev trans_stmt_fun_list)

  Line 5511:     exec_trans_instrs trans_state stmt_trans_fun

  Line 5553:     let res_control, _ = exec_trans_instrs trans_state' instrs_trans in

```

**Tool: grep**

**Input:**

```json
{
  "include": "cTrans.ml",
  "pattern": "stmt_trans",
  "path": "infer/src/clang"
}
```

**Output:**

```
Found 6 matches
infer/src/clang/cTrans.ml:
  Line 5496:   and get_clang_stmt_trans node_name stmt trans_state =

  Line 5500:   and get_custom_stmt_trans stmt trans_state =

  Line 5503:         get_clang_stmt_trans node_name stmt trans_state

  Line 5510:     let stmt_trans_fun = List.map ~f:(get_clang_stmt_trans node_name) stmt_list in

  Line 5511:     exec_trans_instrs trans_state stmt_trans_fun

  Line 5552:     let instrs_trans = List.map ~f:get_custom_stmt_trans instrs in

```

---

## Assistant (Explore · Big Pickle · 10.1s)

_Thinking:_

Let me read the key dispatch and instruction execution parts of cTrans.ml.

**Tool: read**

**Input:**

```json
{
  "offset": 5460,
  "filePath": "infer/src/clang/cTrans.ml"
}
```

**Output:**

```
<path>infer/src/clang/cTrans.ml</path>
<type>file</type>
<content>
5460:   (** Given a translation state and list of translation functions it executes translation *)
5461:   and exec_trans_instrs trans_state trans_stmt_fun_list : control * (Exp.t * Typ.t) list =
5462:     let rec exec_trans_instrs_rev trans_state rev_trans_fun_list =
5463:       match rev_trans_fun_list with
5464:       | [] ->
5465:           ({empty_control with root_nodes= trans_state.succ_nodes}, [])
5466:       | trans_stmt_fun :: trans_stmt_fun_list' ->
5467:           let res_trans_s = trans_stmt_fun trans_state in
5468:           let trans_state' =
5469:             if not (List.is_empty res_trans_s.control.root_nodes) then
5470:               {trans_state with succ_nodes= res_trans_s.control.root_nodes}
5471:             else trans_state
5472:           in
5473:           let control_tail_rev, returns_tail_rev =
5474:             (* Note: for assignment, we should keep only the value of the last instruction.
5475:                This is handled above, and for all other instructions we must discard the value. *)
5476:             exec_trans_instrs_rev {trans_state' with var_exp_typ= None} trans_stmt_fun_list'
5477:           in
5478:           ( { root_nodes= control_tail_rev.root_nodes
5479:             ; leaf_nodes=
5480:                 ( if not (List.is_empty res_trans_s.control.leaf_nodes) then
5481:                     res_trans_s.control.leaf_nodes
5482:                   else control_tail_rev.leaf_nodes )
5483:             ; instrs= List.rev_append res_trans_s.control.instrs control_tail_rev.instrs
5484:             ; initd_exps= List.rev_append res_trans_s.control.initd_exps control_tail_rev.initd_exps
5485:             ; cxx_temporary_markers_set=
5486:                 List.rev_append res_trans_s.control.cxx_temporary_markers_set
5487:                   control_tail_rev.cxx_temporary_markers_set }
5488:           , res_trans_s.return :: returns_tail_rev )
5489:     in
5490:     let rev_control, rev_returns =
5491:       exec_trans_instrs_rev trans_state (List.rev trans_stmt_fun_list)
5492:     in
5493:     ({rev_control with instrs= List.rev rev_control.instrs}, List.rev rev_returns)
5494:
5495:
5496:   and get_clang_stmt_trans node_name stmt trans_state =
5497:     exec_with_node_creation ~f:instruction node_name trans_state stmt
5498:
5499:
5500:   and get_custom_stmt_trans stmt trans_state =
5501:     match (stmt : CFrontend_config.instr_type) with
5502:     | ClangStmt (node_name, stmt) ->
5503:         get_clang_stmt_trans node_name stmt trans_state
5504:     | CXXConstructorInit instr ->
5505:         cxx_constructor_init_trans instr trans_state
5506:
5507:
5508:   (** Given a translation state, this function translates a list of clang statements. *)
5509:   and instructions node_name trans_state stmt_list =
5510:     let stmt_trans_fun = List.map ~f:(get_clang_stmt_trans node_name) stmt_list in
5511:     exec_trans_instrs trans_state stmt_trans_fun
5512:
5513:
5514:   and expression_trans context stmt =
5515:     let trans_state = CTrans_utils.default_trans_state context in
5516:     let res_trans_stmt = instruction trans_state stmt in
5517:     fst res_trans_stmt.return
5518:
5519:
5520:   let instructions_trans context body extra_instrs exit_node ~is_destructor_wrapper =
5521:     let default_trans_state = CTrans_utils.default_trans_state context in
5522:     let trans_state = {default_trans_state with succ_nodes= [exit_node]} in
5523:     let procname = Procdesc.get_proc_name context.CContext.procdesc in
5524:     let is_destructor =
5525:       match procname with
5526:       | Procname.ObjC_Cpp cpp_pname ->
5527:           Procname.ObjC_Cpp.is_destructor cpp_pname
5528:       | _ ->
5529:           false
5530:     in
5531:     let stmt_info, _ = Clang_ast_proj.get_stmt_tuple body in
5532:     let destructor_res, body =
5533:       if is_destructor_wrapper then
5534:         let stmt_info' = {stmt_info with si_pointer= CAst_utils.get_fresh_pointer ()} in
5535:         ( cxx_inject_virtual_base_class_destructors trans_state stmt_info'
5536:           (* destructor wrapper only have calls to virtual base class destructors in its body *)
5537:         , `CompoundStmt (stmt_info', []) )
5538:       else if is_destructor then
5539:         (* Injecting destructor call nodes of fields at the end of the body *)
5540:         (cxx_inject_field_destructors_in_destructor_body trans_state stmt_info, body)
5541:       else (None, body)
5542:     in
5543:     let succ_nodes =
5544:       match destructor_res with
5545:       | Some {control= {root_nodes= _ :: _ as root_nodes}} ->
5546:           root_nodes
5547:       | Some {control= {root_nodes= []}} | None ->
5548:           trans_state.succ_nodes
5549:     in
5550:     let trans_state' = {trans_state with succ_nodes} in
5551:     let instrs = extra_instrs @ [CFrontend_config.ClangStmt (DefineBody, body)] in
5552:     let instrs_trans = List.map ~f:get_custom_stmt_trans instrs in
5553:     let res_control, _ = exec_trans_instrs trans_state' instrs_trans in
5554:     res_control.root_nodes
5555: end

(End of file - total 5555 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "offset": 5493,
  "filePath": "infer/src/clang/cTrans.ml",
  "limit": 30
}
```

**Output:**

```
<path>infer/src/clang/cTrans.ml</path>
<type>file</type>
<content>
5493:     ({rev_control with instrs= List.rev rev_control.instrs}, List.rev rev_returns)
5494:
5495:
5496:   and get_clang_stmt_trans node_name stmt trans_state =
5497:     exec_with_node_creation ~f:instruction node_name trans_state stmt
5498:
5499:
5500:   and get_custom_stmt_trans stmt trans_state =
5501:     match (stmt : CFrontend_config.instr_type) with
5502:     | ClangStmt (node_name, stmt) ->
5503:         get_clang_stmt_trans node_name stmt trans_state
5504:     | CXXConstructorInit instr ->
5505:         cxx_constructor_init_trans instr trans_state
5506:
5507:
5508:   (** Given a translation state, this function translates a list of clang statements. *)
5509:   and instructions node_name trans_state stmt_list =
5510:     let stmt_trans_fun = List.map ~f:(get_clang_stmt_trans node_name) stmt_list in
5511:     exec_trans_instrs trans_state stmt_trans_fun
5512:
5513:
5514:   and expression_trans context stmt =
5515:     let trans_state = CTrans_utils.default_trans_state context in
5516:     let res_trans_stmt = instruction trans_state stmt in
5517:     fst res_trans_stmt.return
5518:
5519:
5520:   let instructions_trans context body extra_instrs exit_node ~is_destructor_wrapper =
5521:     let default_trans_state = CTrans_utils.default_trans_state context in
5522:     let trans_state = {default_trans_state with succ_nodes= [exit_node]} in

(Showing lines 5493-5522 of 5555. Use offset=5523 to continue.)
</content>
```

**Tool: read**

**Input:**

```json
{
  "offset": 400,
  "filePath": "infer/src/clang/cTrans.ml",
  "limit": 100
}
```

**Output:**

```
<path>infer/src/clang/cTrans.ml</path>
<type>file</type>
<content>
400:
401:   let cxxScalarValueInitExpr_trans trans_state expr_info =
402:     let typ = CType_decl.get_type_from_expr_info expr_info trans_state.context.CContext.tenv in
403:     (* constant will be different depending on type *)
404:     let zero = Exp.zero_of_type typ |> Option.value ~default:Exp.zero in
405:     mk_trans_result (zero, typ) empty_control
406:
407:
408:   let no_op_trans succ_nodes =
409:     mk_trans_result (mk_fresh_void_exp_typ ()) {empty_control with root_nodes= succ_nodes}
410:
411:
412:   (* The stmt seems to be always empty *)
413:   let unaryExprOrTypeTraitExpr_trans trans_state unary_expr_or_type_trait_expr_info =
414:     let tenv = trans_state.context.CContext.tenv in
415:     let typ =
416:       CType_decl.qual_type_to_sil_type tenv
417:         unary_expr_or_type_trait_expr_info.Clang_ast_t.uttei_qual_type
418:     in
419:     match unary_expr_or_type_trait_expr_info.Clang_ast_t.uttei_kind with
420:     | (`SizeOf | `SizeOfWithSize _) as size ->
421:         let nbytes = match size with `SizeOfWithSize nbytes -> Some nbytes | _ -> None in
422:         let sizeof_data =
423:           {Exp.typ; nbytes; dynamic_length= None; subtype= Subtype.exact; nullable= false}
424:         in
425:         mk_trans_result (Exp.Sizeof sizeof_data, typ) empty_control
426:     | `AlignOf | `OpenMPRequiredSimdAlign | `PreferredAlignOf | `VecStep | `VectorElements ->
427:         let nondet = (Exp.Var (Ident.create_fresh Ident.knormal), typ) in
428:         mk_trans_result nondet empty_control
429:
430:
431:   (* search the label into the hashtbl - create a fake node eventually *)
432:   (* connect that node with this stmt *)
433:   let gotoStmt_trans trans_state stmt_info label_name =
434:     let sil_loc =
435:       CLocation.location_of_stmt_info trans_state.context.translation_unit_context.source_file
436:         stmt_info
437:     in
438:     let root_node' = GotoLabel.find_goto_label trans_state.context label_name sil_loc in
439:     mk_trans_result (mk_fresh_void_exp_typ ())
440:       {empty_control with root_nodes= [root_node']; leaf_nodes= trans_state.succ_nodes}
441:
442:
443:   let get_builtin_pname_opt trans_unit_ctx qual_name decl_opt =
444:     let get_annotate_attr_arg decl =
445:       let open Clang_ast_t in
446:       let decl_info = Clang_ast_proj.get_decl_tuple decl in
447:       let get_attr_opt = function `AnnotateAttr (_, annotation) -> Some annotation | _ -> None in
448:       List.find_map ~f:get_attr_opt decl_info.di_attributes
449:     in
450:     let name = QualifiedCppName.to_qual_string qual_name in
451:     let function_attr_opt = Option.bind decl_opt ~f:get_annotate_attr_arg in
452:     match function_attr_opt with
453:     | Some attr when CTrans_models.is_modeled_attribute attr ->
454:         Some (Procname.from_string_c_fun attr)
455:     | _ when CTrans_models.is_modeled_builtin name ->
456:         Some (Procname.from_string_c_fun (CFrontend_config.infer ^ name))
457:     | _
458:       when String.equal name CFrontend_config.malloc
459:            && CGeneral_utils.is_objc_extension trans_unit_ctx ->
460:         Some BuiltinDecl.malloc_no_fail
461:     | _ ->
462:         None
463:
464:
465:   let function_deref_trans trans_state decl_ref =
466:     let open CContext in
467:     let context = trans_state.context in
468:     let name_info, decl_ptr, qual_type = CAst_utils.get_info_from_decl_ref decl_ref in
469:     let decl_opt = CAst_utils.get_function_decl_with_body decl_ptr in
470:     Option.iter ~f:(call_translation context) decl_opt ;
471:     let qual_name = CAst_utils.get_qualified_name name_info in
472:     let typ = CType_decl.qual_type_to_sil_type context.tenv qual_type in
473:     let pname =
474:       match get_builtin_pname_opt context.translation_unit_context qual_name decl_opt with
475:       | Some builtin_pname ->
476:           builtin_pname
477:       | None ->
478:           let name = QualifiedCppName.to_qual_string qual_name in
479:           CMethod_trans.create_procdesc_with_pointer context decl_ptr None name
480:     in
481:     let callee_ms_opt = CMethod_trans.method_signature_of_pointer context.tenv decl_ptr in
482:     mk_trans_result
483:       (Exp.Const (Const.Cfun pname), typ)
484:       ?method_signature:callee_ms_opt empty_control
485:
486:
487:   let field_deref_trans trans_state ?(is_implicit_self = false) stmt_info pre_trans_result decl_ref
488:       ~is_constructor_init ~is_member_of_const =
489:     let open CContext in
490:     let context = trans_state.context in
491:     let sil_loc =
492:       CLocation.location_of_stmt_info context.translation_unit_context.source_file stmt_info
493:     in
494:     let name_info, decl_ptr, qual_type = CAst_utils.get_info_from_decl_ref decl_ref in
495:     let field_string = name_info.Clang_ast_t.ni_name in
496:     L.debug Capture Verbose "Translating field '%s'@\n" field_string ;
497:     let field_typ = CType_decl.qual_type_to_sil_type context.tenv qual_type in
498:     (* If the object is const, field member will also be const *)
499:     let field_typ = if is_member_of_const then Typ.set_to_const field_typ else field_typ in

(Showing lines 400-499 of 5555. Use offset=500 to continue.)
</content>
```

---

## Assistant (Explore · Big Pickle · 8.3s)

_Thinking:_

Now let me look at the `instruction` function to see the main dispatch:

Let me find the main `instruction` dispatch function:

**Tool: grep**

**Input:**

```json
{
  "include": "cTrans.ml",
  "pattern": "^  and instruction",
  "path": "infer/src/clang"
}
```

**Output:**

```
Found 6 matches
infer/src/clang/cTrans.ml:
  Line 4844:   and instruction trans_state instr = instruction_log trans_state instr

  Line 4848:   and instruction_log =

  Line 4909:   and instruction_scope trans_state stmt =

  Line 4944:   and instruction_insert_cxx_temporary_markers trans_state stmt =

  Line 4986:   and instruction_translate trans_state (instr : Clang_ast_t.stmt) =

  Line 5509:   and instructions node_name trans_state stmt_list =

```

---

## Assistant (Explore · Big Pickle · 5.2s)

_Thinking:_

Let me read the main instruction dispatch.

**Tool: read**

**Input:**

```json
{
  "offset": 4844,
  "filePath": "infer/src/clang/cTrans.ml",
  "limit": 200
}
```

**Output:**

```
<path>infer/src/clang/cTrans.ml</path>
<type>file</type>
<content>
4844:   and instruction trans_state instr = instruction_log trans_state instr
4845:
4846:   (** Translates a clang instruction into SIL instructions. It takes a a [trans_state] containing
4847:       current info on the translation and it returns a [trans_result].*)
4848:   and instruction_log =
4849:     (* log errors only at the innermost recursive call *)
4850:     let logged_error = ref false in
4851:     fun trans_state instr ->
4852:       let pp_pointer f instr =
4853:         let {Clang_ast_t.si_pointer}, _ = Clang_ast_proj.get_stmt_tuple instr in
4854:         Format.pp_print_int f si_pointer
4855:       in
4856:       L.debug Capture Verbose
4857:         "Translating statement '%a' (pointer= '%a')@\n@[<hv2>  trans_state=%a@\n"
4858:         (Pp.of_string ~f:Clang_ast_proj.get_stmt_kind_string)
4859:         instr pp_pointer instr pp_trans_state trans_state ;
4860:       let trans_result =
4861:         try instruction_scope trans_state instr
4862:         with e ->
4863:           IExn.reraise_after e ~f:(fun () ->
4864:               let should_log_error = not !logged_error in
4865:               if should_log_error then (
4866:                 (* prevent from displaying the same issue multiple times as we climb up the call
4867:                    stack *)
4868:                 logged_error := true ;
4869:                 let {Clang_ast_t.si_source_range}, _ = Clang_ast_proj.get_stmt_tuple instr in
4870:                 let source_file =
4871:                   trans_state.context.CContext.translation_unit_context.CFrontend_config.source_file
4872:                 in
4873:                 let loc_start =
4874:                   CLocation.location_of_source_range ~pick_location:`Start source_file
4875:                     si_source_range
4876:                 in
4877:                 let loc_end =
4878:                   CLocation.location_of_source_range ~pick_location:`End source_file si_source_range
4879:                 in
4880:                 (* Unfortunately this triggers regularly so do not show the message on the console
4881:                    unless asked to do so or if the error will crash the frontend. *)
4882:                 let should_display_error =
4883:                   Config.debug_level_capture >= 1
4884:                   ||
4885:                   match e with
4886:                   | CFrontend_errors.Unimplemented _ | CFrontend_errors.IncorrectAssumption _ ->
4887:                       (* these are caught by default, do not print messages unless asked to do so *)
4888:                       false
4889:                   | _ ->
4890:                       (* we are going to crash, print message for more context *)
4891:                       true
4892:                 in
4893:                 (if should_display_error then L.internal_error else L.debug Capture Quiet)
4894:                   "%a: ERROR translating statement '%a'@\n" Location.pp_range (loc_start, loc_end)
4895:                   (Pp.of_string ~f:Clang_ast_proj.get_stmt_kind_string)
4896:                   instr ) )
4897:       in
4898:       L.debug Capture Verbose
4899:         "@]@\nResult of translating statement '%a' (pointer= '%a')@\ncontrol=%a@\n"
4900:         (Pp.of_string ~f:Clang_ast_proj.get_stmt_kind_string)
4901:         instr pp_pointer instr pp_control trans_result.control ;
4902:       (* don't forget to reset this so we output messages for future errors too *)
4903:       logged_error := false ;
4904:       trans_result
4905:
4906:
4907:   (** inject destructors at the end of the translation of the statement if the context map says
4908:       there are variables to destruct *)
4909:   and instruction_scope trans_state stmt =
4910:     let stmt_info, _ = Clang_ast_proj.get_stmt_tuple stmt in
4911:     let destr_trans_result =
4912:       (* Statements that break control flow will inject appropriate destructor calls themselves and
4913:          trying to insert them again here would be wasteful and produce nodes that are "unconnected"
4914:          (without a predecessor in the CFG) since the inner statement translation will, well.. break
4915:          control flow. *)
4916:       if CScope.breaks_control_flow stmt then (
4917:         L.debug Capture Verbose "break of control flow detected, skipping destructor injection@\n" ;
4918:         None )
4919:       else inject_destructors Procdesc.Node.DestrScope trans_state stmt_info
4920:     in
4921:     (* adjust successors of the translation of [stmt] to point at the injected destructors *)
4922:     let trans_state =
4923:       match destr_trans_result with
4924:       | Some {control= {root_nodes= []}} | None ->
4925:           trans_state
4926:       | Some {control= {root_nodes}} ->
4927:           {trans_state with succ_nodes= root_nodes}
4928:     in
4929:     let stmt_result = instruction_insert_cxx_temporary_markers trans_state stmt in
4930:     match destr_trans_result with
4931:     | None | Some {control= {leaf_nodes= []}} ->
4932:         stmt_result
4933:     | Some {control= {leaf_nodes}} ->
4934:         {stmt_result with control= {stmt_result.control with leaf_nodes}}
4935:
4936:
4937:   (** Instrument program to know when C++ temporaries created conditionally have indeed been created
4938:       and need to be destroyed. This is a common compilation scheme for temporary variables created
4939:       conditionally in expressions, due to either [a?b:c] or short-circuiting of [&&] or [||].
4940:
4941:       Similarly to [exprWithCleanups_trans], only act on the C++ temporaries that we ended up using
4942:       in the translation of the sub-expression. Here the fact we only take variables initialized by
4943:       the sub-expression ensures that this is always the case. *)
4944:   and instruction_insert_cxx_temporary_markers trans_state stmt =
4945:     let stmt_result = instruction_translate trans_state stmt in
4946:     let stmt_info, _ = Clang_ast_proj.get_stmt_tuple stmt in
4947:     let loc =
4948:       CLocation.location_of_stmt_info trans_state.context.translation_unit_context.source_file
4949:         stmt_info
4950:     in
4951:     let instrs, cxx_temporary_markers_set =
4952:       List.fold stmt_result.control.initd_exps
4953:         ~init:([], stmt_result.control.cxx_temporary_markers_set)
4954:         ~f:(fun ((instrs, markers_set) as acc) initd_exp ->
4955:           match initd_exp with
4956:           | Exp.Lvar initd_pvar -> (
4957:             match
4958:               Pvar.Map.find_opt initd_pvar trans_state.context.temporaries_constructor_markers
4959:             with
4960:             | Some (marker_var, _)
4961:               when not
4962:                      (List.mem ~equal:Pvar.equal stmt_result.control.cxx_temporary_markers_set
4963:                         marker_var ) ->
4964:                 (* to avoid adding the marker-setting instruction for every super-expression of the
4965:                    current one, add it to the list of marker variables set and do not create the
4966:                    instruction if it's already in that list *)
4967:                 let store_marker =
4968:                   Sil.Store {e1= Lvar marker_var; typ= StdTyp.boolean; e2= Exp.one; loc}
4969:                 in
4970:                 (store_marker :: instrs, marker_var :: markers_set)
4971:             | _ ->
4972:                 acc )
4973:           | _ ->
4974:               acc )
4975:     in
4976:     if List.is_empty instrs then stmt_result
4977:     else
4978:       let control =
4979:         PriorityNode.compute_controls_to_parent trans_state loc CXXTemporaryMarkerSet stmt_info
4980:           [stmt_result.control; {empty_control with instrs}]
4981:       in
4982:       let control = {control with cxx_temporary_markers_set} in
4983:       {stmt_result with control}
4984:
4985:
4986:   and instruction_translate trans_state (instr : Clang_ast_t.stmt) =
4987:     match instr with
4988:     | `GotoStmt (stmt_info, _, {Clang_ast_t.gsi_label= label_name; _}) ->
4989:         gotoStmt_trans trans_state stmt_info label_name
4990:     | `LabelStmt (stmt_info, stmt_list, label_name) ->
4991:         labelStmt_trans trans_state stmt_info stmt_list label_name
4992:     | `ArraySubscriptExpr (_, stmt_list, expr_info) ->
4993:         arraySubscriptExpr_trans trans_state expr_info stmt_list
4994:     | `BinaryOperator (stmt_info, stmt_list, expr_info, binop_info) ->
4995:         binaryOperator_trans_with_cond trans_state stmt_info stmt_list expr_info binop_info
4996:     | `AtomicExpr (stmt_info, stmt_list, expr_info, atomic_info) ->
4997:         atomicExpr_trans trans_state atomic_info stmt_info expr_info stmt_list
4998:     | `CallExpr (stmt_info, stmt_list, ei) | `UserDefinedLiteral (stmt_info, stmt_list, ei) ->
4999:         callExpr_trans trans_state stmt_info stmt_list ei
5000:     | `ConstantExpr (_, stmt_list, _) -> (
5001:       match stmt_list with
5002:       | [stmt] ->
5003:           instruction_translate trans_state stmt
5004:       | stmts ->
5005:           L.die InternalError "Expected exactly one statement in ConstantExpr, got %d"
5006:             (List.length stmts) )
5007:     | `CXXMemberCallExpr (stmt_info, stmt_list, ei) ->
5008:         cxxMemberCallExpr_trans trans_state stmt_info stmt_list ei
5009:     | `CXXOperatorCallExpr (stmt_info, stmt_list, ei) ->
5010:         callExpr_trans trans_state stmt_info stmt_list ei
5011:     | `CXXConstructExpr (stmt_info, stmt_list, expr_info, cxx_constr_info)
5012:     | `CXXTemporaryObjectExpr (stmt_info, stmt_list, expr_info, cxx_constr_info) ->
5013:         cxxConstructExpr_trans trans_state stmt_info stmt_list expr_info cxx_constr_info
5014:           ~is_inherited_ctor:false
5015:     | `CXXInheritedCtorInitExpr (stmt_info, stmt_list, expr_info, cxx_construct_inherited_expr_info)
5016:       ->
5017:         cxxConstructExpr_trans trans_state stmt_info stmt_list expr_info
5018:           cxx_construct_inherited_expr_info ~is_inherited_ctor:true
5019:     | `ObjCMessageExpr (stmt_info, stmt_list, expr_info, obj_c_message_expr_info) ->
5020:         objCMessageExpr_trans trans_state stmt_info obj_c_message_expr_info stmt_list expr_info
5021:     | `CompoundStmt (_, stmt_list) ->
5022:         (* No node for this statement. We just collect its statement list*)
5023:         compoundStmt_trans trans_state stmt_list
5024:     | `ConditionalOperator (stmt_info, stmt_list, expr_info) ->
5025:         (* Ternary operator "cond ? exp1 : exp2" *)
5026:         conditionalOperator_trans trans_state stmt_info stmt_list expr_info
5027:     | `IfStmt (stmt_info, _, if_stmt_info) ->
5028:         ifStmt_trans trans_state stmt_info if_stmt_info
5029:     | `SwitchStmt (stmt_info, _, switch_stmt_info) ->
5030:         switchStmt_trans trans_state stmt_info switch_stmt_info
5031:     | `CaseStmt (stmt_info, stmt_list) ->
5032:         caseStmt_trans trans_state stmt_info stmt_list
5033:     | `DefaultStmt (stmt_info, stmt_list) ->
5034:         defaultStmt_trans trans_state stmt_info stmt_list
5035:     | `StmtExpr ({si_source_range}, stmt_list, _)
5036:     | `CXXRewrittenBinaryOperator ({si_source_range}, stmt_list, _) ->
5037:         stmtExpr_trans trans_state si_source_range stmt_list
5038:     | `ForStmt (stmt_info, [init; decl_stmt; condition; increment; body]) ->
5039:         forStmt_trans trans_state ~init ~decl_stmt ~condition ~increment ~body stmt_info
5040:     | `WhileStmt (stmt_info, [condition; body]) ->
5041:         whileStmt_trans trans_state ~decl_stmt:None ~condition ~body stmt_info
5042:     | `WhileStmt (stmt_info, [decl_stmt; condition; body]) ->
5043:         whileStmt_trans trans_state ~decl_stmt:(Some decl_stmt) ~condition ~body stmt_info

(Showing lines 4844-5043 of 5555. Use offset=5044 to continue.)
</content>
```

---

## Assistant (Explore · Big Pickle · 6.8s)

_Thinking:_

Let me read more of the instruction_translate dispatch to see the rest:

**Tool: read**

**Input:**

```json
{
  "offset": 5044,
  "filePath": "infer/src/clang/cTrans.ml",
  "limit": 200
}
```

**Output:**

```
<path>infer/src/clang/cTrans.ml</path>
<type>file</type>
<content>
5044:     | `DoStmt (stmt_info, [body; condition]) ->
5045:         doStmt_trans trans_state ~condition ~body stmt_info
5046:     | `CXXForRangeStmt (stmt_info, stmt_list) ->
5047:         cxxForRangeStmt_trans trans_state stmt_info stmt_list
5048:     | `ObjCForCollectionStmt (stmt_info, [item; items; body]) ->
5049:         objCForCollectionStmt_trans trans_state item items body stmt_info
5050:     | `NullStmt _ ->
5051:         no_op_trans trans_state.succ_nodes
5052:     | `CompoundAssignOperator (stmt_info, stmt_list, expr_info, binary_operator_info, _) ->
5053:         binaryOperator_trans trans_state binary_operator_info stmt_info expr_info stmt_list
5054:     | `DeclStmt (stmt_info, _, decl_list) ->
5055:         declStmt_trans trans_state decl_list stmt_info
5056:     | `DeclRefExpr (stmt_info, _, _, decl_ref_expr_info) ->
5057:         declRefExpr_trans trans_state stmt_info decl_ref_expr_info
5058:     | `ObjCPropertyRefExpr (_, stmt_list, _, property_ref_expr) ->
5059:         objCPropertyRefExpr_trans trans_state stmt_list property_ref_expr
5060:     | `CXXThisExpr (stmt_info, _, expr_info) ->
5061:         cxxThisExpr_trans trans_state stmt_info expr_info
5062:     | `OpaqueValueExpr (stmt_info, _, _, opaque_value_expr_info) ->
5063:         opaqueValueExpr_trans trans_state opaque_value_expr_info
5064:           stmt_info.Clang_ast_t.si_source_range
5065:     | `PseudoObjectExpr (_, stmt_list, _) ->
5066:         pseudoObjectExpr_trans trans_state stmt_list
5067:     | `UnaryExprOrTypeTraitExpr (_, _, _, unary_expr_or_type_trait_expr_info) ->
5068:         unaryExprOrTypeTraitExpr_trans trans_state unary_expr_or_type_trait_expr_info
5069:     | `ImplicitCastExpr (stmt_info, stmt_list, expr_info, cast_kind, _)
5070:     | `BuiltinBitCastExpr (stmt_info, stmt_list, expr_info, cast_kind, _)
5071:     | `CStyleCastExpr (stmt_info, stmt_list, expr_info, cast_kind, _)
5072:     | `CXXReinterpretCastExpr (stmt_info, stmt_list, expr_info, cast_kind, _, _)
5073:     | `CXXConstCastExpr (stmt_info, stmt_list, expr_info, cast_kind, _, _)
5074:     | `CXXFunctionalCastExpr (stmt_info, stmt_list, expr_info, cast_kind, _) ->
5075:         cast_exprs_trans trans_state stmt_info stmt_list expr_info cast_kind
5076:     | `CXXStaticCastExpr (stmt_info, stmt_list, expr_info, cast_kind, qual_type, _) ->
5077:         cast_exprs_trans trans_state ~cxx_static_cast:qual_type stmt_info stmt_list expr_info
5078:           cast_kind
5079:     | `ObjCBridgedCastExpr (stmt_info, stmt_list, expr_info, cast_kind, _, objc_bridge_cast_ei) ->
5080:         let objc_bridge_cast_kind = objc_bridge_cast_ei.Clang_ast_t.obcei_cast_kind in
5081:         cast_exprs_trans trans_state stmt_info stmt_list expr_info ~objc_bridge_cast_kind cast_kind
5082:     | `IntegerLiteral (_, _, expr_info, integer_literal_info) ->
5083:         integerLiteral_trans trans_state expr_info integer_literal_info
5084:     | `OffsetOfExpr (stmt_info, _, expr_info, offset_of_expr_info) ->
5085:         offsetOf_trans trans_state expr_info offset_of_expr_info stmt_info
5086:     | `StringLiteral (_, _, expr_info, str_list) ->
5087:         stringLiteral_trans trans_state expr_info (String.concat ~sep:"" str_list)
5088:     | `GNUNullExpr (_, _, expr_info) ->
5089:         gNUNullExpr_trans trans_state expr_info
5090:     | `CXXNullPtrLiteralExpr (_, _, expr_info) ->
5091:         nullPtrExpr_trans trans_state expr_info
5092:     | `ObjCSelectorExpr (_, _, expr_info, selector) ->
5093:         objCSelectorExpr_trans trans_state expr_info selector
5094:     | `ObjCEncodeExpr (_, _, expr_info, objc_encode_expr_info) ->
5095:         objCEncodeExpr_trans trans_state expr_info objc_encode_expr_info
5096:     | `ObjCProtocolExpr (_, _, expr_info, decl_ref) ->
5097:         objCProtocolExpr_trans trans_state expr_info decl_ref
5098:     | `ObjCIvarRefExpr (stmt_info, stmt_list, _, obj_c_ivar_ref_expr_info) ->
5099:         objCIvarRefExpr_trans trans_state stmt_info stmt_list obj_c_ivar_ref_expr_info
5100:     | `MemberExpr (stmt_info, stmt_list, expr_info, member_expr_info) ->
5101:         memberExpr_trans trans_state stmt_info stmt_list expr_info member_expr_info
5102:     | `UnaryOperator (stmt_info, stmt_list, expr_info, unary_operator_info) ->
5103:         if
5104:           is_logical_negation_of_int trans_state.context.CContext.tenv expr_info unary_operator_info
5105:         then
5106:           let conditional =
5107:             Ast_expressions.trans_negation_with_conditional stmt_info expr_info stmt_list
5108:           in
5109:           instruction trans_state conditional
5110:         else unaryOperator_trans trans_state stmt_info expr_info stmt_list unary_operator_info
5111:     | `ReturnStmt (stmt_info, stmt_list) ->
5112:         returnStmt_trans trans_state stmt_info stmt_list
5113:     | `ExprWithCleanups (stmt_info, stmt_list, _, _) ->
5114:         exprWithCleanups_trans trans_state stmt_info stmt_list
5115:     | `ParenExpr ({Clang_ast_t.si_source_range}, stmt_list, _) ->
5116:         parenExpr_trans trans_state si_source_range stmt_list
5117:     | `ObjCBoolLiteralExpr (_, _, expr_info, n)
5118:     | `CharacterLiteral (_, _, expr_info, n)
5119:     | `CXXBoolLiteralExpr (_, _, expr_info, n) ->
5120:         characterLiteral_trans trans_state expr_info n
5121:     | `FixedPointLiteral (_, _, expr_info, float_string)
5122:     | `FloatingLiteral (_, _, expr_info, float_string) ->
5123:         floatingLiteral_trans trans_state expr_info float_string
5124:     | `CXXScalarValueInitExpr (_, _, expr_info) ->
5125:         cxxScalarValueInitExpr_trans trans_state expr_info
5126:     | `ObjCBoxedExpr (stmt_info, stmts, info, boxed_expr_info) ->
5127:         (* Sometimes clang does not return a boxing method (a name of function to apply), e.g.,
5128:            [@("str")].  In that case, it uses "unknownSelector:" instead of giving up the
5129:            translation. *)
5130:         let sel =
5131:           Option.value boxed_expr_info.Clang_ast_t.obei_boxing_method ~default:"unknownSelector:"
5132:         in
5133:         objCBoxedExpr_trans trans_state info sel stmt_info stmts
5134:     | `ObjCArrayLiteral (stmt_info, stmts, expr_info, array_literal_info) ->
5135:         objCArrayLiteral_trans trans_state expr_info stmt_info stmts array_literal_info
5136:     | `ObjCDictionaryLiteral (stmt_info, stmts, expr_info, dict_literal_info) ->
5137:         objCDictionaryLiteral_trans trans_state expr_info stmt_info stmts dict_literal_info
5138:     | `ObjCStringLiteral (stmt_info, stmts, info) ->
5139:         objCStringLiteral_trans trans_state stmt_info stmts info
5140:     | `BreakStmt (stmt_info, _) ->
5141:         breakStmt_trans trans_state stmt_info
5142:     | `ContinueStmt (stmt_info, _) ->
5143:         continueStmt_trans trans_state stmt_info
5144:     | `ObjCAtSynchronizedStmt (_, stmt_list) ->
5145:         objCAtSynchronizedStmt_trans trans_state stmt_list
5146:     | `ObjCIndirectCopyRestoreExpr (_, stmt_list, _) ->
5147:         let control, returns =
5148:           instructions Procdesc.Node.ObjCIndirectCopyRestoreExpr trans_state stmt_list
5149:         in
5150:         mk_trans_result (last_or_mk_fresh_void_exp_typ returns) control
5151:     | `BlockExpr (stmt_info, _, expr_info, decl) ->
5152:         blockExpr_trans trans_state stmt_info expr_info decl
5153:     | `ObjCAutoreleasePoolStmt (stmt_info, stmts) ->
5154:         objCAutoreleasePoolStmt_trans trans_state stmt_info stmts
5155:     | `ObjCAtTryStmt (_, stmts) ->
5156:         compoundStmt_trans trans_state stmts
5157:     | `CXXTryStmt (stmt_info, try_stmts) ->
5158:         tryStmt_trans trans_state stmt_info try_stmts
5159:     | `CXXCatchStmt _ ->
5160:         (* should by handled by try statement *)
5161:         assert false
5162:     | `ObjCAtThrowStmt (stmt_info, stmts) | `CXXThrowExpr (stmt_info, stmts, _) ->
5163:         objc_cxx_throw_trans trans_state stmt_info stmts
5164:     | `ObjCAtFinallyStmt (_, stmts) ->
5165:         compoundStmt_trans trans_state stmts
5166:     | `ObjCAtCatchStmt _ ->
5167:         compoundStmt_trans trans_state []
5168:     | `PredefinedExpr (_, _, expr_info, _) ->
5169:         stringLiteral_trans trans_state expr_info ""
5170:     | `BinaryConditionalOperator (stmt_info, stmts, expr_info) ->
5171:         binaryConditionalOperator_trans trans_state stmt_info stmts expr_info
5172:     | `CXXNewExpr (stmt_info, _, expr_info, cxx_new_expr_info) ->
5173:         cxxNewExpr_trans trans_state stmt_info expr_info cxx_new_expr_info
5174:     | `CXXDeleteExpr (stmt_info, stmt_list, _, delete_expr_info) ->
5175:         cxxDeleteExpr_trans trans_state stmt_info stmt_list delete_expr_info
5176:     | `MaterializeTemporaryExpr (stmt_info, stmt_list, expr_info, _) ->
5177:         materializeTemporaryExpr_trans trans_state stmt_info stmt_list expr_info
5178:     | `CXXBindTemporaryExpr (stmt_info, stmt_list, expr_info, _) ->
5179:         cxxBindTemporaryExpr_trans trans_state stmt_info stmt_list expr_info
5180:     | `CompoundLiteralExpr (stmt_info, stmt_list, expr_info) ->
5181:         compoundLiteralExpr_trans trans_state stmt_list stmt_info expr_info
5182:     | `InitListExpr (stmt_info, stmts, expr_info) ->
5183:         initListExpr_trans trans_state stmt_info expr_info stmts
5184:     | `CXXDynamicCastExpr (stmt_info, stmts, _, _, qual_type, _) ->
5185:         cxxDynamicCastExpr_trans trans_state stmt_info stmts qual_type
5186:     | `CXXDefaultArgExpr (_, _, _, default_expr_info)
5187:     | `CXXDefaultInitExpr (_, _, _, default_expr_info) ->
5188:         cxxDefaultExpr_trans trans_state default_expr_info
5189:     | `ImplicitValueInitExpr (stmt_info, _, _) ->
5190:         implicitValueInitExpr_trans trans_state stmt_info
5191:     | `GenericSelectionExpr (stmt_info, stmts, _, gse_info) -> (
5192:       match gse_info.gse_value with
5193:       | Some value ->
5194:           instruction trans_state value
5195:       | None ->
5196:           genericSelectionExprUnknown_trans trans_state stmt_info stmts )
5197:     | `SizeOfPackExpr _ ->
5198:         mk_trans_result (Exp.get_undefined false, StdTyp.void) empty_control
5199:     | `GCCAsmStmt (stmt_info, stmts) ->
5200:         gccAsmStmt_trans trans_state stmt_info stmts
5201:     | `CXXPseudoDestructorExpr _ ->
5202:         cxxPseudoDestructorExpr_trans ()
5203:     | `CXXTypeidExpr (stmt_info, stmts, expr_info) ->
5204:         cxxTypeidExpr_trans trans_state stmt_info stmts expr_info
5205:     | `CXXStdInitializerListExpr (stmt_info, stmts, expr_info) ->
5206:         cxxStdInitializerListExpr_trans trans_state stmt_info stmts expr_info
5207:     | `LambdaExpr (stmt_info, _, expr_info, lambda_expr_info) ->
5208:         let trans_state' = {trans_state with priority= Free} in
5209:         lambdaExpr_trans trans_state' stmt_info expr_info lambda_expr_info
5210:     | `AttributedStmt (stmt_info, stmts, attrs) ->
5211:         attributedStmt_trans trans_state stmt_info stmts attrs
5212:     | `TypeTraitExpr (_, _, expr_info, type_trait_info) ->
5213:         booleanValue_trans trans_state expr_info type_trait_info.Clang_ast_t.xtti_value
5214:     | `CXXNoexceptExpr (_, _, expr_info, cxx_noexcept_expr_info) ->
5215:         booleanValue_trans trans_state expr_info cxx_noexcept_expr_info.Clang_ast_t.xnee_value
5216:     | `VAArgExpr (_, [], expr_info) ->
5217:         undefined_expr trans_state expr_info
5218:     | `VAArgExpr (stmt_info, stmt :: _, ei) ->
5219:         va_arg_trans trans_state stmt_info stmt ei
5220:     | `ArrayInitIndexExpr _ | `ArrayInitLoopExpr _ ->
5221:         no_op_trans trans_state.succ_nodes
5222:     (* vector instructions for OpenCL etc. we basically ignore these for now; just translate the
5223:        sub-expressions *)
5224:     | `ObjCAvailabilityCheckExpr (_, _, expr_info, _) ->
5225:         undefined_expr trans_state expr_info
5226:     | `SubstNonTypeTemplateParmExpr (_, stmts, _) | `SubstNonTypeTemplateParmPackExpr (_, stmts, _)
5227:       ->
5228:         let[@warning "-partial-match"] [expr] = stmts in
5229:         instruction trans_state expr
5230:     (* Infer somehow ended up in templated non instantiated code - right now
5231:        it's not supported and failure in those cases is expected. *)
5232:     | `CXXDependentScopeMemberExpr ({Clang_ast_t.si_source_range}, _, _) ->
5233:         CFrontend_errors.unimplemented __POS__ si_source_range
5234:           ~ast_node:(Clang_ast_proj.get_stmt_kind_string instr)
5235:           "Translation of templated code is unsupported: %a"
5236:           (Pp.of_string ~f:Clang_ast_j.string_of_stmt)
5237:           instr
5238:     | `ForStmt ({Clang_ast_t.si_source_range}, _)
5239:     | `WhileStmt ({Clang_ast_t.si_source_range}, _)
5240:     | `DoStmt ({Clang_ast_t.si_source_range}, _)
5241:     | `ObjCForCollectionStmt ({Clang_ast_t.si_source_range}, _) ->
5242:         CFrontend_errors.incorrect_assumption __POS__ si_source_range "Unexpected shape for %a: %a"
5243:           (Pp.of_string ~f:Clang_ast_proj.get_stmt_kind_string)

(Showing lines 5044-5243 of 5555. Use offset=5244 to continue.)
</content>
```

---

## Assistant (Explore · Big Pickle · 7.0s)

_Thinking:_

I now have a very thorough understanding of the Clang frontend pipeline. Let me also look at the ClangFrontendStubs.ml file and how the Clang plugin binary is built.

Let me look at how the plugin is built and the stubs file:

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/ClangFrontendStubs.ml"
}
```

**Output:**

```
<path>infer/src/clang/ClangFrontendStubs.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: let die () =
11:   prerr_endline "ERROR: infer was built without clang support." ;
12:   Die.exit 1
13:
14:
15: module ClangQuotes = struct
16:   type style = EscapedDoubleQuotes | SingleQuotes | EscapedNoQuotes
17:
18:   let mk_arg_file _ _ _ = die ()
19: end
20:
21: module ClangTests = struct
22:   let tests = [OUnitTest.TestList []]
23: end
24:
25: module ClangWrapper = struct
26:   let exe ~prog:_ ~args:_ = ()
27: end
28:
29: module CTLParserHelper = struct
30:   let validate_al_files () = die ()
31: end
32:
33: module RegisterCallback = struct
34:   let register_frontend_checks () = ()
35: end

(End of file - total 35 lines)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "facebook-clang-plugins/libtooling/SimplePluginASTAction.cpp",
  "limit": 60
}
```

**Output:**

```
<path>facebook-clang-plugins/libtooling/SimplePluginASTAction.cpp</path>
<type>file</type>
<content>
1: /*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  */
7:
8: #include <functional>
9: #include <iostream>
10: #include <memory>
11: #include <stdlib.h>
12: #include <string>
13: #include <unistd.h>
14: #include <unordered_map>
15:
16: #include <llvm/Support/Path.h>
17:
18: #include "FileUtils.h"
19: #include "SimplePluginASTAction.h"
20:
21: namespace ASTPluginLib {
22:
23: /**
24:  * The actual prefix to prepend to environment variables (but not for the
25:  * command line).
26:  */
27: const std::string PluginASTOptionsBase::envPrefix = "CLANG_FRONTEND_PLUGIN__";
28:
29: PluginASTOptionsBase::argmap_t PluginASTOptionsBase::makeMap(
30:     const std::vector<std::string> &args) {
31:   argmap_t map;
32:   for (auto arg : args) {
33:     size_t pos = arg.find('=');
34:     if (pos != std::string::npos) {
35:       std::string key = arg.substr(0, pos);
36:       std::string value = arg.substr(pos + 1);
37:       map[key] = value;
38:     }
39:   }
40:   return map;
41: }
42:
43: bool PluginASTOptionsBase::loadString(const argmap_t &map,
44:                                       const char *key,
45:                                       std::string &val) {
46:   auto I = map.find(key);
47:   if (I != map.end()) {
48:     val = I->second;
49:     return true;
50:   }
51:   const char *s = getenv((envPrefix + key).c_str());
52:   if (s != nullptr) {
53:     val = s;
54:     return true;
55:   }
56:   return false;
57: }
58:
59: bool PluginASTOptionsBase::loadBool(const argmap_t &map,
60:                                     const char *key,

(Showing lines 1-60 of 180. Use offset=61 to continue.)
</content>
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/ClangPointers.ml",
  "limit": 60
}
```

**Output:**

```
<path>infer/src/clang/ClangPointers.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9: module L = Logging
10: module Map = IInt.Map
11:
12: let ivar_to_property_table = IInt.Hash.create 256
13:
14: let pointer_decl_table = IInt.Hash.create 256
15:
16: let pointer_stmt_table = IInt.Hash.create 256
17:
18: let pointer_type_table = IInt.Hash.create 256
19:
20: let empty_v = Clang_ast_visit.empty_visitor
21:
22: (* This function is not thread-safe *)
23: let visit_ast ?(visit_decl = empty_v) ?(visit_stmt = empty_v) ?(visit_type = empty_v)
24:     ?(visit_src_loc = empty_v) top_decl =
25:   Clang_ast_visit.decl_visitor := visit_decl ;
26:   Clang_ast_visit.stmt_visitor := visit_stmt ;
27:   Clang_ast_visit.type_visitor := visit_type ;
28:   Clang_ast_visit.source_location_visitor := visit_src_loc ;
29:   match Clang_ast_v.validate_decl [] top_decl (* visit *) with
30:   | None ->
31:       ()
32:   | Some error ->
33:       L.(die InternalError)
34:         "visiting the clang AST failed with error %s"
35:         (Atdgen_runtime.Util.Validation.string_of_error error)
36:
37:
38: let get_ptr_from_node node =
39:   match node with
40:   | `DeclNode decl ->
41:       let decl_info = Clang_ast_proj.get_decl_tuple decl in
42:       decl_info.Clang_ast_t.di_pointer
43:   | `StmtNode stmt ->
44:       let stmt_info, _ = Clang_ast_proj.get_stmt_tuple stmt in
45:       stmt_info.Clang_ast_t.si_pointer
46:   | `TypeNode c_type ->
47:       let type_info = Clang_ast_proj.get_type_tuple c_type in
48:       type_info.Clang_ast_t.ti_pointer
49:
50:
51: let get_val_from_node node =
52:   match node with `DeclNode decl -> decl | `StmtNode stmt -> stmt | `TypeNode c_type -> c_type
53:
54:
55: let add_node_to_cache node cache =
56:   let key = get_ptr_from_node node in
57:   let data = get_val_from_node node in
58:   IInt.Hash.replace cache key data
59:
60:

(Showing lines 1-60 of 128. Use offset=61 to continue.)
</content>
```

---

## Assistant (Explore · Big Pickle · 11.1s)

_Thinking:_

Now I have a thorough understanding of the entire pipeline. Let me read a few more files to complete the picture, then compose the detailed answer.

Let me look at a few more pieces: how the Clang_ast_t types hook into the OCaml side, and the `cType_decl.ml`:

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/cType_decl.ml",
  "limit": 80
}
```

**Error:**

```
File not found: infer/src/clang/cType_decl.ml

Did you mean one of these?
infer/src/clang/CType_decl.ml
infer/src/clang/CType_decl.mli
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/atd/clang_ast_t.ml",
  "offset": 2000,
  "limit": 200
}
```

**Output:**

```
<path>infer/src/atd/clang_ast_t.ml</path>
<type>file</type>
<content>
2000:       of (stmt_info * stmt list * expr_info * cxx_construct_expr_info)
2001:   | `CXXBoolLiteralExpr of (stmt_info * stmt list * expr_info * int)
2002:   | `CXXBindTemporaryExpr
2003:       of (stmt_info * stmt list * expr_info * cxx_bind_temporary_expr_info)
2004:   | `BlockExpr of (stmt_info * stmt list * expr_info * decl)
2005:   | `BinaryOperator
2006:       of (stmt_info * stmt list * expr_info * binary_operator_info)
2007:   | `CompoundAssignOperator
2008:       of (
2009:           stmt_info
2010:         * stmt list
2011:         * expr_info
2012:         * binary_operator_info
2013:         * compound_assign_operator_info
2014:       )
2015:   | `AtomicExpr of (stmt_info * stmt list * expr_info * atomic_expr_info)
2016:   | `AsTypeExpr of (stmt_info * stmt list * expr_info)
2017:   | `ArrayTypeTraitExpr of (stmt_info * stmt list * expr_info)
2018:   | `ArraySubscriptExpr of (stmt_info * stmt list * expr_info)
2019:   | `ArraySectionExpr of (stmt_info * stmt list * expr_info)
2020:   | `ArrayInitLoopExpr of (stmt_info * stmt list * expr_info)
2021:   | `ArrayInitIndexExpr of (stmt_info * stmt list * expr_info)
2022:   | `AddrLabelExpr
2023:       of (stmt_info * stmt list * expr_info * addr_label_expr_info)
2024:   | `ConditionalOperator of (stmt_info * stmt list * expr_info)
2025:   | `BinaryConditionalOperator of (stmt_info * stmt list * expr_info)
2026:   | `AttributedStmt of (stmt_info * stmt list * attribute list)
2027:   | `SwitchStmt of (stmt_info * stmt list * switch_stmt_info)
2028:   | `DefaultStmt of (stmt_info * stmt list)
2029:   | `CaseStmt of (stmt_info * stmt list)
2030:   | `SYCLKernelCallStmt of (stmt_info * stmt list)
2031:   | `SEHTryStmt of (stmt_info * stmt list)
2032:   | `SEHLeaveStmt of (stmt_info * stmt list)
2033:   | `SEHFinallyStmt of (stmt_info * stmt list)
2034:   | `SEHExceptStmt of (stmt_info * stmt list)
2035:   | `ReturnStmt of (stmt_info * stmt list)
2036:   | `OpenACCWaitConstruct of (stmt_info * stmt list)
2037:   | `OpenACCUpdateConstruct of (stmt_info * stmt list)
2038:   | `OpenACCShutdownConstruct of (stmt_info * stmt list)
2039:   | `OpenACCSetConstruct of (stmt_info * stmt list)
2040:   | `OpenACCInitConstruct of (stmt_info * stmt list)
2041:   | `OpenACCExitDataConstruct of (stmt_info * stmt list)
2042:   | `OpenACCEnterDataConstruct of (stmt_info * stmt list)
2043:   | `OpenACCCacheConstruct of (stmt_info * stmt list)
2044:   | `OpenACCLoopConstruct of (stmt_info * stmt list)
2045:   | `OpenACCHostDataConstruct of (stmt_info * stmt list)
2046:   | `OpenACCDataConstruct of (stmt_info * stmt list)
2047:   | `OpenACCComputeConstruct of (stmt_info * stmt list)
2048:   | `OpenACCCombinedConstruct of (stmt_info * stmt list)
2049:   | `OpenACCAtomicConstruct of (stmt_info * stmt list)
2050:   | `ObjCForCollectionStmt of (stmt_info * stmt list)
2051:   | `ObjCAutoreleasePoolStmt of (stmt_info * stmt list)
2052:   | `ObjCAtTryStmt of (stmt_info * stmt list)
2053:   | `ObjCAtThrowStmt of (stmt_info * stmt list)
2054:   | `ObjCAtSynchronizedStmt of (stmt_info * stmt list)
2055:   | `ObjCAtFinallyStmt of (stmt_info * stmt list)
2056:   | `ObjCAtCatchStmt of (stmt_info * stmt list * obj_c_message_expr_kind)
2057:   | `OMPTeamsDirective of (stmt_info * stmt list)
2058:   | `OMPTaskyieldDirective of (stmt_info * stmt list)
2059:   | `OMPTaskwaitDirective of (stmt_info * stmt list)
2060:   | `OMPTaskgroupDirective of (stmt_info * stmt list)
2061:   | `OMPTaskDirective of (stmt_info * stmt list)
2062:   | `OMPTargetUpdateDirective of (stmt_info * stmt list)
2063:   | `OMPTargetTeamsDirective of (stmt_info * stmt list)
2064:   | `OMPTargetParallelForDirective of (stmt_info * stmt list)
2065:   | `OMPTargetParallelDirective of (stmt_info * stmt list)
2066:   | `OMPTargetExitDataDirective of (stmt_info * stmt list)
2067:   | `OMPTargetEnterDataDirective of (stmt_info * stmt list)
2068:   | `OMPTargetDirective of (stmt_info * stmt list)
2069:   | `OMPTargetDataDirective of (stmt_info * stmt list)
2070:   | `OMPSingleDirective of (stmt_info * stmt list)
2071:   | `OMPSectionsDirective of (stmt_info * stmt list)
2072:   | `OMPSectionDirective of (stmt_info * stmt list)
2073:   | `OMPScopeDirective of (stmt_info * stmt list)
2074:   | `OMPScanDirective of (stmt_info * stmt list)
2075:   | `OMPParallelSectionsDirective of (stmt_info * stmt list)
2076:   | `OMPParallelMasterDirective of (stmt_info * stmt list)
2077:   | `OMPParallelMaskedDirective of (stmt_info * stmt list)
2078:   | `OMPParallelDirective of (stmt_info * stmt list)
2079:   | `OMPOrderedDirective of (stmt_info * stmt list)
2080:   | `OMPMetaDirective of (stmt_info * stmt list)
2081:   | `OMPMasterDirective of (stmt_info * stmt list)
2082:   | `OMPMaskedDirective of (stmt_info * stmt list)
2083:   | `OMPUnrollDirective of (stmt_info * stmt list)
2084:   | `OMPTileDirective of (stmt_info * stmt list)
2085:   | `OMPStripeDirective of (stmt_info * stmt list)
2086:   | `OMPReverseDirective of (stmt_info * stmt list)
2087:   | `OMPInterchangeDirective of (stmt_info * stmt list)
2088:   | `OMPTeamsGenericLoopDirective of (stmt_info * stmt list)
2089:   | `OMPTeamsDistributeSimdDirective of (stmt_info * stmt list)
2090:   | `OMPTeamsDistributeParallelForSimdDirective of (stmt_info * stmt list)
2091:   | `OMPTeamsDistributeParallelForDirective of (stmt_info * stmt list)
2092:   | `OMPTeamsDistributeDirective of (stmt_info * stmt list)
2093:   | `OMPTaskLoopSimdDirective of (stmt_info * stmt list)
2094:   | `OMPTaskLoopDirective of (stmt_info * stmt list)
2095:   | `OMPTargetTeamsGenericLoopDirective of (stmt_info * stmt list)
2096:   | `OMPTargetTeamsDistributeSimdDirective of (stmt_info * stmt list)
2097:   | `OMPTargetTeamsDistributeParallelForSimdDirective
2098:       of (stmt_info * stmt list)
2099:   | `OMPTargetTeamsDistributeParallelForDirective of (stmt_info * stmt list)
2100:   | `OMPTargetTeamsDistributeDirective of (stmt_info * stmt list)
2101:   | `OMPTargetSimdDirective of (stmt_info * stmt list)
2102:   | `OMPTargetParallelGenericLoopDirective of (stmt_info * stmt list)
2103:   | `OMPTargetParallelForSimdDirective of (stmt_info * stmt list)
2104:   | `OMPSimdDirective of (stmt_info * stmt list)
2105:   | `OMPParallelMasterTaskLoopSimdDirective of (stmt_info * stmt list)
2106:   | `OMPParallelMasterTaskLoopDirective of (stmt_info * stmt list)
2107:   | `OMPParallelMaskedTaskLoopSimdDirective of (stmt_info * stmt list)
2108:   | `OMPParallelMaskedTaskLoopDirective of (stmt_info * stmt list)
2109:   | `OMPParallelGenericLoopDirective of (stmt_info * stmt list)
2110:   | `OMPParallelForSimdDirective of (stmt_info * stmt list)
2111:   | `OMPParallelForDirective of (stmt_info * stmt list)
2112:   | `OMPMasterTaskLoopSimdDirective of (stmt_info * stmt list)
2113:   | `OMPMasterTaskLoopDirective of (stmt_info * stmt list)
2114:   | `OMPMaskedTaskLoopSimdDirective of (stmt_info * stmt list)
2115:   | `OMPMaskedTaskLoopDirective of (stmt_info * stmt list)
2116:   | `OMPGenericLoopDirective of (stmt_info * stmt list)
2117:   | `OMPForSimdDirective of (stmt_info * stmt list)
2118:   | `OMPForDirective of (stmt_info * stmt list)
2119:   | `OMPDistributeSimdDirective of (stmt_info * stmt list)
2120:   | `OMPDistributeParallelForSimdDirective of (stmt_info * stmt list)
2121:   | `OMPDistributeParallelForDirective of (stmt_info * stmt list)
2122:   | `OMPDistributeDirective of (stmt_info * stmt list)
2123:   | `OMPInteropDirective of (stmt_info * stmt list)
2124:   | `OMPFlushDirective of (stmt_info * stmt list)
2125:   | `OMPErrorDirective of (stmt_info * stmt list)
2126:   | `OMPDispatchDirective of (stmt_info * stmt list)
2127:   | `OMPDepobjDirective of (stmt_info * stmt list)
2128:   | `OMPCriticalDirective of (stmt_info * stmt list)
2129:   | `OMPCancellationPointDirective of (stmt_info * stmt list)
2130:   | `OMPCancelDirective of (stmt_info * stmt list)
2131:   | `OMPBarrierDirective of (stmt_info * stmt list)
2132:   | `OMPAtomicDirective of (stmt_info * stmt list)
2133:   | `OMPAssumeDirective of (stmt_info * stmt list)
2134:   | `OMPCanonicalLoop of (stmt_info * stmt list)
2135:   | `NullStmt of (stmt_info * stmt list)
2136:   | `MSDependentExistsStmt of (stmt_info * stmt list)
2137:   | `IndirectGotoStmt of (stmt_info * stmt list)
2138:   | `IfStmt of (stmt_info * stmt list * if_stmt_info)
2139:   | `GotoStmt of (stmt_info * stmt list * goto_stmt_info)
2140:   | `ForStmt of (stmt_info * stmt list)
2141:   | `DoStmt of (stmt_info * stmt list)
2142:   | `DeclStmt of (stmt_info * stmt list * decl list)
2143:   | `CoroutineBodyStmt of (stmt_info * stmt list * coro_body_stmt_info)
2144:   | `CoreturnStmt of (stmt_info * stmt list * coreturn_stmt_info)
2145:   | `ContinueStmt of (stmt_info * stmt list)
2146:   | `CompoundStmt of (stmt_info * stmt list)
2147:   | `CapturedStmt of (stmt_info * stmt list)
2148:   | `CXXTryStmt of (stmt_info * stmt list)
2149:   | `CXXForRangeStmt of (stmt_info * stmt list)
2150:   | `CXXCatchStmt of (stmt_info * stmt list * cxx_catch_stmt_info)
2151:   | `BreakStmt of (stmt_info * stmt list)
2152:   | `MSAsmStmt of (stmt_info * stmt list)
2153:   | `GCCAsmStmt of (stmt_info * stmt list)
2154: ]
2155:
2156: and switch_stmt_info = {
2157:   ssi_init (*atd init *): pointer option;
2158:   ssi_cond_var (*atd cond_var *): stmt option;
2159:   ssi_cond (*atd cond *): pointer;
2160:   ssi_body (*atd body *): pointer;
2161:   ssi_is_all_enum_cases_covered (*atd is_all_enum_cases_covered *): bool
2162: }
2163:
2164: and template_decl_info = {
2165:   tdi_specializations (*atd specializations *): decl list
2166: }
2167:
2168: and var_decl_info = {
2169:   vdi_is_global (*atd is_global *): bool;
2170:   vdi_is_extern (*atd is_extern *): bool;
2171:   vdi_is_static (*atd is_static *): bool;
2172:   vdi_is_static_local (*atd is_static_local *): bool;
2173:   vdi_is_static_data_member (*atd is_static_data_member *): bool;
2174:   vdi_is_constexpr (*atd is_constexpr *): bool;
2175:   vdi_is_init_ice (*atd is_init_ice *): bool;
2176:   vdi_init_expr (*atd init_expr *): stmt option;
2177:   vdi_is_init_expr_cxx11_constant (*atd is_init_expr_cxx11_constant *): bool;
2178:   vdi_parm_index_in_function (*atd parm_index_in_function *): int option
2179: }
2180:
2181: type lookup = {
2182:   lup_decl_name (*atd decl_name *): string;
2183:   lup_decl_refs (*atd decl_refs *): decl_ref list
2184: }
2185:
2186: type lookups = {
2187:   lups_decl_ref (*atd decl_ref *): decl_ref;
2188:   lups_primary_context_pointer (*atd primary_context_pointer *):
2189:     pointer option;
2190:   lups_lookups (*atd lookups *): lookup list;
2191:   lups_has_undeserialized_decls (*atd has_undeserialized_decls *): bool
2192: }

(End of file - total 2192 lines)
</content>
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "infer/src/atd/clang_ast*.atd"
}
```

**Output:**

```
No files found
```

---

## Assistant (Explore · Big Pickle · 8.8s)

_Thinking:_

Let me also look for the .atd files:

**Tool: glob**

**Input:**

```json
{
  "pattern": "**/*.atd",
  "path": "/home/tablinux/Github/infer"
}
```

**Output:**

```
infer/src/atd/specialized_call_graph.atd
infer/src/atd/semdiff_batch.atd
infer/src/atd/sarifbug.atd
infer/src/atd/runstate.atd
infer/src/atd/report_block_list_spec.atd
infer/src/atd/pulse_config.atd
infer/src/atd/jsoncost.atd
infer/src/atd/jsonconfigimpact.atd
infer/src/atd/jsonbug.atd
infer/src/atd/config_impact_data.atd
facebook-clang-plugins/libtooling/atdlib/tests/normalize_test.atd
```

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/CType_decl.ml",
  "limit": 100
}
```

**Output:**

```
<path>infer/src/clang/CType_decl.ml</path>
<type>file</type>
<content>
1: (*
2:  * Copyright (c) Facebook, Inc. and its affiliates.
3:  *
4:  * This source code is licensed under the MIT license found in the
5:  * LICENSE file in the root directory of this source tree.
6:  *)
7:
8: open! IStd
9:
10: (** Processes types and record declarations by adding them to the tenv *)
11:
12: module BuildMethodSignature = struct
13:   let get_class_parameter_name method_kind =
14:     match method_kind with
15:     | ClangMethodKind.CPP_INSTANCE ->
16:         Some (Mangled.from_string CFrontend_config.this)
17:     | ClangMethodKind.OBJC_INSTANCE ->
18:         Some (Mangled.from_string CFrontend_config.self)
19:     | _ ->
20:         None
21:
22:
23:   let param_type_of_qual_type ?(is_cpp_const_member_function = false) qual_type_to_sil_type tenv
24:       name qual_type =
25:     let typ = qual_type_to_sil_type tenv qual_type in
26:     let is_pointer_to_const = CType.is_pointer_to_const qual_type in
27:     (* non-static member functions declared as const cannot modify their this*
28:        object parameter, hence should have pointer to const type
29:        https://en.cppreference.com/w/cpp/language/member_functions *)
30:     let typ =
31:       if Mangled.is_this name && is_cpp_const_member_function then Typ.set_ptr_to_const typ else typ
32:     in
33:     let annot = CAst_utils.sil_annot_of_type qual_type in
34:     CMethodSignature.mk_param_type ~is_pointer_to_const ~annot name typ
35:
36:
37:   let get_class_param qual_type_to_sil_type tenv method_decl =
38:     let aux ~is_cpp_const_member_function parent_pointer =
39:       let method_kind = CMethodProperties.get_method_kind method_decl in
40:       match method_kind with
41:       | ClangMethodKind.CPP_INSTANCE | ClangMethodKind.OBJC_INSTANCE -> (
42:         match (get_class_parameter_name method_kind, parent_pointer) with
43:         | Some name, Some parent_pointer ->
44:             let qual_type = CAst_utils.qual_type_of_decl_ptr parent_pointer in
45:             let pointer_qual_type = Ast_expressions.create_pointer_qual_type qual_type in
46:             Some
47:               (param_type_of_qual_type ~is_cpp_const_member_function qual_type_to_sil_type tenv name
48:                  pointer_qual_type )
49:         | _ ->
50:             None )
51:       | _ ->
52:           None
53:     in
54:     let open Clang_ast_t in
55:     match method_decl with
56:     | FunctionDecl _ | BlockDecl _ ->
57:         None
58:     | CXXMethodDecl (decl_info, _, _, _, cmdi) ->
59:         aux ~is_cpp_const_member_function:cmdi.Clang_ast_t.xmdi_is_const decl_info.di_parent_pointer
60:     | CXXConstructorDecl (decl_info, _, _, _, _)
61:     | CXXConversionDecl (decl_info, _, _, _, _)
62:     | CXXDestructorDecl (decl_info, _, _, _, _)
63:     | ObjCMethodDecl (decl_info, _, _) ->
64:         aux ~is_cpp_const_member_function:false decl_info.di_parent_pointer
65:     | _ ->
66:         raise CFrontend_errors.Invalid_declaration
67:
68:
69:   let should_add_return_param return_type =
70:     match return_type.Typ.desc with Tstruct _ -> true | _ -> false
71:
72:
73:   let get_return_type_and_param_type qual_type_to_sil_type tenv ~block_return_type method_decl =
74:     let return_qual_type =
75:       match block_return_type with
76:       | Some return_type ->
77:           CType.return_type_of_function_type return_type
78:       | None ->
79:           CMethodProperties.get_return_type method_decl
80:     in
81:     let return_typ = qual_type_to_sil_type tenv return_qual_type in
82:     let return_param =
83:       if should_add_return_param return_typ then
84:         let name = Mangled.from_string CFrontend_config.return_param in
85:         let return_qual_type = Ast_expressions.create_pointer_qual_type return_qual_type in
86:         Some (param_type_of_qual_type qual_type_to_sil_type tenv name return_qual_type)
87:       else None
88:     in
89:     (return_typ, return_qual_type, return_param)
90:
91:
92:   (** Returns parameters of a function/method. They will have following order:
93:
94:       + normal parameters
95:       + return parameter (optional) *)
96:   let get_parameters qual_type_to_sil_type tenv ~block_return_type method_decl =
97:     let open Clang_ast_t in
98:     let par_to_ms_par par =
99:       match par with
100:       | ParmVarDecl (_, name_info, qt, var_decl_info) ->

(Showing lines 1-100 of 773. Use offset=101 to continue.)
</content>
```

---

## Assistant (Explore · Big Pickle · 11.2s)

_Thinking:_

I now have a comprehensive understanding of the Clang frontend pipeline. Let me also check the Clang_ast_proj module and Clang_ast_visit module for completeness.

Let me quickly look at the Clang_ast_proj module (used everywhere for projection) and see how `clang_ast.atd` is structured:

**Tool: glob**

**Input:**

```json
{
  "pattern": "**/clang_ast_proj.ml",
  "path": "/home/tablinux/Github/infer"
}
```

**Output:**

```
infer/src/atd/clang_ast_proj.ml
```

**Tool: glob**

**Input:**

```json
{
  "pattern": "**/clang_ast.atd",
  "path": "/home/tablinux/Github/infer"
}
```

**Output:**

```
No files found
```

---

## Assistant (Explore · Big Pickle · 7.1s)

_Thinking:_

The ATD file for clang_ast is not in the repo; it must be generated from the C++ ASTExporter.h file annotations. The `//@atd` annotations in the ASTExporter.h are the source - the ATD file is extracted from these. Let me check the Makefile or build scripts for this. Let me also check the ClangFrontend.mld for documentation.

**Tool: read**

**Input:**

```json
{
  "filePath": "infer/src/clang/ClangFrontend.mld"
}
```

**Output:**

```
<path>infer/src/clang/ClangFrontend.mld</path>
<type>file</type>
<content>
1: {0 Clang Frontend}
2:
3: Translates code that {{:https://clang.llvm.org/}[Clang]} understands into Infer's intermediate representation language {!module-IR.Sil}.
4:
5: All modules: {!module-ClangFrontend}
6:
7: {1 Capturing source files}
8:
9: Start at {!module-ClangFrontend.Capture} for how Infer uses Clang to parse source files, using our Clang plugin. For more information on our clang plugin itself, refer to the relevant documentation in [facebook-clang-plugins]:
10:
11: - {{:https://github.com/facebook/infer/blob/main/facebook-clang-plugins/libtooling/ATD_GUIDELINES.md} [facebook-clang-plugins/libtooling/ATD_GUIDELINES.md]}
12: - {{:https://github.com/facebook/infer/blob/main/facebook-clang-plugins/clang-ocaml/README.md} [facebook-clang-plugins/clang-ocaml/README.md]}
13:
14: {1 Quick guide to changing the AST format}
15:
16: + Create a simple example ([example.cpp]) source file with construct that needs to be exported. The smaller the better.
17: + Export the extra information by changing the code in {{:https://github.com/facebook/infer/blob/main/facebook-clang-plugins/libtooling/ASTExporter.h} [libtooling/ASTExporter.h]}. For more information, refer to the {{:https://github.com/facebook/infer/blob/main/facebook-clang-plugins/libtooling/ATD_GUIDELINES.md} [ATD_GUIDELINES]}.
18: + Compile Infer with the new version of [facebook-clang-plugins]. Running [make] from top level of Infer repository will do that. Sometimes there may be compilation errors due to [.atd] file changes --they need to be fixed.
19: + Use newly-exported information in the frontend as you please.
20:
21: {1 Tips & Tricks}
22:
23: - To view the AST in a human readable version, Infer can generate [.bdump] files: [infer -g -- clang -c example.cpp && sh example.cpp.ast.sh]. Then open [example.cpp.ast.bdump].
24: - To inspect the AST visually: [clang -c example.cpp -Xclang -ast-dump]. It doesn't include all the information that Infer sees, but it's often a good place to start.
25: - If running [bdump] is failing (it happens on huge sources sometimes), there is a way to view it in "Yojson" format. To do that, replace all occurrences of [BiniouASTExporter] with [YojsonASTExporter] in the [.ast.sh] debug script.

(End of file - total 25 lines)
</content>
```

**Tool: grep**

**Input:**

```json
{
  "pattern": "clang_ast.atd|clang_ast_t|CLANG_AST",
  "include": "Makefile",
  "path": "/home/tablinux/Github/infer"
}
```

**Output:**

```
Found 15 matches
facebook-clang-plugins/clang-ocaml/Makefile:
  Line 60: build/clang_ast.atd: build/ast_inline.atd

  Line 104: CLANG_AST_LIBS=$(patsubst %,build/%.cmx,clang_ast_types clang_ast_t clang_ast_j process utils yojson_utils)

  Line 106: build/yojson_utils_test: $(CLANG_AST_LIBS) build/yojson_utils_test.cmx

  Line 109: build/clang_ast_proj_test: $(CLANG_AST_LIBS) build/clang_ast_proj.cmx build/clang_ast_proj_test.cmx

  Line 113: build/clang_ast_converter: $(CLANG_AST_LIBS) build/clang_ast_converter.cmx

  Line 116: CLANG_AST_PROJ_LIBS=$(patsubst %,build/%.cmx,clang_ast_types clang_ast_t clang_ast_j clang_ast_proj clang_ast_visit clang_ast_v clang_ast_main)

  Line 119: build/clang_ast_named_decl_printer: $(CLANG_AST_PROJ_LIBS) build/clang_ast_named_decl_printer.cmx

  Line 122: build/clang_ast_main_test: $(CLANG_AST_PROJ_LIBS) build/clang_ast_main_test.cmx

  Line 158: .depend: $(wildcard *.ml) $(wildcard *.mli) build/clang_ast_t.mli build/clang_ast_t.ml build/clang_ast_j.mli build/clang_ast_j.ml build/clang_ast_v.mli build/clang_ast_v.ml build/clang_ast_proj.mli build/clang_ast_proj.ml


infer/src/Makefile:
  Line 22: CLANG_AST_BASE_NAME = clang_ast

  Line 23: CLANG_ATDGEN_STUB_BASE = $(CLANG_PLUGIN_MIRROR)/$(CLANG_AST_BASE_NAME)

  Line 24: CLANG_ATDGEN_STUB_ATD = $(FCP_CLANG_OCAML_BUILD_DIR)/$(CLANG_AST_BASE_NAME).atd

  Line 29: FCP_CLANG_AST_PROJ = $(addprefix $(FCP_CLANG_OCAML_BUILD_DIR)/, \

  Line 31: FCP_CLANG_AST_MAIN = $(addprefix $(FCP_CLANG_OCAML_DIR)/, clang_ast_visit.ml clang_ast_types.ml)

  Line 32: FCP_FILES_TO_MIRROR = $(FCP_CLANG_AST_PROJ) $(FCP_CLANG_AST_MAIN)

```

---

## Assistant (Explore · Big Pickle · 49.1s)

_Thinking:_

Now I have a comprehensive understanding of the full pipeline. Let me compose the answer.

Now I have a thorough understanding of the entire pipeline. Here is the detailed overview.

---

## Clang Frontend Pipeline: Clang AST -> SIL

The pipeline has **four major stages**:

### Stage 1: Compilation Interception & Clang Plugin Invocation

**Entry point:** `ClangWrapper.exe` -> `Capture.capture` -> `Capture.cc1_capture`

When Infer intercepts a compilation command (e.g., `clang -c foo.c`), it:

1. **Normalizes** the command via `ClangWrapper.normalize`, which runs `clang -###` to expand driver commands into canonical `-cc1` commands.
2. **Attaches the plugin** via `ClangCommand.with_plugin_args`. This modifies the clang command by adding:
   ```sh
   -cc1 -load <path-to-plugin.so> -add-plugin BiniouASTExporter
   -plugin-arg-BiniouASTExporter "-"   # read from stdin
   -plugin-arg-BiniouASTExporter "PREPEND_CURRENT_DIR=1"
   -plugin-arg-BiniouASTExporter "MAX_STRING_SIZE=65535"
   -O0 -fno-builtin
   ```
3. **Runs the C++ plugin** in a subprocess. The plugin emits the serialized AST (as Biniou binary format) to stdout, which is piped back to the OCaml process.

**Key files:**

- `infer/src/clang/Capture.ml` - orchestrates the capture
- `infer/src/clang/ClangCommand.ml` - builds clang command lines, adds plugin args
- `infer/src/clang/ClangWrapper.ml` - drives compilation via `clang -###`, dispatches captured commands

---

### Stage 2: C++ Plugin - Clang AST Serialization (via ASTExporter)

**Location:** `facebook-clang-plugins/libtooling/ASTExporter.h` and `ASTExporter.cpp`

This is a **clang Tooling plugin** registered as:

```cpp
FrontendPluginRegistry::Add<ASTLib::BiniouExporterASTAction> Z("BiniouASTExporter", ...);
```

The `ASTExporter` class inherits from **five visitors** simultaneously:

- `ConstDeclVisitor` - visits all declarations (functions, classes, variables, etc.)
- `ConstStmtVisitor` - visits all statements/expressions (if, for, binary ops, calls, etc.)
- `ConstCommentVisitor` - visits comments
- `TypeVisitor` - visits types
- `ConstAttrVisitor` - visits attributes

The plugin serializes the full Clang AST into Biniou format. The schema is defined inline via `//@atd` annotations in `ASTExporter.h`. For example:

```cpp
//@atd type qual_type = { type_ptr : type_ptr; ~is_const : bool; ... }
//@atd type source_location = { ?file : source_file option; ?line : int option; ... }
//@atd type decl_info = { pointer : pointer; ?parent_pointer : pointer option; ... }
```

Each AST node is emitted as a **variant** with a tuple payload, e.g.:

```
`BinaryOperator(stmt_info, [children], expr_info, binary_operator_info)
```

The key design: **the C++ header IS the schema**. The `//@atd` inline annotations are extracted to generate the ATD schema file, which is then used by `atdgen` to produce the OCaml types and JSON/Biniou serializers.

**Key files:**

- `facebook-clang-plugins/libtooling/ASTExporter.h` - the visitor + schema
- `facebook-clang-plugins/libtooling/ASTExporter.cpp` - plugin registrations
- `facebook-clang-plugins/libtooling/atdlib/ATDWriter.h` - generic serialization framework

---

### Stage 3: AST Deserialization into OCaml Types

**Entry point:** `Capture.run_clang_frontend`

The Biniou data from the plugin is deserialized into OCaml variant types. The flow:

```
Biniou bytes -> Atdgen deserializer -> Clang_ast_t.decl (TranslationUnitDecl)
```

1. `Capture.validate_decl_from_channel` or `validate_decl_from_file` calls `Clang_ast_b.read_decl` (auto-generated by atdgen) to parse the Biniou stream into an OCaml value of type `Clang_ast_t.decl`.

2. The top-level decl is always `TranslationUnitDecl(decl_info, decl_context_info, translation_unit_decl_info)`, which contains:
   - The full decl list (all global declarations)
   - Input file path, language kind (C/C++/ObjC/ObjC++), integer widths, ARC status
   - All types used in the translation unit (`tudi_types`)

3. `Capture.init_global_state_for_capture_and_linters` sets up the translation unit context (`CFrontend_config.translation_unit_context`).

4. `ClangPointers.populate_all_tables` pre-populates hash tables that map integer pointer IDs to their AST nodes (decls, stmts, types), enabling O(1) lookup by pointer.

**Key files:**

- `infer/src/atd/clang_ast_t.ml` - auto-generated OCaml types (2192 lines)
- `infer/src/clang/ClangPointers.ml` - pointer table management
- `infer/src/clang/cFrontend_config.ml` - translation unit context type

---

### Stage 4: OCaml Frontend - Translation to SIL

This is the heart of the translation, splitting into **two mutually recursive functors** defined in `cFrontend.ml`:

```ocaml
module rec CTransImpl : CModule_type.CTranslation = CTrans.CTrans_funct(CFrontend_declImpl)
       and CFrontend_declImpl : CModule_type.CFrontend = CFrontend_decl.CFrontend_decl_funct(CTransImpl)
```

This mutual recursion allows `CTransImpl` (instruction translator) to call back into `CFrontend_declImpl` (declaration translator) when it encounters nested declarations, and vice versa.

#### Stage 4a: Declaration-Level Translation

**Module:** `CFrontend_decl` (602 lines)

`CFrontend_decl.translate_one_declaration` is the main dispatcher. For each top-level or nested declaration, it:

1. **Checks `should_translate_decl`** - filters by source location (skips system headers unless configured), method allow lists, etc.
2. **Dispatches by declaration kind:**

| Decl Kind                                | Action                                                                          |
| ---------------------------------------- | ------------------------------------------------------------------------------- |
| `FunctionDecl`                           | Call `function_decl` -> get method signature, create `procdesc`, translate body |
| `ObjCInterfaceDecl`                      | Add interface to type env (`tenv`), process its method decls                    |
| `ObjCImplementationDecl`                 | Add implementation to tenv, process method decls, auto-create dealloc           |
| `ObjCCategoryDecl/ImplDecl`              | Add category to tenv, process methods                                           |
| `ObjCProtocolDecl`                       | Add protocol to tenv, process methods                                           |
| `CXXRecordDecl/RecordDecl`               | Add types to tenv, translate nested non-method decls, then method decls         |
| `VarDecl` (global with init)             | Create a synthetic initializer procedure                                        |
| `CXXMethodDecl/Constructor/Destructor`   | Look up parent class, process method                                            |
| `LinkageSpecDecl/NamespaceDecl`          | Recurse into children                                                           |
| `ClassTemplateDecl/FunctionTemplateDecl` | Translate specializations                                                       |
| `EnumDecl`                               | Process enum constants                                                          |

3. **Creates procedure descriptors (`procdesc`)** via `CMethod_trans.create_local_procdesc`, setting up:
   - Procedure name, formal parameters, return type
   - Attributes (static, virtual, constexpr, etc.)
   - Start node and exit node in the CFG

4. **Translates the method body** via `add_method`:
   - Creates a `CContext.t` with the translation unit context, type env, cfg, procdesc, current class
   - Computes variables-to-destroy maps for C++ destructor injection
   - Calls `CTransImpl.instructions_trans` to translate the body stmt into CFG nodes

**Key files:**

- `infer/src/clang/cFrontend_decl.ml` - declaration dispatch
- `infer/src/clang/cMethod_trans.ml` - method signature creation, procdesc creation, method call resolution
- `infer/src/clang/cMethodSignature.ml` - method signature type
- `infer/src/clang/CType_decl.ml` - type to tenv addition, procname creation
- `infer/src/clang/cType_to_sil_type.ml` - `qual_type` -> `Typ.t` conversion
- `infer/src/clang/cVar_decl.ml` - variable declaration translation
- `infer/src/clang/cField_decl.ml` - field declaration translation
- `infer/src/clang/cEnum_decl.ml` - enum processing
- `infer/src/clang/objcInterface_decl.ml` - ObjC interface processing
- `infer/src/clang/objcProtocol_decl.ml` - ObjC protocol processing
- `infer/src/clang/objcCategory_decl.ml` - ObjC category processing

#### Stage 4b: Instruction-Level Translation (Statements -> SIL)

**Module:** `cTrans.ml` (5555 lines - the largest file in the frontend)

The heart is `instruction_translate`, a massive pattern match that dispatches on the Clang AST `stmt` variant (~200 cases). Each case translates a clang statement/expression into SIL instructions and CFG nodes.

**Translation state** (`CTrans_utils.trans_state`):

```
{ context: CContext.t        -- current translation context
; priority: priority         -- node creation priority control
; succ_nodes: node list      -- successor nodes in CFG
; var_exp_typ: (exp * typ) option  -- temporary for assignment target
; is_objc_getter_setter_call: bool
}
```

**Control flow abstraction** (`CTrans_utils.control`):

```
{ root_nodes: node list   -- entry points of the translated fragment
; leaf_nodes: node list   -- exit points (where successors connect)
; instrs: instr list      -- SIL instructions to add
; initd_exps: exp list    -- initialized expressions (for C++ destructor tracking)
}
```

**Key statement translations:**

| Clang Stmt                         | Target SIL                            | Module function                             |
| ---------------------------------- | ------------------------------------- | ------------------------------------------- |
| `CompoundStmt`                     | Multiple nodes, sequential            | `compoundStmt_trans`                        |
| `BinaryOperator` (assign)          | `Sil.Store`                           | `binaryOperator_trans`                      |
| `BinaryOperator` (arith)           | Pure expression                       | `binaryOperator_trans`                      |
| `CallExpr` / `CXXMemberCallExpr`   | `Sil.Call`                            | `callExpr_trans`, `cxxMemberCallExpr_trans` |
| `ObjCMessageExpr`                  | `Sil.Call` (with selector resolution) | `objCMessageExpr_trans`                     |
| `ReturnStmt`                       | `Sil.Prune` to exit + return value    | `returnStmt_trans`                          |
| `IfStmt`                           | `Sil.Prune` + branch nodes            | `ifStmt_trans`                              |
| `ForStmt` / `WhileStmt` / `DoStmt` | Loop CFG pattern                      | `forStmt_trans`, etc.                       |
| `SwitchStmt`                       | Switch CFG with case dispatch         | `switchStmt_trans`                          |
| `DeclStmt`                         | `Sil.Declare_locals` + init code      | `declStmt_trans`                            |
| `DeclRefExpr`                      | `Exp.Lvar` or `Exp.Const`             | `declRefExpr_trans`                         |
| `MemberExpr`                       | `Exp.Lfield`                          | `memberExpr_trans`                          |
| `ImplicitCastExpr`                 | Appropriate type coercion             | `cast_exprs_trans`                          |
| `CXXConstructExpr`                 | Constructor call SIL                  | `cxxConstructExpr_trans`                    |
| `CXXNewExpr` / `CXXDeleteExpr`     | Malloc/free models                    | `cxxNewExpr_trans`                          |
| `BlockExpr` (ObjC blocks)          | `Exp.Closure`                         | `blockExpr_trans`                           |
| `LambdaExpr` (C++ lambdas)         | Lambda translation                    | `lambdaExpr_trans`                          |
| `CXXBindTemporaryExpr`             | Temporary tracking                    | `cxxBindTemporaryExpr_trans`                |
| `ExprWithCleanups`                 | Destructor injection                  | `exprWithCleanups_trans`                    |
| `CXXForRangeStmt`                  | Desugared to iterator loop            | `cxxForRangeStmt_trans`                     |
| `ObjCForCollectionStmt`            | Fast enumeration loop                 | `objCForCollectionStmt_trans`               |

**PriorityNode system** (`CTrans_utils.PriorityNode`): Prevents creating unnecessary intermediate CFG nodes for pure expressions. Only statements with side effects (stores, calls, branches) create new nodes.

**Destructor injection** (`CScope` + `cTrans.instruction_scope`): After each statement that may contain C++ temporaries or scoped variables, destructors are injected into the CFG.

**Key files:**

- `infer/src/clang/cTrans.ml` - the main instruction translator
- `infer/src/clang/cTrans_utils.ml` - control types, priority nodes, `trans_state`
- `infer/src/clang/cTrans_models.ml` - predefined function models
- `infer/src/clang/cScope.ml` - variable scoping & destructor computation
- `infer/src/clang/cArithmetic_trans.ml` - arithmetic operations
- `infer/src/clang/cLocation.ml` - source location translation
- `infer/src/clang/cGeneral_utils.ml` - misc utilities
- `infer/src/clang/cAst_utils.ml` - AST helper functions

#### Stage 4c: Pre-analyses & Post-processing

After all decls are translated, `cFrontend.do_source_file` runs several pre-analyses on the resulting CFG:

```ocaml
(* ObjC: synthesize dealloc, implicit getters/setters, dynamic dispatch, lifecycle *)
CAddImplicitDeallocImpl.process cfg tenv
CAddImplicitGettersSetters.process cfg tenv
CReplaceDynamicDispatch.process cfg
CViewControllerLifecycle.process cfg tenv
ComputeCapturedInfo.process cfg  (* if enabled *)

(* C++: lambda call operator resolution *)
CppLambdaCalls.process cfg

(* Mock pointer substitution (for testing) *)
CMockPointerSubst.process cfg prefix
```

**Key files:**

- `infer/src/clang/CAddImplicitDeallocImpl.ml`
- `infer/src/clang/CAddImplicitGettersSetters.ml`
- `infer/src/clang/CReplaceDynamicDispatch.ml`
- `infer/src/clang/CViewControllerLifecycle.ml`
- `infer/src/clang/CppLambdaCalls.ml`
- `infer/src/clang/CMockPointerSubst.ml`

---

### Summary: End-to-End Pipeline

```
Source file (foo.c)
    |
    v
[STEP 1] Clang command interception (ClangWrapper)
    |  - clang -### expands driver -> -cc1 commands
    v
[STEP 2] ASTExporter C++ plugin injection (ClangCommand.with_plugin_args)
    |  - Loads BiniouASTExporter plugin into clang
    v
[STEP 3] Clang parses & plugin serializes AST (ASTExporter.h/.cpp)
    |  - Multi-visitor dumps all Decls, Stmts, Types, Attrs
    |  - //@atd annotations define the schema inline
    |  - Output: Biniou binary stream
    v
[STEP 4] OCaml deserialization (Capture.run_clang_frontend)
    |  - Atdgen reads Biniou into Clang_ast_t.decl
    |  - Populates pointer hash tables (ClangPointers)
    v
[STEP 5] Declaration-level translation (cFrontend + cFrontend_decl)
    |  - Walks TranslationUnitDecl child list
    |  - Adds types to Tenv (CType_decl)
    |  - Creates Procdescs for functions/methods (cMethod_trans)
    |  - Translates types: qual_type -> Typ.t (cType_to_sil_type)
    v
[STEP 6] Instruction-level translation (cTrans)
    |  - instruction_translate: ~200-case pattern match on stmt variant
    |  - Generates SIL instructions (Load, Store, Call, Prune, etc.)
    |  - Builds CFG nodes via PriorityNode system
    |  - Injects C++ destructors at scope boundaries
    v
[STEP 7] Pre-analyses (cFrontend.do_source_file)
    |  - ObjC: implicit dealloc, getters/setters, dynamic dispatch
    |  - C++: lambda operator() calls
    |  - Testing: mock pointer substitution
    v
CG + CFG (stored to disk and/or passed to analysis backends)
```

### Architecture Diagram (Module Dependencies)

```
ClangWrapper -> Capture -> ClangCommand
                              |
                        [ASTExporter C++ plugin]
                              |
                              v
                        cFrontend (top-level orchestrator)
                         /                 \
              cFrontend_decl              cTrans
              (declarations)          (instructions)
                    |                      |
          cMethod_trans           cTrans_utils
          CType_decl              cArithmetic_trans
          cType_to_sil_type       cTrans_models
          cVar_decl               cScope
          cField_decl             SwitchCase
          cEnum_decl              CppLambdaCalls
          objcInterface_decl
          objcProtocol_decl        + pre-analyses:
          objcCategory_decl         CAddImplicit*
          objcMethod_decl           CReplaceDynamicDispatch
                                    CViewControllerLifecycle
                    \                /
                     \              /
                      CContext (shared context)
                       |
            CFrontend_config (global state)
            CLocation (source locations)
            CAst_utils, cGeneral_utils
            ClangPointers (node lookup tables)
                       |
            ATDGenerated/Clang_ast_t (OCaml types)
            ATDGenerated/Clang_ast_b (Biniou parser)
```

---
