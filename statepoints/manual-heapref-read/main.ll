; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.StackMap = type { i32, i32, i32 }

@__LLVM_StackMaps = external dso_local constant %struct.StackMap, align 4
@loc = dso_local global [2 x i32] zeroinitializer, align 4, !dbg !0
@.str = private unnamed_addr constant [22 x i8] c"value in loc2 : %lu\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"value in loc1 : %lu\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"Stack address of heapPtr1 : %p\0A\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo() #0 !dbg !23 {
  %1 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %1, metadata !26, metadata !DIExpression()), !dbg !29
  %2 = call noalias i8* @malloc(i64 8) #5, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %1, align 8, !dbg !29
  %4 = load i32*, i32** %1, align 8, !dbg !31
  store i32 345, i32* %4, align 4, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bar()  #0 gc "statepoint-example" !dbg !34 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i32* %1, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 34, i32* %1, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %2, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 34, i32* %2, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %3, metadata !39, metadata !DIExpression()), !dbg !41
  store i64 34, i64* %3, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i64** %4, metadata !42, metadata !DIExpression()), !dbg !43
  %7 = call noalias i8* @malloc(i64 8) #5, !dbg !44
  %8 = bitcast i8* %7 to i64*, !dbg !44
  store i64* %8, i64** %4, align 8, !dbg !43
  %9 = load i64*, i64** %4, align 8, !dbg !45
  store i64 7, i64* %9, align 8, !dbg !46
  call void @foo(), !dbg !47
  call void @readStackMap(i64* bitcast (%struct.StackMap* @__LLVM_StackMaps to i64*), i32* getelementptr inbounds ([2 x i32], [2 x i32]* @loc, i64 0, i64 0)), !dbg !48
  call void @llvm.dbg.declare(metadata i64** %5, metadata !49, metadata !DIExpression()), !dbg !50
  %10 = call i64 @llvm.read_register.i64(metadata !18), !dbg !51
  %11 = inttoptr i64 %10 to i8*, !dbg !52
  %12 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @loc, i64 0, i64 0), align 4, !dbg !53
  %13 = sext i32 %12 to i64, !dbg !54
  %14 = getelementptr inbounds i8, i8* %11, i64 %13, !dbg !54
  %15 = bitcast i8* %14 to i64*, !dbg !55
  store i64* %15, i64** %5, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i64** %6, metadata !56, metadata !DIExpression()), !dbg !57
  %16 = call i64 @llvm.read_register.i64(metadata !18), !dbg !58
  %17 = inttoptr i64 %16 to i8*, !dbg !59
  %18 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @loc, i64 0, i64 1), align 4, !dbg !60
  %19 = sext i32 %18 to i64, !dbg !61
  %20 = getelementptr inbounds i8, i8* %17, i64 %19, !dbg !61
  %21 = bitcast i8* %20 to i64*, !dbg !62
  store i64* %21, i64** %6, align 8, !dbg !57
  %22 = load i64*, i64** %5, align 8, !dbg !63
  %23 = load i64, i64* %22, align 8, !dbg !64
  %24 = inttoptr i64 %23 to i64*, !dbg !65
  %25 = load i64, i64* %24, align 8, !dbg !66
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i64 %25), !dbg !67
  %27 = load i64*, i64** %6, align 8, !dbg !68
  %28 = load i64, i64* %27, align 8, !dbg !69
  %29 = inttoptr i64 %28 to i64*, !dbg !70
  %30 = load i64, i64* %29, align 8, !dbg !71
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i64 %30), !dbg !72
  ret void, !dbg !73
}

declare dso_local void @readStackMap(i64*, i32*) #3

