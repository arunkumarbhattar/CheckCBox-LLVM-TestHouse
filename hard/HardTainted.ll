; ModuleID = 'HardTainted.c'
source_filename = "HardTainted.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%Tstruct.json_array_t_t = type { %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t**, i64, i64 }
%Tstruct.json_value_t_t = type { %Tstruct.json_value_t_t*, i32, %Tstruct.json_value_value_t_t* }
%Tstruct.json_value_value_t_t = type { i8*, double, %Tstruct.json_object_t_t*, %Tstruct.json_array_t_t*, i32, i32 }
%Tstruct.json_object_t_t = type { %Tstruct.json_value_t_t*, i8**, %Tstruct.json_value_t_t**, i64, i64 }

; Function Attrs: noinline nounwind optnone tainted uwtable
define dso_local %Tstruct.json_array_t_t* @json_array_init(%Tstruct.json_value_t_t* %wrapping_value) #0 {
entry:
  %retval = alloca %Tstruct.json_array_t_t*, align 8
  %wrapping_value.addr = alloca %Tstruct.json_value_t_t*, align 8
  %new_array = alloca %Tstruct.json_array_t_t*, align 8
  store %Tstruct.json_value_t_t* %wrapping_value, %Tstruct.json_value_t_t** %wrapping_value.addr, align 8
  %call = call i8* @t_malloc(i64 32)
  %0 = bitcast i8* %call to %Tstruct.json_array_t_t*
  store %Tstruct.json_array_t_t* %0, %Tstruct.json_array_t_t** %new_array, align 8
  %1 = load %Tstruct.json_array_t_t*, %Tstruct.json_array_t_t** %new_array, align 8
  %cmp = icmp eq %Tstruct.json_array_t_t* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %Tstruct.json_array_t_t* null, %Tstruct.json_array_t_t** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %wrapping_value.addr, align 8
  %3 = load %Tstruct.json_array_t_t*, %Tstruct.json_array_t_t** %new_array, align 8
  %4 = ptrtoint %Tstruct.json_array_t_t* %3 to i64
  %5 = call i8* @c_fetch_pointer_from_offset(i64 %4)
  %6 = call i1 @c_isTaintedPointerToTaintedMem(i8* %5)
  br i1 %6, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %if.end
  %7 = bitcast i8* %5 to %Tstruct.json_array_t_t*
  %wrapping_value1 = getelementptr inbounds %Tstruct.json_array_t_t, %Tstruct.json_array_t_t* %7, i32 0, i32 0
  store %Tstruct.json_value_t_t* %2, %Tstruct.json_value_t_t** %wrapping_value1, align 8
  %8 = load %Tstruct.json_array_t_t*, %Tstruct.json_array_t_t** %new_array, align 8
  %9 = ptrtoint %Tstruct.json_array_t_t* %8 to i64
  %10 = call i8* @c_fetch_pointer_from_offset(i64 %9)
  %11 = call i1 @c_isTaintedPointerToTaintedMem(i8* %10)
  br i1 %11, label %_Dynamic_check.succeeded3, label %_Dynamic_check.failed2

_Dynamic_check.succeeded3:                        ; preds = %_Dynamic_check.succeeded
  %12 = bitcast i8* %10 to %Tstruct.json_array_t_t*
  %items = getelementptr inbounds %Tstruct.json_array_t_t, %Tstruct.json_array_t_t* %12, i32 0, i32 1
  store %Tstruct.json_value_t_t** null, %Tstruct.json_value_t_t*** %items, align 8
  %13 = load %Tstruct.json_array_t_t*, %Tstruct.json_array_t_t** %new_array, align 8
  %capacity = getelementptr inbounds %Tstruct.json_array_t_t, %Tstruct.json_array_t_t* %13, i32 0, i32 3
  store i64 0, i64* %capacity, align 8
  %14 = load %Tstruct.json_array_t_t*, %Tstruct.json_array_t_t** %new_array, align 8
  %count = getelementptr inbounds %Tstruct.json_array_t_t, %Tstruct.json_array_t_t* %14, i32 0, i32 2
  store i64 0, i64* %count, align 8
  %15 = load %Tstruct.json_array_t_t*, %Tstruct.json_array_t_t** %new_array, align 8
  store %Tstruct.json_array_t_t* %15, %Tstruct.json_array_t_t** %retval, align 8
  br label %return

