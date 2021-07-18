; ModuleID = 'test_withaddrspace.ll'
source_filename = "test_withaddrspace_opt.ll"

@_bal_stack_guard = external global i8*
@__LLVM_StackMaps = external constant i8, align 4

declare void @_bal_panic(i64)

declare i8 addrspace(1)* @_bal_alloc(i64)

declare void @_Bio__println(i8 addrspace(1)*)

declare void @read_stackmap(i8*)

declare void @dummy_func()

define i8* @get_stackmap_pointer() {
  ret i8* @__LLVM_StackMaps
}

define void @_B_main() gc "statepoint-example" {
  %_0 = alloca i8 addrspace(1)*, align 8
  %_1 = alloca i8*, align 8
  %_2 = alloca i8, align 1
  %_3 = load i8*, i8** @_bal_stack_guard, align 8
  %_rsp = call i64 @llvm.read_register.i64(metadata !0)
  %_4 = icmp ult i8* %_2, %_3
  br i1 %_4, label %L2, label %L1

L1:                                               ; preds = %0
  %statepoint_token = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 24, i32 0, i32 0)
  %_57 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token)
  %statepoint_token8 = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @dummy_func, i32 0, i32 0, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_57) ]
  %_5.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token8, i32 0, i32 0) ; (%_57, %_57)
  %_6 = bitcast i8 addrspace(1)* %_5.relocated to [3 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token9 = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 8, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_5.relocated) ]
  %_710 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token9)
  %_5.relocated11 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token9, i32 0, i32 0) ; (%_5.relocated, %_5.relocated)
  %_6.remat = bitcast i8 addrspace(1)* %_5.relocated11 to [3 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token12 = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @dummy_func, i32 0, i32 0, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_5.relocated11, i8 addrspace(1)* %_710) ]
  %_5.relocated13 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token12, i32 0, i32 0) ; (%_5.relocated11, %_5.relocated11)
  %_7.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token12, i32 1, i32 1) ; (%_710, %_710)
  %_6.remat1 = bitcast i8 addrspace(1)* %_5.relocated13 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_8 = bitcast i8 addrspace(1)* %_7.relocated to i64 addrspace(1)*
  store i64 1, i64 addrspace(1)* %_8, align 8
  %_9 = getelementptr i8, i8 addrspace(1)* %_7.relocated, i64 504403158265495552
  %_10 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_6.remat1, i64 0, i64 0
  store i8 addrspace(1)* %_9, i8 addrspace(1)* addrspace(1)* %_10, align 8
  %statepoint_token14 = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 8, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_5.relocated13) ]
  %_1115 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token14)
  %_5.relocated16 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token14, i32 0, i32 0) ; (%_5.relocated13, %_5.relocated13)
  %_6.remat2 = bitcast i8 addrspace(1)* %_5.relocated16 to [3 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token17 = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @dummy_func, i32 0, i32 0, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_5.relocated16, i8 addrspace(1)* %_1115) ]
  %_5.relocated18 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token17, i32 0, i32 0) ; (%_5.relocated16, %_5.relocated16)
  %_11.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token17, i32 1, i32 1) ; (%_1115, %_1115)
  %_6.remat3 = bitcast i8 addrspace(1)* %_5.relocated18 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_12 = bitcast i8 addrspace(1)* %_11.relocated to i64 addrspace(1)*
  store i64 2, i64 addrspace(1)* %_12, align 8
  %_13 = getelementptr i8, i8 addrspace(1)* %_11.relocated, i64 504403158265495552
  %_14 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_6.remat3, i64 0, i64 1
  store i8 addrspace(1)* %_13, i8 addrspace(1)* addrspace(1)* %_14, align 8
  %statepoint_token19 = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 8, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_5.relocated18) ]
  %_1520 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token19)
  %_5.relocated21 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token19, i32 0, i32 0) ; (%_5.relocated18, %_5.relocated18)
  %_6.remat4 = bitcast i8 addrspace(1)* %_5.relocated21 to [3 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token22 = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @dummy_func, i32 0, i32 0, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_5.relocated21, i8 addrspace(1)* %_1520) ]
  %_5.relocated23 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token22, i32 0, i32 0) ; (%_5.relocated21, %_5.relocated21)
  %_15.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token22, i32 1, i32 1) ; (%_1520, %_1520)
  %_6.remat5 = bitcast i8 addrspace(1)* %_5.relocated23 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_16 = bitcast i8 addrspace(1)* %_15.relocated to i64 addrspace(1)*
  store i64 3, i64 addrspace(1)* %_16, align 8
  %_17 = getelementptr i8, i8 addrspace(1)* %_15.relocated, i64 504403158265495552
  %_18 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_6.remat5, i64 0, i64 2
  store i8 addrspace(1)* %_17, i8 addrspace(1)* addrspace(1)* %_18, align 8
  %_19 = bitcast [3 x i8 addrspace(1)*] addrspace(1)* %_6.remat5 to [0 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token24 = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 24, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_5.relocated23) ]
  %_2025 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token24)
  %_5.relocated26 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token24, i32 0, i32 0) ; (%_5.relocated23, %_5.relocated23)
  %_6.remat6 = bitcast i8 addrspace(1)* %_5.relocated26 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_19.remat = bitcast [3 x i8 addrspace(1)*] addrspace(1)* %_6.remat6 to [0 x i8 addrspace(1)*] addrspace(1)*
  %_21 = bitcast i8 addrspace(1)* %_2025 to { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* } addrspace(1)*
  %_22 = getelementptr inbounds { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* }, { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* } addrspace(1)* %_21, i64 0, i32 0
  store i64 3, i64 addrspace(1)* %_22, align 4
  %_23 = getelementptr inbounds { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* }, { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* } addrspace(1)* %_21, i64 0, i32 1
  store i64 3, i64 addrspace(1)* %_23, align 4
  %_24 = getelementptr inbounds { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* }, { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* } addrspace(1)* %_21, i64 0, i32 2
  store [0 x i8 addrspace(1)*] addrspace(1)* %_19.remat, [0 x i8 addrspace(1)*] addrspace(1)* addrspace(1)* %_24, align 8
  %_25 = getelementptr i8, i8 addrspace(1)* %_2025, i64 1297036692682702848
  store i8 addrspace(1)* %_25, i8 addrspace(1)** %_0, align 8
  %_26 = load i8 addrspace(1)*, i8 addrspace(1)** %_0, align 8
  %statepoint_token27 = call token (i64, i32, void (i8 addrspace(1)*)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidp1i8f(i64 2882400000, i32 0, void (i8 addrspace(1)*)* @_Bio__println, i32 1, i32 0, i8 addrspace(1)* %_26, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_26) ]
  %_26.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token27, i32 0, i32 0) ; (%_26, %_26)
  store i8* null, i8** %_1, align 8
  ret void

