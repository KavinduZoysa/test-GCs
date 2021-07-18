@_bal_stack_guard = external global i8*
declare void @_bal_panic (i64)
declare i8 addrspace(1)* @_bal_alloc (i64)
declare void @_Bio__println (i8 addrspace(1)*)

@__LLVM_StackMaps = external constant i8, align 4

declare void @read_stackmap(i8*)

; declare void @call_for_mark_roots(i64)

declare void @dummy_func()

define i8* @get_stackmap_pointer() {
  ret i8* @__LLVM_StackMaps
}

define void @_B_main () gc "statepoint-example" {
  %_0 = alloca i8 addrspace(1)*
  %_1 = alloca i8*
  %_2 = alloca i8
  %_3 = load i8*, i8** @_bal_stack_guard
  %_4 = icmp ult i8* %_2, %_3
  %"_rsp" = call i64 @llvm.read_register.i64(metadata !0)
  br i1 %_4, label %L2, label %L1
L1:
  %_5 = call i8 addrspace(1)* @_bal_alloc (i64 24)
  call void @dummy_func()
  %_6 = bitcast i8 addrspace(1)* %_5 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_7 = call i8 addrspace(1)* @_bal_alloc (i64 8)
  call void @dummy_func()
  %_8 = bitcast i8 addrspace(1)* %_7 to i64 addrspace(1)*
  store i64 1, i64 addrspace(1)* %_8, align 8
  %_9 = getelementptr i8, i8 addrspace(1)* %_7, i64 504403158265495552
  %_10 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_6, i64 0, i64 0
  store i8 addrspace(1)* %_9, i8 addrspace(1)* addrspace(1)* %_10
  %_11 = call i8 addrspace(1)* @_bal_alloc (i64 8)
  call void @dummy_func()
  %_12 = bitcast i8 addrspace(1)* %_11 to i64 addrspace(1)*
  store i64 2, i64 addrspace(1)* %_12, align 8
  %_13 = getelementptr i8, i8 addrspace(1)* %_11, i64 504403158265495552
  %_14 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_6, i64 0, i64 1
  store i8 addrspace(1)* %_13, i8 addrspace(1)* addrspace(1)* %_14
  %_15 = call i8 addrspace(1)* @_bal_alloc (i64 8)
  call void @dummy_func()
  %_16 = bitcast i8 addrspace(1)* %_15 to i64 addrspace(1)*
  store i64 3, i64 addrspace(1)* %_16, align 8
  %_17 = getelementptr i8, i8 addrspace(1)* %_15, i64 504403158265495552
  %_18 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_6, i64 0, i64 2
  store i8 addrspace(1)* %_17, i8 addrspace(1)* addrspace(1)* %_18
  %_19 = bitcast [3 x i8 addrspace(1)*] addrspace(1)* %_6 to [0 x i8 addrspace(1)*] addrspace(1)*
  %_20 = call i8 addrspace(1)* @_bal_alloc (i64 24)
  %_21 = bitcast i8 addrspace(1)* %_20 to {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*} addrspace(1)*
  %_22 = getelementptr inbounds {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*}, {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*} addrspace(1)* %_21, i64 0, i32 0
  store i64 3, i64 addrspace(1)* %_22
  %_23 = getelementptr inbounds {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*}, {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*} addrspace(1)* %_21, i64 0, i32 1
  store i64 3, i64 addrspace(1)* %_23
  %_24 = getelementptr inbounds {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*}, {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*} addrspace(1)* %_21, i64 0, i32 2
  store [0 x i8 addrspace(1)*] addrspace(1)* %_19, [0 x i8 addrspace(1)*] addrspace(1)* addrspace(1)* %_24
  %_25 = getelementptr i8, i8 addrspace(1)* %_20, i64 1297036692682702848
  store i8 addrspace(1)* %_25, i8 addrspace(1)** %_0
  %_26 = load i8 addrspace(1)*, i8 addrspace(1)** %_0
  call void @_Bio__println (i8 addrspace(1)* %_26)
  store i8* null, i8** %_1
  ret void
L2:
  call void @_bal_panic (i64 772)
  unreachable
}

declare i64 @llvm.read_register.i64(metadata)

!llvm.named.register.rsp = !{!0}
!llvm.module.flags = !{!1}
!llvm.ident = !{!2}

!0 = !{!"rsp"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