; Function Attrs: nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #4

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 gc "statepoint-example" !dbg !74 {
  %1 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %1, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = call noalias i8* @malloc(i64 8) #5, !dbg !79
  %3 = bitcast i8* %2 to i64*, !dbg !79
  store i64* %3, i64** %1, align 8, !dbg !78
  %4 = load i64*, i64** %1, align 8, !dbg !80
  store i64 4, i64* %4, align 8, !dbg !81
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i64 0, i64 0), i64** %1), !dbg !82
  call void @bar(), !dbg !83
  ret i32 0, !dbg !84
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.named.register.rsp = !{!18}
!llvm.module.flags = !{!19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "loc", scope: !2, file: !3, line: 16, type: !14, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "main.c", directory: "/home/kavindu/ballerina/nBalTest/test-gc/statepoints")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 55, baseType: !9)
!8 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!9 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 48, baseType: !12)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !{!0}
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 64, elements: !16)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!17}
!17 = !DISubrange(count: 2)
!18 = !{!"rsp"}
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{!"Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161"}
!23 = distinct !DISubprogram(name: "foo", scope: !3, file: !3, line: 20, type: !24, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "heapPtr3", scope: !23, file: !3, line: 22, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !8, line: 38, baseType: !15)
!29 = !DILocation(line: 22, column: 14, scope: !23)
!30 = !DILocation(line: 22, column: 25, scope: !23)
!31 = !DILocation(line: 23, column: 6, scope: !23)
!32 = !DILocation(line: 23, column: 15, scope: !23)
!33 = !DILocation(line: 24, column: 1, scope: !23)
!34 = distinct !DISubprogram(name: "bar", scope: !3, file: !3, line: 26, type: !24, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DILocalVariable(name: "xx", scope: !34, file: !3, line: 27, type: !15)
!36 = !DILocation(line: 27, column: 9, scope: !34)
!37 = !DILocalVariable(name: "yy", scope: !34, file: !3, line: 28, type: !15)
!38 = !DILocation(line: 28, column: 9, scope: !34)
!39 = !DILocalVariable(name: "zz", scope: !34, file: !3, line: 29, type: !40)
!40 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!41 = !DILocation(line: 29, column: 10, scope: !34)
!42 = !DILocalVariable(name: "heapPtr2", scope: !34, file: !3, line: 30, type: !6)
!43 = !DILocation(line: 30, column: 15, scope: !34)
!44 = !DILocation(line: 30, column: 26, scope: !34)
!45 = !DILocation(line: 31, column: 6, scope: !34)
!46 = !DILocation(line: 31, column: 15, scope: !34)
!47 = !DILocation(line: 33, column: 5, scope: !34)
!48 = !DILocation(line: 34, column: 5, scope: !34)
!49 = !DILocalVariable(name: "locHeapPtr2", scope: !34, file: !3, line: 35, type: !6)
!50 = !DILocation(line: 35, column: 15, scope: !34)
!51 = !DILocation(line: 35, column: 54, scope: !34)
!52 = !DILocation(line: 35, column: 43, scope: !34)
!53 = !DILocation(line: 35, column: 60, scope: !34)
!54 = !DILocation(line: 35, column: 58, scope: !34)
!55 = !DILocation(line: 35, column: 29, scope: !34)
!56 = !DILocalVariable(name: "locHeapPtr1", scope: !34, file: !3, line: 36, type: !6)
!57 = !DILocation(line: 36, column: 15, scope: !34)
!58 = !DILocation(line: 36, column: 54, scope: !34)
!59 = !DILocation(line: 36, column: 43, scope: !34)
!60 = !DILocation(line: 36, column: 60, scope: !34)
!61 = !DILocation(line: 36, column: 58, scope: !34)
!62 = !DILocation(line: 36, column: 29, scope: !34)
!63 = !DILocation(line: 40, column: 55, scope: !34)
!64 = !DILocation(line: 40, column: 54, scope: !34)
!65 = !DILocation(line: 40, column: 41, scope: !34)
!66 = !DILocation(line: 40, column: 39, scope: !34)
!67 = !DILocation(line: 40, column: 5, scope: !34)
!68 = !DILocation(line: 41, column: 55, scope: !34)
!69 = !DILocation(line: 41, column: 54, scope: !34)
!70 = !DILocation(line: 41, column: 41, scope: !34)
!71 = !DILocation(line: 41, column: 39, scope: !34)
!72 = !DILocation(line: 41, column: 5, scope: !34)
!73 = !DILocation(line: 46, column: 1, scope: !34)
!74 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 48, type: !75, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!15}
!77 = !DILocalVariable(name: "heapPtr1", scope: !74, file: !3, line: 49, type: !6)
!78 = !DILocation(line: 49, column: 15, scope: !74)
!79 = !DILocation(line: 49, column: 26, scope: !74)
!80 = !DILocation(line: 50, column: 6, scope: !74)
!81 = !DILocation(line: 50, column: 15, scope: !74)
!82 = !DILocation(line: 51, column: 5, scope: !74)
!83 = !DILocation(line: 52, column: 5, scope: !74)
!84 = !DILocation(line: 54, column: 1, scope: !74)
