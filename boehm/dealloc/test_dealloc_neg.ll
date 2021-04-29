; ModuleID = '$anon.0.0.0'
source_filename = "test_dealloc_neg.bal"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__string_table_ptr = internal global i8* null, align 4
@"$annotation_data" = global i8* null, align 4

declare i8* @assertVal(i64, i64, i64)

declare i64 @balAllocWithReturn(i64, i64)

declare i8* @balAllocWithoutReturn(i64, i64)

declare i8* @balGCInit()

define void @main() {
entry:
  %"%0" = alloca i8*, align 8
  %"%1" = alloca i64, align 8
  %"%10" = alloca i64, align 8
  %"%15" = alloca i8*, align 8
  %"%3" = alloca i8*, align 8
  %"%4" = alloca i64, align 8
  %"%5" = alloca i64, align 8
  %"%8" = alloca i64, align 8
  br label %bb0

bb0:                                              ; preds = %entry
  store i64 2147483647, i64* %"%1", align 8
  %call = call i8* @balGCInit()
  store i8* %call, i8** %"%3", align 8
  br label %bb1

bb1:                                              ; preds = %bb0
  store i64 18000, i64* %"%5", align 8
  %"%5_temp" = load i64, i64* %"%5", align 8
  %"%1_temp" = load i64, i64* %"%1", align 8
  %call1 = call i64 @balAllocWithReturn(i64 %"%5_temp", i64 %"%1_temp")
  store i64 %call1, i64* %"%4", align 8
  br label %bb2

bb2:                                              ; preds = %bb1
  store i64 17000, i64* %"%5", align 8
  store i64 0, i64* %"%10", align 8
  %"%5_temp2" = load i64, i64* %"%5", align 8
  %"%10_temp" = load i64, i64* %"%10", align 8
  %call3 = call i64 @balAllocWithReturn(i64 %"%5_temp2", i64 %"%10_temp")
  store i64 %call3, i64* %"%8", align 8
  br label %bb3

bb3:                                              ; preds = %bb2
  store i64 18000, i64* %"%5", align 8
  %"%1_temp4" = load i64, i64* %"%1", align 8
  %"%5_temp5" = load i64, i64* %"%5", align 8
  %"%4_temp" = load i64, i64* %"%4", align 8
  %call6 = call i8* @assertVal(i64 %"%1_temp4", i64 %"%5_temp5", i64 %"%4_temp")
  store i8* %call6, i8** %"%15", align 8
  br label %bb4

bb4:                                              ; preds = %bb3
  br label %bb6

bb5:                                              ; No predecessors!
  br label %bb6

bb6:                                              ; preds = %bb5, %bb4
  ret void
}

declare i8* @print_integer(i64)

declare i64 @readPos()
