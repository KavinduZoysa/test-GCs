; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.StackMap = type { i32, i32, i32 }

@.str = private unnamed_addr constant [15 x i8] c"call loc : %p\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"(uint8_t*)rsp : %p\0A\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"1 : %lu\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"2 : %lu\0A\00", align 1
@__LLVM_StackMaps = external dso_local constant %struct.StackMap, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @baz() #0 !dbg !16 {
  ret void, !dbg !19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo() #0 gc "statepoint-example" !dbg !20 {
  %1 = alloca i32*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %1, metadata !21, metadata !DIExpression()), !dbg !25
  %4 = call noalias i8* @malloc(i64 8) #5, !dbg !26
  %5 = bitcast i8* %4 to i32*, !dbg !26
  store i32* %5, i32** %1, align 8, !dbg !25
  %6 = load i32*, i32** %1, align 8, !dbg !27
  store i32 5, i32* %6, align 4, !dbg !28
  call void @baz(), !dbg !29
  call void @llvm.dbg.declare(metadata i8** %2, metadata !30, metadata !DIExpression()), !dbg !32
  %7 = call i8* @getCallers(i32 3), !dbg !33
  store i8* %7, i8** %2, align 8, !dbg !32
  %8 = load i8*, i8** %2, align 8, !dbg !34
  %9 = bitcast i8* %8 to i64*, !dbg !35
  %10 = load i64, i64* %9, align 8, !dbg !36
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 %10), !dbg !37
  %12 = load i8*, i8** %2, align 8, !dbg !38
  %13 = bitcast i8* %12 to i64*, !dbg !39
  %14 = getelementptr inbounds i64, i64* %13, i64 1, !dbg !40
  %15 = load i64, i64* %14, align 8, !dbg !41
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 %15), !dbg !42
  %17 = load i8*, i8** %2, align 8, !dbg !43
  %18 = bitcast i8* %17 to i64*, !dbg !44
  %19 = getelementptr inbounds i64, i64* %18, i64 2, !dbg !45
  %20 = load i64, i64* %19, align 8, !dbg !46
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 %20), !dbg !47
  %22 = load i8*, i8** %2, align 8, !dbg !48
  %23 = bitcast i8* %22 to i64*, !dbg !49
  %24 = getelementptr inbounds i64, i64* %23, i64 3, !dbg !50
  %25 = load i64, i64* %24, align 8, !dbg !51
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 %25), !dbg !52
  call void @llvm.dbg.declare(metadata i32** %3, metadata !53, metadata !DIExpression()), !dbg !55
  %27 = load i8*, i8** %2, align 8, !dbg !56
  %28 = bitcast i8* %27 to i64*, !dbg !57
  %29 = load i8*, i8** %2, align 8, !dbg !58
  %30 = bitcast i8* %29 to i64*, !dbg !59
  %31 = load i64, i64* %30, align 8, !dbg !60
  %32 = trunc i64 %31 to i32, !dbg !60
  %33 = call i32* @getHeapRefs(i64* %28, i32 %32), !dbg !61
  store i32* %33, i32** %3, align 8, !dbg !55
  %34 = load i32*, i32** %3, align 8, !dbg !62
  %35 = load i32, i32* %34, align 4, !dbg !63
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %35), !dbg !64
  %37 = load i32*, i32** %3, align 8, !dbg !65
  %38 = getelementptr inbounds i32, i32* %37, i64 1, !dbg !66
  %39 = load i32, i32* %38, align 4, !dbg !67
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %39), !dbg !68
  %41 = load i32*, i32** %3, align 8, !dbg !69
  %42 = getelementptr inbounds i32, i32* %41, i64 2, !dbg !70
  %43 = load i32, i32* %42, align 4, !dbg !71
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %43), !dbg !72
  %45 = load i32*, i32** %3, align 8, !dbg !73
  %46 = getelementptr inbounds i32, i32* %45, i64 3, !dbg !74
  %47 = load i32, i32* %46, align 4, !dbg !75
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %47), !dbg !76
  %49 = call i64 @llvm.read_register.i64(metadata !11), !dbg !77
  %50 = inttoptr i64 %49 to i8*, !dbg !78
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), i8* %50), !dbg !79
  %52 = call i64 @llvm.read_register.i64(metadata !11), !dbg !80
  %53 = inttoptr i64 %52 to i8*, !dbg !81
  %54 = load i32*, i32** %3, align 8, !dbg !82
  %55 = getelementptr inbounds i32, i32* %54, i64 1, !dbg !83
  %56 = load i32, i32* %55, align 4, !dbg !84
  %57 = sext i32 %56 to i64, !dbg !85
  %58 = getelementptr inbounds i8, i8* %53, i64 %57, !dbg !85
  %59 = bitcast i8* %58 to i64*, !dbg !86
  %60 = load i64, i64* %59, align 8, !dbg !86
  %61 = inttoptr i64 %60 to i64*, !dbg !87
  %62 = load i64, i64* %61, align 8, !dbg !88
  %63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64 %62), !dbg !89
  %64 = call i64 @llvm.read_register.i64(metadata !11), !dbg !90
  %65 = inttoptr i64 %64 to i8*, !dbg !91
  %66 = getelementptr inbounds i8, i8* %65, i64 8, !dbg !92
  %67 = load i32*, i32** %3, align 8, !dbg !93
  %68 = getelementptr inbounds i32, i32* %67, i64 2, !dbg !94
  %69 = load i32, i32* %68, align 4, !dbg !95
  %70 = sext i32 %69 to i64, !dbg !96
  %71 = getelementptr inbounds i8, i8* %66, i64 %70, !dbg !96
  %72 = bitcast i8* %71 to i64*, !dbg !97
  %73 = load i64, i64* %72, align 8, !dbg !97
  %74 = inttoptr i64 %73 to i64*, !dbg !98
  %75 = load i64, i64* %74, align 8, !dbg !99
  %76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i64 %75), !dbg !100
  %77 = call i64 @llvm.read_register.i64(metadata !11), !dbg !101
  %78 = inttoptr i64 %77 to i8*, !dbg !102
  %79 = getelementptr inbounds i8, i8* %78, i64 16, !dbg !103
  %80 = load i32*, i32** %3, align 8, !dbg !104
  %81 = getelementptr inbounds i32, i32* %80, i64 3, !dbg !105
  %82 = load i32, i32* %81, align 4, !dbg !106
  %83 = sext i32 %82 to i64, !dbg !107
  %84 = getelementptr inbounds i8, i8* %79, i64 %83, !dbg !107
  %85 = bitcast i8* %84 to i64*, !dbg !108
  %86 = load i64, i64* %85, align 8, !dbg !108
  %87 = inttoptr i64 %86 to i64*, !dbg !109
  %88 = load i64, i64* %87, align 8, !dbg !110
  %89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i64 %88), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i8* @getCallers(i32) #3

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32* @getHeapRefs(i64*, i32) #3

