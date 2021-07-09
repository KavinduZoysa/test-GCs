@_bal_stack_guard = external global i8*
declare void @_bal_panic (i64)
declare i8 addrspace(1)* @_bal_alloc (i64)

define void @foo() {
  ret void
}

define void @_B_main (i8 addrspace(1)* %p) gc "statepoint-example"  {
  %_0 = alloca i8 addrspace(1)*
  %arr = alloca i8 addrspace(1)*
  %_1 = alloca i8
  %_2 = load i8*, i8** @_bal_stack_guard
  %_3 = icmp ult i8* %_1, %_2
  br i1 %_3, label %L2, label %L1
L1:
  %_4 = call i8 addrspace(1)* @_bal_alloc (i64 24)
  call void @foo()
  %_5 = bitcast i8 addrspace(1)* %_4 to [3 x i8 addrspace(1)*] addrspace(1)*

  %_6 = call i8 addrspace(1)* @_bal_alloc (i64 8)
  call void @foo()
  %_7 = bitcast i8 addrspace(1)* %_6 to i64 addrspace(1)*
  store i64 24, i64 addrspace(1)* %_7, align 8
  %_8 = getelementptr i8, i8 addrspace(1)* %_6, i64 504403158265495552
  %_9 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_5, i64 0, i64 0
  store i8 addrspace(1)* %_8, i8 addrspace(1)* addrspace(1)* %_9

  %_10 = call i8 addrspace(1)* @_bal_alloc (i64 8)
  call void @foo()
  %_11 = bitcast i8 addrspace(1)* %_10 to i64 addrspace(1)*
  store i64 25, i64 addrspace(1)* %_11, align 8
  %_12 = getelementptr i8, i8 addrspace(1)* %_10, i64 504403158265495552
  %_13 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_5, i64 0, i64 1
  store i8 addrspace(1)* %_12, i8 addrspace(1)* addrspace(1)* %_13

  %_14 = call i8 addrspace(1)* @_bal_alloc (i64 8)
  call void @foo()
  %_15 = bitcast i8 addrspace(1)* %_14 to i64 addrspace(1)*
  store i64 26, i64 addrspace(1)* %_15, align 8
  %_16 = getelementptr i8, i8 addrspace(1)* %_14, i64 504403158265495552
  %_17 = getelementptr inbounds [3 x i8 addrspace(1)*], [3 x i8 addrspace(1)*] addrspace(1)* %_5, i64 0, i64 2
  store i8 addrspace(1)* %_16, i8 addrspace(1)* addrspace(1)* %_17
  
  %_18 = bitcast [3 x i8 addrspace(1)*] addrspace(1)* %_5 to [0 x i8 addrspace(1)*] addrspace(1)*
  %_19 = call i8 addrspace(1)* @_bal_alloc (i64 24)
  call void @foo()
  %_20 = bitcast i8 addrspace(1)* %_19 to {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*} addrspace(1)*
  %_21 = getelementptr inbounds {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*}, {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*} addrspace(1)* %_20, i64 0, i32 0
  store i64 3, i64 addrspace(1)* %_21
  %_22 = getelementptr inbounds {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*}, {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*} addrspace(1)* %_20, i64 0, i32 1
  store i64 3, i64 addrspace(1)* %_22
  %_23 = getelementptr inbounds {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*}, {i64, i64, [0 x i8 addrspace(1)*] addrspace(1)*} addrspace(1)* %_20, i64 0, i32 2
  store [0 x i8 addrspace(1)*] addrspace(1)* %_18, [0 x i8 addrspace(1)*] addrspace(1)* addrspace(1)* %_23
  %_24 = getelementptr i8, i8 addrspace(1)* %_19, i64 1297036692682702848
  store i8 addrspace(1)* %_24, i8 addrspace(1)** %_0
  %_25 = load i8 addrspace(1)*, i8 addrspace(1)** %_0
  store i8 addrspace(1)* %_25, i8 addrspace(1)** %arr
  ret void
L2:
  call void @_bal_panic (i64 772)
  unreachable
}
