; ModuleID = 'test_withaddrspace.ll'
source_filename = "test_withaddrspace.ll"

@_bal_stack_guard = external global i8*

declare void @_bal_panic(i64)

declare i8 addrspace(1)* @_bal_alloc(i64)

define void @foo() {
  ret void
}

define void @_B_main(i8 addrspace(1)* %p) gc "statepoint-example" {
  %_0 = alloca i8 addrspace(1)*, align 8
  %arr = alloca i8 addrspace(1)*, align 8
  %_1 = alloca i8, align 1
  %_2 = load i8*, i8** @_bal_stack_guard, align 8
  %_3 = icmp ult i8* %_1, %_2
  br i1 %_3, label %L2, label %L1

L1:                                               ; preds = %0
  %statepoint_token = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 24, i32 0, i32 0)
  %_49 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token)
  %statepoint_token10 = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @foo, i32 0, i32 0, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_49) ]
  %_4.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token10, i32 0, i32 0) ; (%_49, %_49)
  %_5 = bitcast i8 addrspace(1)* %_4.relocated to [3 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token11 = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 8, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_4.relocated) ]
  %_612 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token11)
  %_4.relocated13 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token11, i32 0, i32 0) ; (%_4.relocated, %_4.relocated)
  %_5.remat = bitcast i8 addrspace(1)* %_4.relocated13 to [3 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token14 = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @foo, i32 0, i32 0, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_4.relocated13, i8 addrspace(1)* %_612) ]
  %_4.relocated15 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token14, i32 0, i32 0) ; (%_4.relocated13, %_4.relocated13)
  %_6.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token14, i32 1, i32 1) ; (%_612, %_612)
  %_5.remat1 = bitcast i8 addrspace(1)* %_4.relocated15 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_7 = bitcast i8 addrspace(1)* %_6.relocated to i64 addrspace(1)*
  store i64 24, i64 addrspace(1)* %_7, align 8
  %_8 = getelementptr i8, i8 addrspace(1)* %_6.relocated, i64 504403158265495552
  %_9 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_5.remat1, i64 0, i64 0
  store i8 addrspace(1)* %_8, i8 addrspace(1)* addrspace(1)* %_9, align 8
  %statepoint_token16 = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 8, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_4.relocated15) ]
  %_1017 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token16)
  %_4.relocated18 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token16, i32 0, i32 0) ; (%_4.relocated15, %_4.relocated15)
  %_5.remat2 = bitcast i8 addrspace(1)* %_4.relocated18 to [3 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token19 = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @foo, i32 0, i32 0, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_4.relocated18, i8 addrspace(1)* %_1017) ]
  %_4.relocated20 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token19, i32 0, i32 0) ; (%_4.relocated18, %_4.relocated18)
  %_10.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token19, i32 1, i32 1) ; (%_1017, %_1017)
  %_5.remat3 = bitcast i8 addrspace(1)* %_4.relocated20 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_11 = bitcast i8 addrspace(1)* %_10.relocated to i64 addrspace(1)*
  store i64 25, i64 addrspace(1)* %_11, align 8
  %_12 = getelementptr i8, i8 addrspace(1)* %_10.relocated, i64 504403158265495552
  %_13 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_5.remat3, i64 0, i64 1
  store i8 addrspace(1)* %_12, i8 addrspace(1)* addrspace(1)* %_13, align 8
  %statepoint_token21 = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 8, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_4.relocated20) ]
  %_1422 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token21)
  %_4.relocated23 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token21, i32 0, i32 0) ; (%_4.relocated20, %_4.relocated20)
  %_5.remat4 = bitcast i8 addrspace(1)* %_4.relocated23 to [3 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token24 = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @foo, i32 0, i32 0, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_4.relocated23, i8 addrspace(1)* %_1422) ]
  %_4.relocated25 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token24, i32 0, i32 0) ; (%_4.relocated23, %_4.relocated23)
  %_14.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token24, i32 1, i32 1) ; (%_1422, %_1422)
  %_5.remat5 = bitcast i8 addrspace(1)* %_4.relocated25 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_15 = bitcast i8 addrspace(1)* %_14.relocated to i64 addrspace(1)*
  store i64 26, i64 addrspace(1)* %_15, align 8
  %_16 = getelementptr i8, i8 addrspace(1)* %_14.relocated, i64 504403158265495552
  %_17 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_5.remat5, i64 0, i64 2
  store i8 addrspace(1)* %_16, i8 addrspace(1)* addrspace(1)* %_17, align 8
  %_18 = bitcast [3 x i8 addrspace(1)*] addrspace(1)* %_5.remat5 to [0 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token26 = call token (i64, i32, i8 addrspace(1)* (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 2882400000, i32 0, i8 addrspace(1)* (i64)* @_bal_alloc, i32 1, i32 0, i64 24, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_4.relocated25) ]
  %_1927 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token26)
  %_4.relocated28 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token26, i32 0, i32 0) ; (%_4.relocated25, %_4.relocated25)
  %_5.remat6 = bitcast i8 addrspace(1)* %_4.relocated28 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_18.remat = bitcast [3 x i8 addrspace(1)*] addrspace(1)* %_5.remat6 to [0 x i8 addrspace(1)*] addrspace(1)*
  %statepoint_token29 = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @foo, i32 0, i32 0, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %_1927, i8 addrspace(1)* %_4.relocated28) ]
  %_19.relocated = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token29, i32 0, i32 0) ; (%_1927, %_1927)
  %_4.relocated30 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token29, i32 1, i32 1) ; (%_4.relocated28, %_4.relocated28)
  %_5.remat7 = bitcast i8 addrspace(1)* %_4.relocated30 to [3 x i8 addrspace(1)*] addrspace(1)*
  %_18.remat8 = bitcast [3 x i8 addrspace(1)*] addrspace(1)* %_5.remat7 to [0 x i8 addrspace(1)*] addrspace(1)*
  %_20 = bitcast i8 addrspace(1)* %_19.relocated to { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* } addrspace(1)*
  %_21 = getelementptr inbounds { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* }, { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* } addrspace(1)* %_20, i64 0, i32 0
  store i64 3, i64 addrspace(1)* %_21, align 4
  %_22 = getelementptr inbounds { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* }, { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* } addrspace(1)* %_20, i64 0, i32 1
  store i64 3, i64 addrspace(1)* %_22, align 4
  %_23 = getelementptr inbounds { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* }, { i64, i64, [0 x i8 addrspace(1)*] addrspace(1)* } addrspace(1)* %_20, i64 0, i32 2
  store [0 x i8 addrspace(1)*] addrspace(1)* %_18.remat8, [0 x i8 addrspace(1)*] addrspace(1)* addrspace(1)* %_23, align 8
  %_24 = getelementptr i8, i8 addrspace(1)* %_19.relocated, i64 1297036692682702848
  store i8 addrspace(1)* %_24, i8 addrspace(1)** %_0, align 8
  %_25 = load i8 addrspace(1)*, i8 addrspace(1)** %_0, align 8
  store i8 addrspace(1)* %_25, i8 addrspace(1)** %arr, align 8
  ret void

L2:                                               ; preds = %0
  %statepoint_token31 = call token (i64, i32, void (i64)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidi64f(i64 2882400000, i32 0, void (i64)* @_bal_panic, i32 1, i32 0, i64 772, i32 0, i32 0)
  unreachable
}

declare void @__tmp_use(...)

declare token @llvm.experimental.gc.statepoint.p0f_p1i8i64f(i64 immarg, i32 immarg, i8 addrspace(1)* (i64)*, i32 immarg, i32 immarg, ...)

; Function Attrs: nounwind readonly
declare i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token) #0

declare token @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 immarg, i32 immarg, void ()*, i32 immarg, i32 immarg, ...)

; Function Attrs: nounwind readonly
declare i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token, i32 immarg, i32 immarg) #0

declare token @llvm.experimental.gc.statepoint.p0f_isVoidi64f(i64 immarg, i32 immarg, void (i64)*, i32 immarg, i32 immarg, ...)

attributes #0 = { nounwind readonly }