; Function Attrs: nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bar() #0 gc "statepoint-example" !dbg !113 {
  %1 = alloca i64*, align 8
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i64** %1, metadata !114, metadata !DIExpression()), !dbg !115
  %3 = call noalias i8* @malloc(i64 8) #5, !dbg !116
  %4 = bitcast i8* %3 to i64*, !dbg !116
  store i64* %4, i64** %1, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32* %2, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 23, i32* %2, align 4, !dbg !118
  %5 = load i64*, i64** %1, align 8, !dbg !119
  store i64 7, i64* %5, align 8, !dbg !120
  call void @foo(), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 gc "statepoint-example" !dbg !123 {
  %1 = alloca i64*, align 8
  call void @readStackMap(i64* bitcast (%struct.StackMap* @__LLVM_StackMaps to i64*)), !dbg !126
  call void @llvm.dbg.declare(metadata i64** %1, metadata !127, metadata !DIExpression()), !dbg !128
  %2 = call noalias i8* @malloc(i64 8) #5, !dbg !129
  %3 = bitcast i8* %2 to i64*, !dbg !129
  store i64* %3, i64** %1, align 8, !dbg !128
  %4 = load i64*, i64** %1, align 8, !dbg !130
  store i64 9, i64* %4, align 8, !dbg !131
  call void @bar(), !dbg !132
  ret i32 0, !dbg !133
}

