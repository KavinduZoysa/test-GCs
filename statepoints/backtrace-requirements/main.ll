; ModuleID = 'main-dup.c'
source_filename = "main-dup.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"Loc : %p\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo() #0 !dbg !2 {
  %1 = alloca i32, align 4
  %2 = alloca i64*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = call i8* @getCallers(i32 3), !dbg !3
  %6 = bitcast i8* %5 to i64*
  store i64* %6, i64** %2, align 8
  %7 = load i64*, i64** %2, align 8
  %8 = load i64, i64* %7, align 8
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %3, align 4
  store i64 1, i64* %4, align 8
  br label %10

10:                                               ; preds = %21, %0
  %11 = load i64, i64* %4, align 8
  %12 = load i32, i32* %3, align 4
  %13 = sext i32 %12 to i64
  %14 = icmp ule i64 %11, %13
  br i1 %14, label %15, label %24

15:                                               ; preds = %10
  %16 = load i64*, i64** %2, align 8
  %17 = load i64, i64* %4, align 8
  %18 = getelementptr inbounds i64, i64* %16, i64 %17
  %19 = load i64, i64* %18, align 8
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i64 %19)
  br label %21

21:                                               ; preds = %15
  %22 = load i64, i64* %4, align 8
  %23 = add i64 %22, 1
  store i64 %23, i64* %4, align 8
  br label %10

24:                                               ; preds = %10
  %25 = load i32, i32* %1, align 4
  ret i32 %25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata)

declare dso_local i8* @getCallers(i32) #2
declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !4 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = call i32 @foo(), !dbg !5
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, emissionKind: FullDebug)
!1 = !DIFile(filename: "main-dup.c", directory: "/home/kavindu/ballerina/nBalTest/test-gc/statepoints")
!6 = !{i32 2, !"Debug Info Version", i32 3}

!2 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 7, type: !7, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0) ; INFO OF FUNCTION foo()
!7 = !DISubroutineType(types: !8) ; TYPE IS NEED FOR FUNCTION
!8 = !{!9} ; TYPE IS NEED FOR FUNCTION
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed) ; TYPE IS NEED FOR FUNCTION
!3 = !DILocation(line: 8, column: 42, scope: !2) ; LOCATION OF CALL main()
!4 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !7, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0) ; INFO OF FUNCTION main()
!5 = !DILocation(line: 16, column: 5, scope: !4) ; LOCATION OF CALL foo()

