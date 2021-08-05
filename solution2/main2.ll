; ModuleID = 'testx.ll'
source_filename = "testx.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__LLVM_StackMaps = external constant i8, align 4

define i8* @get_stackmap_pointer() {
  ret i8* @__LLVM_StackMaps
}

declare dso_local i8 addrspace(1)* @foo(i8 addrspace(1)*)

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 gc "statepoint-example" {
  %1 = alloca i8 addrspace(1)*, align 8
  %2 = alloca i8 addrspace(1)*, align 8
  %3 = call i8 addrspace(1)* @malloc(i64 8) #3
  store i8 addrspace(1)* %3, i8 addrspace(1)** %1, align 8
  %4 = load i8 addrspace(1)*, i8 addrspace(1)** %1, align 8
  %statepoint_token = call token (i64, i32, i8 addrspace(1)* (i8 addrspace(1)*)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_p1i8p1i8f(i64 2882400000, i32 0, i8 addrspace(1)* (i8 addrspace(1)*)* @foo, i32 1, i32 0, i8 addrspace(1)* %4, i32 0, i32 0) [ "gc-live"(i8 addrspace(1)* %4) ]
  %5 = call i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token %statepoint_token)
  %6 = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token %statepoint_token, i32 0, i32 0) ; (%4, %4)
  store i8 addrspace(1)* %5, i8 addrspace(1)** %2, align 8
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i8 addrspace(1)* @malloc(i64) #1

declare void @__tmp_use(...)

declare token @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 immarg, i32 immarg, void ()*, i32 immarg, i32 immarg, ...)

; Function Attrs: nounwind readonly
declare i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token, i32 immarg, i32 immarg) #2

declare token @llvm.experimental.gc.statepoint.p0f_p1i8p1i8f(i64 immarg, i32 immarg, i8 addrspace(1)* (i8 addrspace(1)*)*, i32 immarg, i32 immarg, ...)

; Function Attrs: nounwind readonly
declare i8 addrspace(1)* @llvm.experimental.gc.result.p1i8(token) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