_Dynamic_check.failed:                            ; preds = %if.end
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed2:                           ; preds = %_Dynamic_check.succeeded
  call void @llvm.trap() #4
  unreachable

return:                                           ; preds = %_Dynamic_check.succeeded3, %if.then
  %16 = load %Tstruct.json_array_t_t*, %Tstruct.json_array_t_t** %retval, align 8
  ret %Tstruct.json_array_t_t* %16
}

declare dso_local i8* @t_malloc(i64) #1

declare i8* @c_fetch_pointer_from_offset(i64)

declare i1 @c_isTaintedPointerToTaintedMem(i8*)

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #2

; Function Attrs: noinline nounwind optnone tainted uwtable
define dso_local %Tstruct.json_value_t_t* @json_value_init_array() #0 {
entry:
  %retval = alloca %Tstruct.json_value_t_t*, align 8
  %new_value = alloca %Tstruct.json_value_t_t*, align 8
  %call = call i8* @t_malloc(i64 24)
  %0 = bitcast i8* %call to %Tstruct.json_value_t_t*
  store %Tstruct.json_value_t_t* %0, %Tstruct.json_value_t_t** %new_value, align 8
  %1 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %new_value, align 8
  %tobool = icmp ne %Tstruct.json_value_t_t* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %Tstruct.json_value_t_t* null, %Tstruct.json_value_t_t** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %new_value, align 8
  %3 = ptrtoint %Tstruct.json_value_t_t* %2 to i64
  %4 = call i8* @c_fetch_pointer_from_offset(i64 %3)
  %5 = call i1 @c_isTaintedPointerToTaintedMem(i8* %4)
  br i1 %5, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %if.end
  %6 = bitcast i8* %4 to %Tstruct.json_value_t_t*
  %parent = getelementptr inbounds %Tstruct.json_value_t_t, %Tstruct.json_value_t_t* %6, i32 0, i32 0
  store %Tstruct.json_value_t_t* null, %Tstruct.json_value_t_t** %parent, align 8
  %7 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %new_value, align 8
  %type = getelementptr inbounds %Tstruct.json_value_t_t, %Tstruct.json_value_t_t* %7, i32 0, i32 1
  store i32 5, i32* %type, align 8
  %8 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %new_value, align 8
  %9 = ptrtoint %Tstruct.json_value_t_t* %8 to i64
  %10 = call i8* @c_fetch_pointer_from_offset(i64 %9)
  %11 = call i1 @c_isTaintedPointerToTaintedMem(i8* %10)
  br i1 %11, label %_Dynamic_check.succeeded2, label %_Dynamic_check.failed1

_Dynamic_check.succeeded2:                        ; preds = %_Dynamic_check.succeeded
  %12 = bitcast i8* %10 to %Tstruct.json_value_t_t*
  %call3 = call %Tstruct.json_array_t_t* @json_array_init(%Tstruct.json_value_t_t* %12)
  %13 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %new_value, align 8
  %14 = ptrtoint %Tstruct.json_value_t_t* %13 to i64
  %15 = call i8* @c_fetch_pointer_from_offset(i64 %14)
  %16 = call i1 @c_isTaintedPointerToTaintedMem(i8* %15)
  br i1 %16, label %_Dynamic_check.succeeded5, label %_Dynamic_check.failed4

_Dynamic_check.succeeded5:                        ; preds = %_Dynamic_check.succeeded2
  %17 = bitcast i8* %15 to %Tstruct.json_value_t_t*
  %value = getelementptr inbounds %Tstruct.json_value_t_t, %Tstruct.json_value_t_t* %17, i32 0, i32 2
  %18 = load %Tstruct.json_value_value_t_t*, %Tstruct.json_value_value_t_t** %value, align 8
  %19 = ptrtoint %Tstruct.json_value_value_t_t* %18 to i64
  %20 = call i8* @c_fetch_pointer_from_offset(i64 %19)
  %21 = call i1 @c_isTaintedPointerToTaintedMem(i8* %20)
  br i1 %21, label %_Dynamic_check.succeeded7, label %_Dynamic_check.failed6

