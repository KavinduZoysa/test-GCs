; ModuleID = '$anon.0.0.0'
source_filename = "test_dealloc.bal"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__string_table_ptr = internal global i8* null, align 4
@"$annotation_data" = global i8* null, align 4

declare i64 @balAlloc(i64)

declare i64 @balDeInitialize(i64)

declare i8* @balGCInit()

declare i8* @balInitialize(i64, i64)

declare i64 @balMultipleAlloc()

define void @main() {
entry:
  %"%0" = alloca i8*, align 8
  %"%1" = alloca i8*, align 8
  %"%10" = alloca i64, align 8
  %"%12" = alloca i64, align 8
  %"%16" = alloca i8*, align 8
  %"%2" = alloca i64, align 8
  %"%3" = alloca i64, align 8
  %"%5" = alloca i64, align 8
  %"%9" = alloca i8*, align 8
  br label %bb0

bb0:                                              ; preds = %entry
  %call = call i8* @balGCInit()
  store i8* %call, i8** %"%1", align 8
  br label %bb1

bb1:                                              ; preds = %bb0
  store i64 64, i64* %"%3", align 8
  %"%3_temp" = load i64, i64* %"%3", align 8
  %call1 = call i64 @balAlloc(i64 %"%3_temp")
  store i64 %call1, i64* %"%2", align 8
  br label %bb2

bb2:                                              ; preds = %bb1
  store i64 201, i64* %"%5", align 8
  %"%2_temp" = load i64, i64* %"%2", align 8
  %"%5_temp" = load i64, i64* %"%5", align 8
  %call2 = call i8* @balInitialize(i64 %"%2_temp", i64 %"%5_temp")
  store i8* %call2, i8** %"%9", align 8
  br label %bb3

bb3:                                              ; preds = %bb2
  %call3 = call i64 @balMultipleAlloc()
  store i64 %call3, i64* %"%10", align 8
  br label %bb4

bb4:                                              ; preds = %bb3
  %"%2_temp4" = load i64, i64* %"%2", align 8
  %call5 = call i64 @balDeInitialize(i64 %"%2_temp4")
  store i64 %call5, i64* %"%12", align 8
  br label %bb5

bb5:                                              ; preds = %bb4
  %"%12_temp" = load i64, i64* %"%12", align 8
  %call6 = call i8* @print_integer(i64 %"%12_temp")
  store i8* %call6, i8** %"%16", align 8
  br label %bb6

bb6:                                              ; preds = %bb5
  br label %bb8

bb7:                                              ; No predecessors!
  br label %bb8

bb8:                                              ; preds = %bb7, %bb6
  ret void
}

declare i8* @print_integer(i64)
