target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo(i64 %0, i64 %1) #0 {
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
  call void @abort()
  unreachable

14:                                               ; preds = %10, %7
  %15 = load i64, i64* %3, align 8
  %16 = load i64, i64* %4, align 8
  %17 = sdiv i64 %15, %16
  ret i64 %17
}

declare void @abort() #1

; attributes #0 = {}
attributes #1 = { noreturn nounwind  }
