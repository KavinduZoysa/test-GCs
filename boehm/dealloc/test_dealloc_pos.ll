; ModuleID = '$anon.0.0.0'
source_filename = "test_dealloc_pos.bal"
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
  %"%11" = alloca i64, align 8
  %"%16" = alloca i8*, align 8
  %"%3" = alloca i8*, align 8
  %"%4" = alloca i64, align 8
  %"%6" = alloca i8*, align 8
  %"%7" = alloca i64, align 8
  %"%9" = alloca i64, align 8
  br label %bb0

bb0:                                              ; preds = %entry
  store i64 2147483647, i64* %"%1", align 8
  %call = call i8* @balGCInit()
  store i8* %call, i8** %"%3", align 8
  br label %bb1

bb1:                                              ; preds = %bb0
  store i64 18000, i64* %"%4", align 8
  %"%4_temp" = load i64, i64* %"%4", align 8
  %"%1_temp" = load i64, i64* %"%1", align 8
  %call1 = call i8* @balAllocWithoutReturn(i64 %"%4_temp", i64 %"%1_temp")
  store i8* %call1, i8** %"%6", align 8
  br label %bb2

bb2:                                              ; preds = %bb1
  store i64 17000, i64* %"%4", align 8
  store i64 0, i64* %"%9", align 8
  %"%4_temp2" = load i64, i64* %"%4", align 8
  %"%9_temp" = load i64, i64* %"%9", align 8
  %call3 = call i64 @balAllocWithReturn(i64 %"%4_temp2", i64 %"%9_temp")
  store i64 %call3, i64* %"%7", align 8
  br label %bb3

bb3:                                              ; preds = %bb2
  %call4 = call i64 @readPos()
  store i64 %call4, i64* %"%11", align 8
  br label %bb4

bb4:                                              ; preds = %bb3
  store i64 18000, i64* %"%4", align 8
  %"%1_temp5" = load i64, i64* %"%1", align 8
  %"%4_temp6" = load i64, i64* %"%4", align 8
  %"%11_temp" = load i64, i64* %"%11", align 8
  %call7 = call i8* @assertVal(i64 %"%1_temp5", i64 %"%4_temp6", i64 %"%11_temp")
  store i8* %call7, i8** %"%16", align 8
  br label %bb5

bb5:                                              ; preds = %bb4
  br label %bb7

bb6:                                              ; No predecessors!
  br label %bb7

bb7:                                              ; preds = %bb6, %bb5
  ret void
}

declare i8* @print_integer(i64)

declare i64 @readPos()
