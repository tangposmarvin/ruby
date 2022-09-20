# frozen_string_literal: true
# Part of this file is generated by tool/mjit/bindgen.rb.
# Run `make mjit-bindgen` to update code between "MJIT bindgen begin" and "MJIT bindgen end".
module RubyVM::MJIT
  C = Object.new

  class << C
    def ROBJECT_EMBED_LEN_MAX
      Primitive.cexpr! 'INT2NUM(RBIMPL_EMBED_LEN_MAX_OF(VALUE))'
    end

    def cdhash_to_hash(cdhash_addr)
      Primitive.cdhash_to_hash(cdhash_addr)
    end

    def builtin_compiler(f, bf, index, stack_size, builtin_inline_p)
      Primitive.builtin_compile(f, bf.to_i, index, stack_size, builtin_inline_p)
    end

    def has_cache_for_send(cc, insn)
      Primitive.has_cache_for_send(cc.to_i, insn)
    end

    def rb_iseq_check(iseq)
      _iseq_addr = iseq.to_i
      iseq_addr = Primitive.cexpr! 'PTR2NUM((VALUE)rb_iseq_check((rb_iseq_t *)NUM2PTR(_iseq_addr)))'
      rb_iseq_t.new(iseq_addr)
    end

    def rb_iseq_path(iseq)
      _iseq_addr = iseq.to_i
      Primitive.cexpr! 'rb_iseq_path((rb_iseq_t *)NUM2PTR(_iseq_addr))'
    end

    def vm_ci_argc(ci)
      _ci_addr = ci.to_i
      Primitive.cexpr! 'UINT2NUM(vm_ci_argc((CALL_INFO)NUM2PTR(_ci_addr)))'
    end

    def vm_ci_flag(ci)
      _ci_addr = ci.to_i
      Primitive.cexpr! 'UINT2NUM(vm_ci_flag((CALL_INFO)NUM2PTR(_ci_addr)))'
    end

    def rb_splat_or_kwargs_p(ci)
      _ci_addr = ci.to_i
      Primitive.cexpr! 'RBOOL(rb_splat_or_kwargs_p((CALL_INFO)NUM2PTR(_ci_addr)))'
    end

    def fastpath_applied_iseq_p(ci, cc, iseq)
      _ci_addr = ci.to_i
      _cc_addr = cc.to_i
      _iseq_addr = iseq.to_i
      Primitive.cexpr! 'RBOOL(fastpath_applied_iseq_p((CALL_INFO)NUM2PTR(_ci_addr), (CALL_CACHE)NUM2PTR(_cc_addr), (rb_iseq_t *)NUM2PTR(_iseq_addr)))'
    end

    def mjit_opts
      addr = Primitive.cexpr! 'PTR2NUM((VALUE)&mjit_opts)'
      mjit_options.new(addr)
    end

    def mjit_call_attribute_sp_inc(insn, operands)
      _operands_addr = operands.to_i
      Primitive.cexpr! 'LONG2NUM(mjit_call_attribute_sp_inc(NUM2INT(insn), (VALUE *)NUM2PTR(_operands_addr)))'
    end

    def mjit_capture_cc_entries(compiled_body, captured_body)
      _compiled_body_addr = compiled_body.to_i
      _captured_body_addr = captured_body.to_i
      Primitive.cexpr! 'INT2NUM(mjit_capture_cc_entries((struct rb_iseq_constant_body *)NUM2PTR(_compiled_body_addr), (struct rb_iseq_constant_body *)NUM2PTR(_captured_body_addr)))'
    end

    #const struct rb_iseq_constant_body *body, union iseq_inline_storage_entry *is_entries
    def mjit_capture_is_entries(body, is_entries)
      _body_addr = body.to_i
      _is_entries_addr = is_entries.to_i
      Primitive.cstmt! %{
        mjit_capture_is_entries((struct rb_iseq_constant_body *)NUM2PTR(_body_addr), (union iseq_inline_storage_entry *)NUM2PTR(_is_entries_addr));
        return Qnil;
      }
    end

    # Convert encoded VM pointers to insn BINs.
    def rb_vm_insn_decode(encoded)
      Primitive.cexpr! 'INT2NUM(rb_vm_insn_decode(NUM2PTR(encoded)))'
    end

    # Convert insn BINs to encoded VM pointers. This one is not used by the compiler, but useful for debugging.
    def rb_vm_insn_encode(bin)
      Primitive.cexpr! 'PTR2NUM((VALUE)rb_vm_get_insns_address_table()[NUM2INT(bin)])'
    end

    def insn_may_depend_on_sp_or_pc(insn, opes)
      _opes_addr = opes.to_i
      Primitive.cexpr! 'RBOOL(insn_may_depend_on_sp_or_pc(NUM2INT(insn), (VALUE *)NUM2PTR(_opes_addr)))'
    end

    # Convert Integer VALUE to an actual Ruby object
    def to_ruby(value)
      Primitive.cexpr! '(VALUE)NUM2PTR(value)'
    end

    # Convert RubyVM::InstructionSequence to C.rb_iseq_t. Not used by the compiler, but useful for debugging.
    def rb_iseqw_to_iseq(iseqw)
      iseq_addr = Primitive.cexpr! 'PTR2NUM((VALUE)rb_iseqw_to_iseq(iseqw))'
      rb_iseq_t.new(iseq_addr)
    end

    # TODO: remove this after migration
    def fprintf(f, str)
      Primitive.cstmt! %{
        fprintf((FILE *)NUM2PTR(f), "%s", RSTRING_PTR(str));
        return Qnil;
      }
    end

    def rb_cFalseClass; Primitive.cexpr! 'PTR2NUM(rb_cFalseClass)' end
    def rb_cNilClass;   Primitive.cexpr! 'PTR2NUM(rb_cNilClass)'   end
    def rb_cTrueClass;  Primitive.cexpr! 'PTR2NUM(rb_cTrueClass)'  end
    def rb_cInteger;    Primitive.cexpr! 'PTR2NUM(rb_cInteger)'    end
    def rb_cSymbol;     Primitive.cexpr! 'PTR2NUM(rb_cSymbol)'     end
    def rb_cFloat;      Primitive.cexpr! 'PTR2NUM(rb_cFloat)'      end
  end

  ### MJIT bindgen begin ###

  def C.USE_LAZY_LOAD
    Primitive.cexpr! %q{ RBOOL(USE_LAZY_LOAD != 0) }
  end

  def C.USE_RVARGC
    Primitive.cexpr! %q{ RBOOL(USE_RVARGC != 0) }
  end

  def C.NOT_COMPILED_STACK_SIZE
    Primitive.cexpr! %q{ INT2NUM(NOT_COMPILED_STACK_SIZE) }
  end

  def C.VM_CALL_KW_SPLAT
    Primitive.cexpr! %q{ INT2NUM(VM_CALL_KW_SPLAT) }
  end

  def C.VM_CALL_KW_SPLAT_bit
    Primitive.cexpr! %q{ INT2NUM(VM_CALL_KW_SPLAT_bit) }
  end

  def C.VM_CALL_TAILCALL
    Primitive.cexpr! %q{ INT2NUM(VM_CALL_TAILCALL) }
  end

  def C.VM_CALL_TAILCALL_bit
    Primitive.cexpr! %q{ INT2NUM(VM_CALL_TAILCALL_bit) }
  end

  def C.VM_METHOD_TYPE_CFUNC
    Primitive.cexpr! %q{ INT2NUM(VM_METHOD_TYPE_CFUNC) }
  end

  def C.VM_METHOD_TYPE_ISEQ
    Primitive.cexpr! %q{ INT2NUM(VM_METHOD_TYPE_ISEQ) }
  end

  def C.CALL_DATA
    @CALL_DATA ||= self.rb_call_data
  end

  def C.IC
    @IC ||= self.iseq_inline_constant_cache
  end

  def C.IVC
    @IVC ||= self.iseq_inline_iv_cache_entry
  end

  def C.RB_BUILTIN
    @RB_BUILTIN ||= self.rb_builtin_function
  end

  def C.compile_branch
    @compile_branch ||= CType::Struct.new(
      "compile_branch", 8,
      stack_size: [0, CType::Immediate.parse("unsigned int")],
      finish_p: [32, self._Bool],
    )
  end

  def C.compile_status
    @compile_status ||= CType::Struct.new(
      "compile_status", 120,
      success: [0, self._Bool],
      stack_size_for_pos: [64, CType::Pointer.new { CType::Immediate.parse("int") }],
      local_stack_p: [128, self._Bool],
      is_entries: [192, CType::Pointer.new { self.iseq_inline_storage_entry }],
      cc_entries_index: [256, CType::Immediate.parse("int")],
      compiled_iseq: [320, CType::Pointer.new { self.rb_iseq_constant_body }],
      compiled_id: [384, CType::Immediate.parse("int")],
      compile_info: [448, CType::Pointer.new { self.rb_mjit_compile_info }],
      merge_ivar_guards_p: [512, self._Bool],
      ivar_serial: [576, self.rb_serial_t],
      max_ivar_index: [640, CType::Immediate.parse("size_t")],
      inlined_iseqs: [704, CType::Pointer.new { CType::Pointer.new { self.rb_iseq_constant_body } }],
      inline_context: [768, self.inlined_call_context],
    )
  end

  def C.inlined_call_context
    @inlined_call_context ||= CType::Struct.new(
      "inlined_call_context", 24,
      orig_argc: [0, CType::Immediate.parse("int")],
      me: [64, self.VALUE],
      param_size: [128, CType::Immediate.parse("int")],
      local_size: [160, CType::Immediate.parse("int")],
    )
  end

  def C.iseq_inline_constant_cache
    @iseq_inline_constant_cache ||= CType::Struct.new(
      "iseq_inline_constant_cache", 16,
      entry: [0, CType::Pointer.new { self.iseq_inline_constant_cache_entry }],
      segments: [64, CType::Pointer.new { self.ID }],
    )
  end

  def C.iseq_inline_constant_cache_entry
    @iseq_inline_constant_cache_entry ||= CType::Struct.new(
      "iseq_inline_constant_cache_entry", 40,
      flags: [0, self.VALUE],
      value: [64, self.VALUE],
      _unused1: [128, self.VALUE],
      _unused2: [192, self.VALUE],
      ic_cref: [256, CType::Pointer.new { self.rb_cref_t }],
    )
  end

  def C.iseq_inline_iv_cache_entry
    @iseq_inline_iv_cache_entry ||= CType::Struct.new(
      "iseq_inline_iv_cache_entry", 8,
      entry: [0, CType::Pointer.new { self.rb_iv_index_tbl_entry }],
    )
  end

  def C.iseq_inline_storage_entry
    @iseq_inline_storage_entry ||= CType::Union.new(
      "iseq_inline_storage_entry", 16,
      once: CType::Struct.new(
        "", 16,
        running_thread: [0, CType::Pointer.new { self.rb_thread_struct }],
        value: [64, self.VALUE],
      ),
      ic_cache: self.iseq_inline_constant_cache,
      iv_cache: self.iseq_inline_iv_cache_entry,
    )
  end

  def C.mjit_options
    @mjit_options ||= CType::Struct.new(
      "mjit_options", 40,
      on: [0, self._Bool],
      save_temps: [8, self._Bool],
      warnings: [16, self._Bool],
      debug: [24, self._Bool],
      debug_flags: [64, CType::Pointer.new { CType::Immediate.parse("char") }],
      wait: [128, self._Bool],
      min_calls: [160, CType::Immediate.parse("unsigned int")],
      verbose: [192, CType::Immediate.parse("int")],
      max_cache_size: [224, CType::Immediate.parse("int")],
      pause: [256, self._Bool],
      custom: [264, self._Bool],
    )
  end

  def C.rb_builtin_function
    @rb_builtin_function ||= CType::Struct.new(
      "rb_builtin_function", 32,
      func_ptr: [0, CType::Pointer.new { CType::Immediate.parse("void") }],
      argc: [64, CType::Immediate.parse("int")],
      index: [96, CType::Immediate.parse("int")],
      name: [128, CType::Pointer.new { CType::Immediate.parse("char") }],
      compiler: [192, CType::Immediate.parse("void *")],
    )
  end

  def C.rb_call_data
    @rb_call_data ||= CType::Struct.new(
      "rb_call_data", 16,
      ci: [0, CType::Pointer.new { self.rb_callinfo }],
      cc: [64, CType::Pointer.new { self.rb_callcache }],
    )
  end

  def C.rb_callable_method_entry_struct
    @rb_callable_method_entry_struct ||= CType::Struct.new(
      "rb_callable_method_entry_struct", 40,
      flags: [0, self.VALUE],
      defined_class: [64, self.VALUE],
      def: [128, CType::Pointer.new { self.rb_method_definition_struct }],
      called_id: [192, self.ID],
      owner: [256, self.VALUE],
    )
  end

  def C.rb_callcache
    @rb_callcache ||= CType::Struct.new(
      "rb_callcache", 40,
      flags: [0, self.VALUE],
      klass: [64, self.VALUE],
      cme_: [128, CType::Pointer.new { self.rb_callable_method_entry_struct }],
      call_: [192, self.vm_call_handler],
      aux_: [256, CType::Union.new(
        "", 8,
        attr_index: CType::Immediate.parse("unsigned int"),
        method_missing_reason: self.method_missing_reason,
        v: self.VALUE,
      )],
    )
  end

  def C.rb_callinfo
    @rb_callinfo ||= CType::Struct.new(
      "rb_callinfo", 40,
      flags: [0, self.VALUE],
      kwarg: [64, CType::Pointer.new { self.rb_callinfo_kwarg }],
      mid: [128, self.VALUE],
      flag: [192, self.VALUE],
      argc: [256, self.VALUE],
    )
  end

  def C.rb_control_frame_t
    @rb_control_frame_t ||= CType::Struct.new(
      "rb_control_frame_struct", 64,
      pc: [0, CType::Pointer.new { self.VALUE }],
      sp: [64, CType::Pointer.new { self.VALUE }],
      iseq: [128, CType::Pointer.new { self.rb_iseq_t }],
      self: [192, self.VALUE],
      ep: [256, CType::Pointer.new { self.VALUE }],
      block_code: [320, CType::Pointer.new { CType::Immediate.parse("void") }],
      __bp__: [384, CType::Pointer.new { self.VALUE }],
      jit_return: [448, CType::Pointer.new { CType::Immediate.parse("void") }],
    )
  end

  def C.rb_cref_t
    @rb_cref_t ||= CType::Struct.new(
      "rb_cref_struct", 40,
      flags: [0, self.VALUE],
      refinements: [64, self.VALUE],
      klass_or_self: [128, self.VALUE],
      next: [192, CType::Pointer.new { self.rb_cref_struct }],
      scope_visi: [256, self.rb_scope_visibility_t],
    )
  end

  def C.rb_execution_context_struct
    @rb_execution_context_struct ||= CType::Struct.new(
      "rb_execution_context_struct", 1,
      vm_stack: [-1, CType::Pointer.new { self.VALUE }],
      vm_stack_size: [-1, CType::Immediate.parse("size_t")],
      cfp: [-1, CType::Pointer.new { self.rb_control_frame_t }],
      tag: [-1, CType::Pointer.new { self.rb_vm_tag }],
      interrupt_flag: [-1, self.rb_atomic_t],
      interrupt_mask: [-1, self.rb_atomic_t],
      fiber_ptr: [-1, CType::Pointer.new { self.rb_fiber_t }],
      thread_ptr: [-1, CType::Pointer.new { self.rb_thread_struct }],
      local_storage: [-1, CType::Pointer.new { self.rb_id_table }],
      local_storage_recursive_hash: [-1, self.VALUE],
      local_storage_recursive_hash_for_trace: [-1, self.VALUE],
      root_lep: [-1, CType::Pointer.new { self.VALUE }],
      root_svar: [-1, self.VALUE],
      ensure_list: [-1, CType::Pointer.new { self.rb_ensure_list_t }],
      trace_arg: [-1, CType::Pointer.new { self.rb_trace_arg_struct }],
      errinfo: [-1, self.VALUE],
      passed_block_handler: [-1, self.VALUE],
      raised_flag: [-1, CType::Immediate.parse("uint8_t")],
      method_missing_reason: [-1, self.method_missing_reason],
      private_const_reference: [-1, self.VALUE],
      machine: [-1, CType::Struct.new(
        "", 1,
        stack_start: [-1, CType::Pointer.new { self.VALUE }],
        stack_end: [-1, CType::Pointer.new { self.VALUE }],
        stack_maxsize: [-1, CType::Immediate.parse("size_t")],
        regs: [-1, CType::Immediate.parse("int")],
      )],
    )
  end

  def C.rb_execution_context_t
    @rb_execution_context_t ||= self.rb_execution_context_struct
  end

  def C.rb_iseq_constant_body
    @rb_iseq_constant_body ||= CType::Struct.new(
      "rb_iseq_constant_body", 336,
      type: [0, self.rb_iseq_type],
      iseq_size: [32, CType::Immediate.parse("unsigned int")],
      iseq_encoded: [64, CType::Pointer.new { self.VALUE }],
      param: [128, CType::Struct.new(
        "", 48,
        flags: [0, CType::Struct.new(
          "", 4,
          has_lead: [0, CType::BitField.new(1, 0)],
          has_opt: [1, CType::BitField.new(1, 1)],
          has_rest: [2, CType::BitField.new(1, 2)],
          has_post: [3, CType::BitField.new(1, 3)],
          has_kw: [4, CType::BitField.new(1, 4)],
          has_kwrest: [5, CType::BitField.new(1, 5)],
          has_block: [6, CType::BitField.new(1, 6)],
          ambiguous_param0: [7, CType::BitField.new(1, 7)],
          accepts_no_kwarg: [8, CType::BitField.new(1, 0)],
          ruby2_keywords: [9, CType::BitField.new(1, 1)],
        )],
        size: [32, CType::Immediate.parse("unsigned int")],
        lead_num: [64, CType::Immediate.parse("int")],
        opt_num: [96, CType::Immediate.parse("int")],
        rest_start: [128, CType::Immediate.parse("int")],
        post_start: [160, CType::Immediate.parse("int")],
        post_num: [192, CType::Immediate.parse("int")],
        block_start: [224, CType::Immediate.parse("int")],
        opt_table: [256, CType::Pointer.new { self.VALUE }],
        keyword: [320, CType::Pointer.new { self.rb_iseq_param_keyword }],
      )],
      location: [512, self.rb_iseq_location_t],
      insns_info: [960, self.iseq_insn_info],
      local_table: [1216, CType::Pointer.new { self.ID }],
      catch_table: [1280, CType::Pointer.new { self.iseq_catch_table }],
      parent_iseq: [1344, CType::Pointer.new { self.rb_iseq_struct }],
      local_iseq: [1408, CType::Pointer.new { self.rb_iseq_struct }],
      is_entries: [1472, CType::Pointer.new { self.iseq_inline_storage_entry }],
      call_data: [1536, CType::Pointer.new { self.rb_call_data }],
      variable: [1600, CType::Struct.new(
        "", 40,
        flip_count: [0, self.rb_snum_t],
        script_lines: [64, self.VALUE],
        coverage: [128, self.VALUE],
        pc2branchindex: [192, self.VALUE],
        original_iseq: [256, CType::Pointer.new { self.VALUE }],
      )],
      local_table_size: [1920, CType::Immediate.parse("unsigned int")],
      ic_size: [1952, CType::Immediate.parse("unsigned int")],
      ise_size: [1984, CType::Immediate.parse("unsigned int")],
      ivc_size: [2016, CType::Immediate.parse("unsigned int")],
      icvarc_size: [2048, CType::Immediate.parse("unsigned int")],
      ci_size: [2080, CType::Immediate.parse("unsigned int")],
      stack_max: [2112, CType::Immediate.parse("unsigned int")],
      mark_bits: [2176, CType::Union.new(
        "", 8,
        list: CType::Pointer.new { self.iseq_bits_t },
        single: self.iseq_bits_t,
      )],
      catch_except_p: [2240, self._Bool],
      builtin_inline_p: [2248, self._Bool],
      outer_variables: [2304, CType::Pointer.new { self.rb_id_table }],
      mandatory_only_iseq: [2368, CType::Pointer.new { self.rb_iseq_t }],
      jit_func: [2432, CType::Immediate.parse("void *")],
      total_calls: [2496, CType::Immediate.parse("unsigned long")],
      jit_unit: [2560, CType::Pointer.new { self.rb_mjit_unit }],
      yjit_payload: [2624, CType::Pointer.new { CType::Immediate.parse("void") }],
    )
  end

  def C.rb_iseq_location_t
    @rb_iseq_location_t ||= CType::Struct.new(
      "rb_iseq_location_struct", 56,
      pathobj: [0, self.VALUE, true],
      base_label: [64, self.VALUE, true],
      label: [128, self.VALUE, true],
      first_lineno: [192, self.VALUE, true],
      node_id: [256, CType::Immediate.parse("int")],
      code_location: [288, self.rb_code_location_t],
    )
  end

  def C.rb_iseq_struct
    @rb_iseq_struct ||= CType::Struct.new(
      "rb_iseq_struct", 40,
      flags: [0, self.VALUE],
      wrapper: [64, self.VALUE],
      body: [128, CType::Pointer.new { self.rb_iseq_constant_body }],
      aux: [192, CType::Union.new(
        "", 16,
        compile_data: CType::Pointer.new { self.iseq_compile_data },
        loader: CType::Struct.new(
          "", 16,
          obj: [0, self.VALUE],
          index: [64, CType::Immediate.parse("int")],
        ),
        exec: CType::Struct.new(
          "", 16,
          local_hooks: [0, CType::Pointer.new { self.rb_hook_list_struct }],
          global_trace_events: [64, self.rb_event_flag_t],
        ),
      )],
    )
  end

  def C.rb_iseq_t
    @rb_iseq_t ||= self.rb_iseq_struct
  end

  def C.rb_iv_index_tbl_entry
    @rb_iv_index_tbl_entry ||= CType::Struct.new(
      "rb_iv_index_tbl_entry", 24,
      index: [0, CType::Immediate.parse("uint32_t")],
      class_serial: [64, self.rb_serial_t],
      class_value: [128, self.VALUE],
    )
  end

  def C.rb_method_definition_struct
    @rb_method_definition_struct ||= CType::Struct.new(
      "rb_method_definition_struct", 48,
      type: [0, self.rb_method_type_t],
      iseq_overload: [4, CType::BitField.new(1, 4)],
      alias_count: [5, CType::BitField.new(27, 5)],
      complemented_count: [32, CType::BitField.new(28, 0)],
      no_redef_warning: [60, CType::BitField.new(1, 4)],
      body: [64, CType::Union.new(
        "", 24,
        iseq: self.rb_method_iseq_t,
        cfunc: self.rb_method_cfunc_t,
        attr: self.rb_method_attr_t,
        alias: self.rb_method_alias_t,
        refined: self.rb_method_refined_t,
        bmethod: self.rb_method_bmethod_t,
        optimized: self.rb_method_optimized_t,
      )],
      original_id: [256, self.ID],
      method_serial: [320, CType::Immediate.parse("uintptr_t")],
    )
  end

  def C.rb_method_iseq_t
    @rb_method_iseq_t ||= CType::Struct.new(
      "rb_method_iseq_struct", 16,
      iseqptr: [0, CType::Pointer.new { self.rb_iseq_t }],
      cref: [64, CType::Pointer.new { self.rb_cref_t }],
    )
  end

  def C.rb_method_type_t
    @rb_method_type_t ||= CType::Immediate.parse("int")
  end

  def C.rb_mjit_compile_info
    @rb_mjit_compile_info ||= CType::Struct.new(
      "rb_mjit_compile_info", 5,
      disable_ivar_cache: [0, self._Bool],
      disable_exivar_cache: [8, self._Bool],
      disable_send_cache: [16, self._Bool],
      disable_inlining: [24, self._Bool],
      disable_const_cache: [32, self._Bool],
    )
  end

  def C.rb_mjit_unit
    @rb_mjit_unit ||= CType::Struct.new(
      "rb_mjit_unit", 64,
      unode: [0, self.ccan_list_node],
      id: [128, CType::Immediate.parse("int")],
      handle: [192, CType::Pointer.new { CType::Immediate.parse("void") }],
      iseq: [256, CType::Pointer.new { self.rb_iseq_t }],
      used_code_p: [320, self._Bool],
      compact_p: [328, self._Bool],
      compile_info: [336, self.rb_mjit_compile_info],
      cc_entries: [384, CType::Pointer.new { CType::Pointer.new { self.rb_callcache } }],
      cc_entries_size: [448, CType::Immediate.parse("unsigned int")],
    )
  end

  def C.rb_serial_t
    @rb_serial_t ||= CType::Immediate.parse("unsigned long long")
  end

  def C.VALUE
    @VALUE ||= CType::Immediate.find(Primitive.cexpr!("SIZEOF(VALUE)"), Primitive.cexpr!("SIGNED_TYPE_P(VALUE)"))
  end

  def C._Bool
    CType::Bool.new
  end

  def C.ID
    CType::Stub.new(:ID)
  end

  def C.rb_thread_struct
    CType::Stub.new(:rb_thread_struct)
  end

  def C.vm_call_handler
    CType::Stub.new(:vm_call_handler)
  end

  def C.method_missing_reason
    CType::Stub.new(:method_missing_reason)
  end

  def C.rb_callinfo_kwarg
    CType::Stub.new(:rb_callinfo_kwarg)
  end

  def C.rb_cref_struct
    CType::Stub.new(:rb_cref_struct)
  end

  def C.rb_scope_visibility_t
    CType::Stub.new(:rb_scope_visibility_t)
  end

  def C.rb_vm_tag
    CType::Stub.new(:rb_vm_tag)
  end

  def C.rb_atomic_t
    CType::Stub.new(:rb_atomic_t)
  end

  def C.rb_fiber_t
    CType::Stub.new(:rb_fiber_t)
  end

  def C.rb_id_table
    CType::Stub.new(:rb_id_table)
  end

  def C.rb_ensure_list_t
    CType::Stub.new(:rb_ensure_list_t)
  end

  def C.rb_trace_arg_struct
    CType::Stub.new(:rb_trace_arg_struct)
  end

  def C.rb_iseq_type
    CType::Stub.new(:rb_iseq_type)
  end

  def C.rb_iseq_param_keyword
    CType::Stub.new(:rb_iseq_param_keyword)
  end

  def C.iseq_insn_info
    CType::Stub.new(:iseq_insn_info)
  end

  def C.iseq_catch_table
    CType::Stub.new(:iseq_catch_table)
  end

  def C.rb_snum_t
    CType::Stub.new(:rb_snum_t)
  end

  def C.iseq_bits_t
    CType::Stub.new(:iseq_bits_t)
  end

  def C.rb_code_location_t
    CType::Stub.new(:rb_code_location_t)
  end

  def C.iseq_compile_data
    CType::Stub.new(:iseq_compile_data)
  end

  def C.rb_hook_list_struct
    CType::Stub.new(:rb_hook_list_struct)
  end

  def C.rb_event_flag_t
    CType::Stub.new(:rb_event_flag_t)
  end

  def C.rb_method_cfunc_t
    CType::Stub.new(:rb_method_cfunc_t)
  end

  def C.rb_method_attr_t
    CType::Stub.new(:rb_method_attr_t)
  end

  def C.rb_method_alias_t
    CType::Stub.new(:rb_method_alias_t)
  end

  def C.rb_method_refined_t
    CType::Stub.new(:rb_method_refined_t)
  end

  def C.rb_method_bmethod_t
    CType::Stub.new(:rb_method_bmethod_t)
  end

  def C.rb_method_optimized_t
    CType::Stub.new(:rb_method_optimized_t)
  end

  def C.ccan_list_node
    CType::Stub.new(:ccan_list_node)
  end

  ### MJIT bindgen end ###
end if RubyVM::MJIT.enabled?