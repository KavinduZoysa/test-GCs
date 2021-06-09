target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo(i64 %0, i64 %1) !dbg !2 {
  %3 = sdiv i64 %0, %1, !dbg !4
  ret i64 %3
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5}
!5 = !{i32 2, !"Debug Info Version", i32 3}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, emissionKind: FullDebug)
!1 = !DIFile(filename: "expr_binary_div.bal", directory: "PATH_TO_BAL_SOURCE")

!2 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 1, type: !3, unit: !0)
!3 = !DISubroutineType(types: !{null})
!4 = !DILocation(line: 2, column: 5, scope: !2)