declare dso_local void @readStackMap(i64*) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.named.register.rsp = !{!11}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "main.c", directory: "/home/kavindu/ballerina/nBalTest/test-gc/statepoints")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !6, line: 55, baseType: !7)
!6 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!7 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !6, line: 48, baseType: !10)
!10 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!11 = !{!"rsp"}
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161"}
!16 = distinct !DISubprogram(name: "baz", scope: !1, file: !1, line: 20, type: !17, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 20, column: 13, scope: !16)
!20 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 22, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "heapPtr3", scope: !20, file: !1, line: 23, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !6, line: 38, baseType: !24)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DILocation(line: 23, column: 14, scope: !20)
!26 = !DILocation(line: 23, column: 25, scope: !20)
!27 = !DILocation(line: 24, column: 6, scope: !20)
!28 = !DILocation(line: 24, column: 15, scope: !20)
!29 = !DILocation(line: 26, column: 5, scope: !20)
!30 = !DILocalVariable(name: "callLocations", scope: !20, file: !1, line: 27, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!32 = !DILocation(line: 27, column: 11, scope: !20)
!33 = !DILocation(line: 27, column: 27, scope: !20)
!34 = !DILocation(line: 28, column: 44, scope: !20)
!35 = !DILocation(line: 28, column: 33, scope: !20)
!36 = !DILocation(line: 28, column: 31, scope: !20)
!37 = !DILocation(line: 28, column: 5, scope: !20)
!38 = !DILocation(line: 29, column: 44, scope: !20)
!39 = !DILocation(line: 29, column: 33, scope: !20)
!40 = !DILocation(line: 29, column: 58, scope: !20)
!41 = !DILocation(line: 29, column: 31, scope: !20)
!42 = !DILocation(line: 29, column: 5, scope: !20)
!43 = !DILocation(line: 30, column: 44, scope: !20)
!44 = !DILocation(line: 30, column: 33, scope: !20)
!45 = !DILocation(line: 30, column: 58, scope: !20)
!46 = !DILocation(line: 30, column: 31, scope: !20)
!47 = !DILocation(line: 30, column: 5, scope: !20)
!48 = !DILocation(line: 31, column: 44, scope: !20)
!49 = !DILocation(line: 31, column: 33, scope: !20)
!50 = !DILocation(line: 31, column: 58, scope: !20)
!51 = !DILocation(line: 31, column: 31, scope: !20)
!52 = !DILocation(line: 31, column: 5, scope: !20)
!53 = !DILocalVariable(name: "offsets", scope: !20, file: !1, line: 32, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!55 = !DILocation(line: 32, column: 10, scope: !20)
!56 = !DILocation(line: 32, column: 43, scope: !20)
!57 = !DILocation(line: 32, column: 32, scope: !20)
!58 = !DILocation(line: 32, column: 71, scope: !20)
!59 = !DILocation(line: 32, column: 60, scope: !20)
!60 = !DILocation(line: 32, column: 58, scope: !20)
!61 = !DILocation(line: 32, column: 20, scope: !20)
!62 = !DILocation(line: 33, column: 21, scope: !20)
!63 = !DILocation(line: 33, column: 20, scope: !20)
!64 = !DILocation(line: 33, column: 5, scope: !20)
!65 = !DILocation(line: 34, column: 22, scope: !20)
!66 = !DILocation(line: 34, column: 30, scope: !20)
!67 = !DILocation(line: 34, column: 20, scope: !20)
!68 = !DILocation(line: 34, column: 5, scope: !20)
!69 = !DILocation(line: 35, column: 22, scope: !20)
!70 = !DILocation(line: 35, column: 30, scope: !20)
!71 = !DILocation(line: 35, column: 20, scope: !20)
!72 = !DILocation(line: 35, column: 5, scope: !20)
!73 = !DILocation(line: 36, column: 22, scope: !20)
!74 = !DILocation(line: 36, column: 30, scope: !20)
!75 = !DILocation(line: 36, column: 20, scope: !20)
!76 = !DILocation(line: 36, column: 5, scope: !20)
!77 = !DILocation(line: 38, column: 46, scope: !20)
!78 = !DILocation(line: 38, column: 36, scope: !20)
!79 = !DILocation(line: 38, column: 5, scope: !20)
!80 = !DILocation(line: 39, column: 63, scope: !20)
!81 = !DILocation(line: 39, column: 53, scope: !20)
!82 = !DILocation(line: 39, column: 71, scope: !20)
!83 = !DILocation(line: 39, column: 79, scope: !20)
!84 = !DILocation(line: 39, column: 69, scope: !20)
!85 = !DILocation(line: 39, column: 67, scope: !20)
!86 = !DILocation(line: 39, column: 38, scope: !20)
!87 = !DILocation(line: 39, column: 27, scope: !20)
!88 = !DILocation(line: 39, column: 25, scope: !20)
!89 = !DILocation(line: 39, column: 5, scope: !20)
!90 = !DILocation(line: 40, column: 63, scope: !20)
!91 = !DILocation(line: 40, column: 53, scope: !20)
!92 = !DILocation(line: 40, column: 67, scope: !20)
!93 = !DILocation(line: 40, column: 75, scope: !20)
!94 = !DILocation(line: 40, column: 83, scope: !20)
!95 = !DILocation(line: 40, column: 73, scope: !20)
!96 = !DILocation(line: 40, column: 71, scope: !20)
!97 = !DILocation(line: 40, column: 38, scope: !20)
!98 = !DILocation(line: 40, column: 27, scope: !20)
!99 = !DILocation(line: 40, column: 25, scope: !20)
!100 = !DILocation(line: 40, column: 5, scope: !20)
!101 = !DILocation(line: 41, column: 63, scope: !20)
!102 = !DILocation(line: 41, column: 53, scope: !20)
!103 = !DILocation(line: 41, column: 67, scope: !20)
!104 = !DILocation(line: 41, column: 76, scope: !20)
!105 = !DILocation(line: 41, column: 84, scope: !20)
!106 = !DILocation(line: 41, column: 74, scope: !20)
!107 = !DILocation(line: 41, column: 72, scope: !20)
!108 = !DILocation(line: 41, column: 38, scope: !20)
!109 = !DILocation(line: 41, column: 27, scope: !20)
!110 = !DILocation(line: 41, column: 25, scope: !20)
!111 = !DILocation(line: 41, column: 5, scope: !20)
!112 = !DILocation(line: 42, column: 1, scope: !20)
!113 = distinct !DISubprogram(name: "bar", scope: !1, file: !1, line: 44, type: !17, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "heapPtr2", scope: !113, file: !1, line: 45, type: !4)
!115 = !DILocation(line: 45, column: 15, scope: !113)
!116 = !DILocation(line: 45, column: 26, scope: !113)
!117 = !DILocalVariable(name: "i", scope: !113, file: !1, line: 46, type: !24)
!118 = !DILocation(line: 46, column: 9, scope: !113)
!119 = !DILocation(line: 47, column: 6, scope: !113)
!120 = !DILocation(line: 47, column: 15, scope: !113)
!121 = !DILocation(line: 48, column: 5, scope: !113)
!122 = !DILocation(line: 49, column: 1, scope: !113)
!123 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 51, type: !124, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DISubroutineType(types: !125)
!125 = !{!24}
!126 = !DILocation(line: 52, column: 5, scope: !123)
!127 = !DILocalVariable(name: "heapPtr1", scope: !123, file: !1, line: 53, type: !4)
!128 = !DILocation(line: 53, column: 15, scope: !123)
!129 = !DILocation(line: 53, column: 26, scope: !123)
!130 = !DILocation(line: 54, column: 6, scope: !123)
!131 = !DILocation(line: 54, column: 15, scope: !123)
!132 = !DILocation(line: 55, column: 5, scope: !123)
!133 = !DILocation(line: 56, column: 1, scope: !123)
