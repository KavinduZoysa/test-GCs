@_bal_stack_guard = external global i8*
declare void @_bal_panic (i64)
declare i8* @_bal_alloc (i64)
define void @_B_main () {
  %_0 = alloca i8*
  %arr = alloca i8*
  %_1 = alloca i8
  %_2 = load i8*, i8** @_bal_stack_guard
  %_3 = icmp ult i8* %_1, %_2
  br i1 %_3, label %L2, label %L1
L1:
  %_4 = call i8* @_bal_alloc (i64 24)
  %_5 = bitcast i8* %_4 to [3 x i8*]*
  %_6 = call i8* @_bal_alloc (i64 8)
  %_7 = bitcast i8* %_6 to i64*
  store i64 24, i64* %_7, align 8
  %_8 = getelementptr i8, i8* %_6, i64 504403158265495552
  %_9 = getelementptr inbounds [3 x i8*], [3 x i8*]* %_5, i64 0, i64 0
  store i8* %_8, i8** %_9
  %_10 = call i8* @_bal_alloc (i64 8)
  %_11 = bitcast i8* %_10 to i64*
  store i64 25, i64* %_11, align 8
  %_12 = getelementptr i8, i8* %_10, i64 504403158265495552
  %_13 = getelementptr inbounds [3 x i8*], [3 x i8*]* %_5, i64 0, i64 1
  store i8* %_12, i8** %_13
  %_14 = call i8* @_bal_alloc (i64 8)
  %_15 = bitcast i8* %_14 to i64*
  store i64 26, i64* %_15, align 8
  %_16 = getelementptr i8, i8* %_14, i64 504403158265495552
  %_17 = getelementptr inbounds [3 x i8*], [3 x i8*]* %_5, i64 0, i64 2
  store i8* %_16, i8** %_17
  %_18 = bitcast [3 x i8*]* %_5 to [0 x i8*]*
  %_19 = call i8* @_bal_alloc (i64 24)
  %_20 = bitcast i8* %_19 to {i64, i64, [0 x i8*]*}*
  %_21 = getelementptr inbounds {i64, i64, [0 x i8*]*}, {i64, i64, [0 x i8*]*}* %_20, i64 0, i32 0
  store i64 3, i64* %_21
  %_22 = getelementptr inbounds {i64, i64, [0 x i8*]*}, {i64, i64, [0 x i8*]*}* %_20, i64 0, i32 1
  store i64 3, i64* %_22
  %_23 = getelementptr inbounds {i64, i64, [0 x i8*]*}, {i64, i64, [0 x i8*]*}* %_20, i64 0, i32 2
  store [0 x i8*]* %_18, [0 x i8*]** %_23
  %_24 = getelementptr i8, i8* %_19, i64 1297036692682702848
  store i8* %_24, i8** %_0
  %_25 = load i8*, i8** %_0
  store i8* %_25, i8** %arr
  ret void
L2:
  call void @_bal_panic (i64 772)
  unreachable
}
