; ModuleID = 'simpleTainted.c'
source_filename = "simpleTainted.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [59 x i8] c"/home/twinturbo/Desktop/checkedc-parson/tests/test_1_1.txt\00", align 1

; Function Attrs: noinline nounwind optnone tainted uwtable
define dso_local i8* @string_malloc(i64 %sz) #0 {
entry:
  %retval = alloca i8*, align 8
  %sz.addr = alloca i64, align 8
  %p = alloca i8*, align 8
  store i64 %sz, i64* %sz.addr, align 8
  %0 = load i64, i64* %sz.addr, align 8
  %cmp = icmp uge i64 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %sz.addr, align 8
  %add = add i64 %1, 1
  %2 = call i8* @c_ConditionalTaintedOff2Ptr(i64 %add)
  %3 = ptrtoint i8* %2 to i64
  %call = call i8* @t_malloc(i64 %3)
  store i8* %call, i8** %p, align 8
  %4 = load i8*, i8** %p, align 8
  %cmp1 = icmp ne i8* %4, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %5 = load i8*, i8** %p, align 8
  %6 = load i64, i64* %sz.addr, align 8
  %7 = ptrtoint i8* %5 to i32
  %8 = call i8* @c_fetch_pointer_from_offset(i32 %7)
  %9 = call i1 @c_isTaintedPointerToTaintedMem(i8* %8)
  br i1 %9, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %if.then2
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %6
  store i8 0, i8* %arrayidx, align 1
  br label %if.end3

_Dynamic_check.failed:                            ; preds = %if.then2
  call void @llvm.trap() #4
  unreachable

if.end3:                                          ; preds = %_Dynamic_check.succeeded, %if.end
  %10 = load i8*, i8** %p, align 8
  store i8* %10, i8** %retval, align 8
  br label %return

return:                                           ; preds = %if.end3, %if.then
  %11 = load i8*, i8** %retval, align 8
  ret i8* %11
}

declare dso_local i8* @t_malloc(i64) #1

declare i8* @c_ConditionalTaintedOff2Ptr(i64)

declare i8* @c_fetch_pointer_from_offset(i32)

declare i1 @c_isTaintedPointerToTaintedMem(i8*)

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #3 {
entry:
  %retval = alloca i32, align 4
  %filename = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  %0 = call i8* @c_ConditionalTaintedOff2Ptr(i64 59)
  %1 = ptrtoint i8* %0 to i64
  %call = call i8* @string_malloc(i64 %1)
  store i8* %call, i8** %filename, align 8
  %2 = load i8*, i8** %filename, align 8
  %3 = ptrtoint i8* %2 to i64
  %4 = call i8* @c_ConditionalTaintedOff2Ptr(i64 %3)
  %5 = call i8* @c_ConditionalTaintedOff2Ptr(i64 ptrtoint ([59 x i8]* @.str to i64))
  %call1 = call i8* @t_strcpy(i8* %4, i8* %5)
  ret i32 0
}

declare dso_local i8* @t_strcpy(i8*, i8*) #1

attributes #0 = { noinline nounwind optnone tainted uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { cold noreturn nounwind }
attributes #3 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 84da9e349b5597f14a92d98447e525e3cee40233)"}