L2:                                               ; preds = %0
  %statepoint_token28 = call token (i64, i32, void (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidi64f(i64 2882400000, i32 0, void (i64)* @_bal_panic, i32 1, i32 0, i64 772, i32 0, i32 0)
  unreachable
}

; Function Attrs: nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #0

declare void @__tmp_use(...)

declare token @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 immarg, i32 immarg, i8 addrspace(1)* (i64)*, i32 immarg, i32 immarg, ...)

; Function Attrs: nounwind readonly
declare i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token) #0

declare token @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 immarg, i32 immarg, void ()*, i32 immarg, i32 immarg, ...)

; Function Attrs: nounwind readonly
declare i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token, i32 immarg, i32 immarg) #0

declare token @llvm.experimental.gc.statepoint.p0f_isVoidp1i8f(i64 immarg, i32 immarg, void (i8 addrspace(1)*)*, i32 immarg, i32 immarg, ...)

declare token @llvm.experimental.gc.statepoint.p0f_isVoidi64f(i64 immarg, i32 immarg, void (i64)*, i32 immarg, i32 immarg, ...)

attributes #0 = { nounwind readonly }

!llvm.named.register.rsp = !{!0}
!llvm.module.flags = !{!1}
!llvm.ident = !{!2}

!0 = !{!"rsp"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
