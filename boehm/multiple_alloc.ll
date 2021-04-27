; ModuleID = '$anon.0.0.0'
source_filename = "multiple_alloc.bal"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__string_table_ptr = internal global i8* null, align 4
@"$annotation_data" = global i8* null, align 4

declare i8* @balGCInit()

declare i64 @balMultipleAlloc()

define void @main() {
entry:
  %"%0" = alloca i8*, align 8
  %"%1" = alloca i8*, align 8
  %"%2" = alloca i64, align 8
  br label %bb0

bb0:                                              ; preds = %entry
  %call = call i8* @balGCInit()
  store i8* %call, i8** %"%1", align 8
  br label %bb1

bb1:                                              ; preds = %bb0
  %call1 = call i64 @balMultipleAlloc()
  store i64 %call1, i64* %"%2", align 8
  br label %bb2

bb2:                                              ; preds = %bb1
  br label %bb4

bb3:                                              ; No predecessors!
  br label %bb4

bb4:                                              ; preds = %bb3, %bb2
  ret void
}
