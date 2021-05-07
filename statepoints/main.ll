; ModuleID = 'main.c'
; source_filename = "main.c"
; target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
; target triple = "x86_64-pc-linux-gnu"

@heapPtr = dso_local global i32* null, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = load i32*, i32** @heapPtr, align 8
  store i32 %3, i32* %4, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bar(i32* %0) #0 gc "statepoint-example" {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  store i32 234, i32* %3, align 4
  %4 = load i32*, i32** %2, align 8
  %5 = load i32, i32* %4, align 4
  call void @foo(i32 %5)
  %6 = load i32*, i32** %2, align 8
  %7 = load i32, i32* %6, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 gc "statepoint-example" {
  %1 = alloca i32, align 4
  %2 = call noalias i8* @malloc(i64 4) #2
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** @heapPtr, align 8
  %4 = load i32*, i32** @heapPtr, align 8
  %5 = getelementptr inbounds i32, i32* %4, i32 1
  store i32* %5, i32** @heapPtr, align 8
  %6 = load i32*, i32** @heapPtr, align 8
  %7 = call i32 @bar(i32* %6)
  store i32 %7, i32* %1, align 4
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161"}
