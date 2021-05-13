; ModuleID = 'main.ll'
source_filename = "main.ll"

@heapPtr = dso_local global i32* null, align 8

@.str = private unnamed_addr constant [3 x i8] c"%p\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

%struct.anon = type { i32, i32, i32, i32, i32 }
@__LLVM_StackMaps = external constant %struct.anon, align 4

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
  %statepoint_token = call token (i64, i32, void (i32)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidi32f(i64 2882400000, i32 0, void (i32)* @foo, i32 1, i32 0, i32 %5, i32 0, i32 0)
  %6 = load i32*, i32** %2, align 8
  %7 = load i32, i32* %6, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 gc "statepoint-example" {
  %1 = alloca i32, align 4
  %2 = call i8* @malloc(i64 4) #3
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** @heapPtr, align 8
  %4 = load i32*, i32** @heapPtr, align 8
  %5 = getelementptr inbounds i32, i32* %4, i32 1
  store i32* %5, i32** @heapPtr, align 8
  %6 = load i32*, i32** @heapPtr, align 8
  %statepoint_token = call token (i64, i32, i32 (i32*)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_i32p0i32f(i64 2882400000, i32 0, i32 (i32*)* @bar, i32 1, i32 0, i32* %6, i32 0, i32 0)
  %7 = call i32 @llvm.experimental.gc.result.i32(token %statepoint_token)
  store i32 %7, i32* %1, align 4
  %"%8" = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @__LLVM_StackMaps, i32 0, i32 0), align 4
  %"%9" = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %"%8")
  %"%10" = bitcast %struct.anon* @__LLVM_StackMaps to i32*
  %"%11" = call i32 (i8*, ...)  @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %"%10") #1
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i8* @malloc(i64) #1

declare dso_local i32 @printf(i8*, ...) #1

declare token @llvm.experimental.gc.statepoint.p0f_isVoidi32f(i64 immarg, i32 immarg, void (i32)*, i32 immarg, i32 immarg, ...)

declare token @llvm.experimental.gc.statepoint.p0f_i32p0i32f(i64 immarg, i32 immarg, i32 (i32*)*, i32 immarg, i32 immarg, ...)

; Function Attrs: nounwind readonly
declare i32 @llvm.experimental.gc.result.i32(token) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161"}
