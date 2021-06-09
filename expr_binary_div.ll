target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo(i64 %0, i64 %1) #0 !dbg !2 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %13, label %7

7:                                                ; preds = %2
  %8 = load i64, i64* %3, align 8
  %9 = icmp eq i64 %8, -9223372036854775808
  br i1 %9, label %10, label %14

10:                                               ; preds = %7
  %11 = load i64, i64* %4, align 8
  %12 = icmp eq i64 %11, -1
  br i1 %12, label %13, label %14

13:                                               ; preds = %10, %2
  call void @panic()
  unreachable

14:                                               ; preds = %10, %7
  %15 = load i64, i64* %3, align 8
  %16 = load i64, i64* %4, align 8
  %17 = sdiv i64 %15, %16, !dbg !4
  ret i64 %17
}

declare void @panic() #1

; attributes #0 = {}
attributes #1 = { noreturn nounwind  }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5}
!5 = !{i32 2, !"Debug Info Version", i32 3}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, emissionKind: FullDebug)
!1 = !DIFile(filename: "expr_binary_div.bal", directory: "PATH_TO_BAL_SOURCE")

!2 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 1, type: !3, unit: !0)
!3 = !DISubroutineType(types: !{null})
!4 = !DILocation(line: 2, column: 5, scope: !2)
