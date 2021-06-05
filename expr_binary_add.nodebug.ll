target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo(i64 %0, i64 %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %5, i64 %6)
  %8 = extractvalue { i64, i1 } %7, 0
  %9 = extractvalue { i64, i1 } %7, 1
  %10 = xor i1 %9, true
  br i1 %10, label %12, label %11

11:                                               ; preds = %2
  call void @abort()
  unreachable

12:                                               ; preds = %2
  ret i64 %8
}

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

declare void @abort() #2

; attributes #0 = {}
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind  }