_Dynamic_check.succeeded7:                        ; preds = %_Dynamic_check.succeeded5
  %22 = bitcast i8* %20 to %Tstruct.json_value_value_t_t*
  %array = getelementptr inbounds %Tstruct.json_value_value_t_t, %Tstruct.json_value_value_t_t* %22, i32 0, i32 3
  store %Tstruct.json_array_t_t* %call3, %Tstruct.json_array_t_t** %array, align 8
  %23 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %new_value, align 8
  %24 = ptrtoint %Tstruct.json_value_t_t* %23 to i64
  %25 = call i8* @c_fetch_pointer_from_offset(i64 %24)
  %26 = call i1 @c_isTaintedPointerToTaintedMem(i8* %25)
  br i1 %26, label %_Dynamic_check.succeeded9, label %_Dynamic_check.failed8

_Dynamic_check.succeeded9:                        ; preds = %_Dynamic_check.succeeded7
  %27 = bitcast i8* %25 to %Tstruct.json_value_t_t*
  %value10 = getelementptr inbounds %Tstruct.json_value_t_t, %Tstruct.json_value_t_t* %27, i32 0, i32 2
  %28 = load %Tstruct.json_value_value_t_t*, %Tstruct.json_value_value_t_t** %value10, align 8
  %29 = ptrtoint %Tstruct.json_value_value_t_t* %28 to i64
  %30 = call i8* @c_fetch_pointer_from_offset(i64 %29)
  %31 = call i1 @c_isTaintedPointerToTaintedMem(i8* %30)
  br i1 %31, label %_Dynamic_check.succeeded12, label %_Dynamic_check.failed11

_Dynamic_check.succeeded12:                       ; preds = %_Dynamic_check.succeeded9
  %32 = bitcast i8* %30 to %Tstruct.json_value_value_t_t*
  %array13 = getelementptr inbounds %Tstruct.json_value_value_t_t, %Tstruct.json_value_value_t_t* %32, i32 0, i32 3
  %33 = load %Tstruct.json_array_t_t*, %Tstruct.json_array_t_t** %array13, align 8
  %tobool14 = icmp ne %Tstruct.json_array_t_t* %33, null
  br i1 %tobool14, label %if.end18, label %if.then15

if.then15:                                        ; preds = %_Dynamic_check.succeeded12
  %34 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %new_value, align 8
  %35 = ptrtoint %Tstruct.json_value_t_t* %34 to i64
  %36 = call i8* @c_fetch_pointer_from_offset(i64 %35)
  %37 = call i1 @c_isTaintedPointerToTaintedMem(i8* %36)
  br i1 %37, label %_Dynamic_check.succeeded17, label %_Dynamic_check.failed16

_Dynamic_check.succeeded17:                       ; preds = %if.then15
  %38 = bitcast i8* %36 to %Tstruct.json_value_t_t*
  %39 = bitcast %Tstruct.json_value_t_t* %38 to i8*
  call void @t_free(i8* %39)
  store %Tstruct.json_value_t_t* null, %Tstruct.json_value_t_t** %retval, align 8
  br label %return

_Dynamic_check.failed:                            ; preds = %if.end
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed1:                           ; preds = %_Dynamic_check.succeeded
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed4:                           ; preds = %_Dynamic_check.succeeded2
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed6:                           ; preds = %_Dynamic_check.succeeded5
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed8:                           ; preds = %_Dynamic_check.succeeded7
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed11:                          ; preds = %_Dynamic_check.succeeded9
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed16:                          ; preds = %if.then15
  call void @llvm.trap() #4
  unreachable

if.end18:                                         ; preds = %_Dynamic_check.succeeded12
  %40 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %new_value, align 8
  store %Tstruct.json_value_t_t* %40, %Tstruct.json_value_t_t** %retval, align 8
  br label %return

return:                                           ; preds = %if.end18, %_Dynamic_check.succeeded17, %if.then
  %41 = load %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t** %retval, align 8
  ret %Tstruct.json_value_t_t* %41
}

declare dso_local void @t_free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #3 {
entry:
  %retval = alloca i32, align 4
  %TJMAXX = alloca %Tstruct.json_value_t_t*, align 8
  store i32 0, i32* %retval, align 4
  %call = call %Tstruct.json_value_t_t* @json_value_init_array()
  store %Tstruct.json_value_t_t* %call, %Tstruct.json_value_t_t** %TJMAXX, align 8
  ret i32 0
}

attributes #0 = { noinline nounwind optnone tainted uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { cold noreturn nounwind }
attributes #3 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 79049c1b33098fe70065cee242cd989aacfcd0d8)"}
