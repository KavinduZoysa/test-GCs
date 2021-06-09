target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo(i64 %0, i64 %1) {
  %3 = sdiv i64 %0, %1
  ret i64 %3
}
