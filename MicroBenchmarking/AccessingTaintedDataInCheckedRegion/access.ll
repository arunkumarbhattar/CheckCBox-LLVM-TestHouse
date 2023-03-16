; ModuleID = 'access.c'
source_filename = "access.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@sbxHeap = common global i64 0
@sbxHeapRange = common global i32 0
@.str = private unnamed_addr constant [60 x i8] c"******************Iteration: %d **************************\0A\00", align 1
@.str.1 = private unnamed_addr constant [57 x i8] c"ReadingAndWritingToCheckedPtr100ktimes takes %f seconds\0A\00", align 1
@.str.2 = private unnamed_addr constant [57 x i8] c"ReadingAndWritingToTaintedPtr100ktimes takes %f seconds\0A\00", align 1
@.str.3 = private unnamed_addr constant [60 x i8] c"**********************************************************\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @ReadingAndWritingToCheckedPtr100ktimes() #0 {
entry:
  %start = alloca i64, align 8
  %end = alloca i64, align 8
  %cpu_time_used = alloca double, align 8
  %pVal = alloca i32*, align 8
  %i = alloca i32, align 4
  %call = call i64 @clock() #4
  store i64 %call, i64* %start, align 8
  %call1 = call noalias i8* @malloc(i64 4) #4
  %0 = bitcast i8* %call1 to i32*
  store i32* %0, i32** %pVal, align 8
  %1 = load i32*, i32** %pVal, align 8
  store i32 0, i32* %1, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 100000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %pVal, align 8
  %4 = load i32, i32* %3, align 4
  %add = add nsw i32 %4, 1
  store i32 %add, i32* %3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !2

for.end:                                          ; preds = %for.cond
  %call2 = call i64 @clock() #4
  store i64 %call2, i64* %end, align 8
  %6 = load i64, i64* %end, align 8
  %7 = load i64, i64* %start, align 8
  %sub = sub nsw i64 %6, %7
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  store double %div, double* %cpu_time_used, align 8
  %8 = load double, double* %cpu_time_used, align 8
  ret double %8
}

; Function Attrs: nounwind
declare dso_local i64 @clock() #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @ReadingAndWritingToTaintedPtr100ktimes() #0 {
entry:
  %start = alloca i64, align 8
  %end = alloca i64, align 8
  %cpu_time_used = alloca double, align 8
  %pVal = alloca i32*, align 4
  %tmp = alloca i8*, align 4
  %i = alloca i32, align 4
  %call = call i64 @clock() #4
  store i64 %call, i64* %start, align 8
  %call1 = call i8* @t_malloc(i64 4)
  %0 = ptrtoint i8* %call1 to i32
  %1 = inttoptr i32 %0 to i8*
  store i8* %1, i8** %tmp, align 4
  %2 = load i8*, i8** %tmp, align 4
  %3 = call i64 @c_fetch_sandbox_heap_bound()
  %4 = call i64 @c_fetch_sandbox_heap_address()
  %5 = sub i64 %3, %4
  %6 = trunc i64 %5 to i32
  store i32 %6, i32* @sbxHeapRange, align 8
  %7 = bitcast i8* %2 to i32*
  %8 = ptrtoint i32* %7 to i32
  %9 = zext i32 %8 to i64
  %10 = bitcast i32** %pVal to i64*
  store i64 %9, i64* %10, align 4
  %11 = load i32*, i32** %pVal, align 4
  %12 = load i32, i32* @sbxHeapRange, align 8
  %13 = load i64, i64* @sbxHeap, align 8
  %14 = ptrtoint i32* %11 to i32
  %15 = zext i32 %14 to i64
  %16 = add i64 %13, %15
  %17 = icmp ult i32 %14, %12
  br i1 %17, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %entry
  %18 = inttoptr i64 %16 to i32*
  store i32 0, i32* %18, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %_Dynamic_check.succeeded
  %19 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %19, 100000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %pVal, align 4
  %21 = load i32, i32* @sbxHeapRange, align 8
  %22 = load i64, i64* @sbxHeap, align 8
  %23 = ptrtoint i32* %20 to i32
  %24 = zext i32 %23 to i64
  %25 = add i64 %22, %24
  %26 = icmp ult i32 %23, %21
  br i1 %26, label %_Dynamic_check.succeeded3, label %_Dynamic_check.failed2

_Dynamic_check.succeeded3:                        ; preds = %for.body
  %27 = inttoptr i64 %25 to i32*
  %28 = load i32, i32* %27, align 4
  %add = add nsw i32 %28, 1
  store i32 %add, i32* %27, align 4
  br label %for.inc

for.inc:                                          ; preds = %_Dynamic_check.succeeded3
  %29 = load i32, i32* %i, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

_Dynamic_check.failed:                            ; preds = %entry
  call void @llvm.trap() #5
  unreachable

_Dynamic_check.failed2:                           ; preds = %for.body
  call void @llvm.trap() #5
  unreachable

for.end:                                          ; preds = %for.cond
  %call4 = call i64 @clock() #4
  store i64 %call4, i64* %end, align 8
  %30 = load i64, i64* %end, align 8
  %31 = load i64, i64* %start, align 8
  %sub = sub nsw i64 %30, %31
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  store double %div, double* %cpu_time_used, align 8
  %32 = load double, double* %cpu_time_used, align 8
  ret double %32
}

declare dso_local i8* @t_malloc(i64) #2

declare i64 @c_fetch_sandbox_heap_bound()

declare i64 @c_fetch_sandbox_heap_address()

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  call void @sbx_init()
  %0 = call i64 @c_fetch_sandbox_heap_address()
  store i64 %0, i64* @sbxHeap, align 8
  %1 = call i64 @c_fetch_sandbox_heap_bound()
  %2 = call i64 @c_fetch_sandbox_heap_address()
  %3 = sub i64 %1, %2
  %4 = trunc i64 %3 to i32
  store i32 %4, i32* @sbxHeapRange, align 8
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %5, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4
  %add = add nsw i32 %6, 1
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str, i64 0, i64 0), i32 %add)
  %call1 = call double @ReadingAndWritingToCheckedPtr100ktimes()
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.1, i64 0, i64 0), double %call1)
  %call3 = call double @ReadingAndWritingToTaintedPtr100ktimes()
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.2, i64 0, i64 0), double %call3)
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.3, i64 0, i64 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !5

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @sbx_init()

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { cold noreturn nounwind }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git a080e091f59086ba1c256f76cdcc878e2b7d3f79)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
!4 = distinct !{!4, !3}
!5 = distinct !{!5, !3}
