; ModuleID = 'main1.ll'
source_filename = "main1.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 gc "statepoint-example" {
  %1 = alloca i8 addrspace(1)*, align 8
  %2 = alloca i8 addrspace(1)*, align 8
  %3 = call noalias i8 addrspace(1)* @malloc(i64 8) #2
  store i8 addrspace(1)* %3, i8 addrspace(1)** %1, align 8
  %4 = load i8 addrspace(1)*, i8 addrspace(1)** %1, align 8
  %5 = call i8 addrspace(1)* @rt_func(i8 addrspace(1)* %4)
  store i8 addrspace(1)* %5, i8 addrspace(1)** %2, align 8
  ret i32 0
}

declare dso_local i8 addrspace(1)* @rt_func(i8 addrspace(1)*) #1

; Function Attrs: nounwind
declare dso_local noalias i8 addrspace(1)* @malloc(i64) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
