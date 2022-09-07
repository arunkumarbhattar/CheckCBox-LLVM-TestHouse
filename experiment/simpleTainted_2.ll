; ModuleID = '/home/twinturbo/Desktop/CheckCBox-LLVM-TestHouse/experiment/simpleTainted.c'
source_filename = "/home/twinturbo/Desktop/CheckCBox-LLVM-TestHouse/experiment/simpleTainted.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%Tstruct.Spl_json_value_value_t_t = type { i32, i32, i32, i32, i32, i32 }
%Tstruct.Spl_json_value_t_t = type { i32, i32, %Tstruct.Spl_json_value_value_t_t }
%Tstruct.Spl_json_object_t_t = type { i32, i32, i32, i32, i32 }
%Tstruct.Spl_json_array_t_t = type { i32, i32, i32, i32 }
%Tstruct.json_object_t_t = type { %Tstruct.json_value_t_t*, i8**, %Tstruct.json_value_t_t**, i64, i64 }
%Tstruct.json_value_t_t = type { %Tstruct.json_value_t_t*, i32, %Tstruct.json_value_value_t_t }
%Tstruct.json_value_value_t_t = type { i8*, double, %Tstruct.json_object_t_t*, %Tstruct.json_array_t_t*, i32, i32 }
%Tstruct.json_array_t_t = type { %Tstruct.json_value_t_t*, %Tstruct.json_value_t_t**, i64, i64 }

@Spl_TJSON_Value_Value_Val = dso_local global %Tstruct.Spl_json_value_value_t_t zeroinitializer, align 4
@Spl_json_value_t_t_Val = dso_local global %Tstruct.Spl_json_value_t_t zeroinitializer, align 4
@Spl_json_object_t_t_Val = dso_local global %Tstruct.Spl_json_object_t_t zeroinitializer, align 4
@Spl_json_array_t_t_Val = dso_local global %Tstruct.Spl_json_array_t_t zeroinitializer, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Dummy_Spl_TJSON_Value_Value(%Tstruct.Spl_json_value_value_t_t* noalias sret(%Tstruct.Spl_json_value_value_t_t) align 4 %agg.result) #0 {
entry:
  %0 = bitcast %Tstruct.Spl_json_value_value_t_t* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast (%Tstruct.Spl_json_value_value_t_t* @Spl_TJSON_Value_Value_Val to i8*), i64 24, i1 false)
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Dummy_Spl_json_value_t_t(%Tstruct.Spl_json_value_t_t* noalias sret(%Tstruct.Spl_json_value_t_t) align 4 %agg.result) #0 {
entry:
  %0 = bitcast %Tstruct.Spl_json_value_t_t* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast (%Tstruct.Spl_json_value_t_t* @Spl_json_value_t_t_Val to i8*), i64 32, i1 false)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Dummy_Spl_json_object_t_t(%Tstruct.Spl_json_object_t_t* noalias sret(%Tstruct.Spl_json_object_t_t) align 4 %agg.result) #0 {
entry:
  %0 = bitcast %Tstruct.Spl_json_object_t_t* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast (%Tstruct.Spl_json_object_t_t* @Spl_json_object_t_t_Val to i8*), i64 20, i1 false)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @Dummy_Spl_json_array_t_t() #0 {
entry:
  %retval = alloca %Tstruct.Spl_json_array_t_t, align 4
  %0 = bitcast %Tstruct.Spl_json_array_t_t* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast (%Tstruct.Spl_json_array_t_t* @Spl_json_array_t_t_Val to i8*), i64 16, i1 false)
  %1 = bitcast %Tstruct.Spl_json_array_t_t* %retval to { i64, i64 }*
  %2 = load { i64, i64 }, { i64, i64 }* %1, align 4
  ret { i64, i64 } %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @json_value_get_type(%Tstruct.Spl_json_value_t_t* %value) #0 {
entry:
  %value.addr = alloca %Tstruct.Spl_json_value_t_t*, align 8
  store %Tstruct.Spl_json_value_t_t* %value, %Tstruct.Spl_json_value_t_t** %value.addr, align 8
  %0 = load %Tstruct.Spl_json_value_t_t*, %Tstruct.Spl_json_value_t_t** %value.addr, align 8
  %tobool = icmp ne %Tstruct.Spl_json_value_t_t* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %Tstruct.Spl_json_value_t_t*, %Tstruct.Spl_json_value_t_t** %value.addr, align 8
  %2 = ptrtoint %Tstruct.Spl_json_value_t_t* %1 to i32
  %3 = call i8* @c_fetch_pointer_from_offset(i32 %2)
  %4 = call i1 @c_isTaintedPointerToTaintedMem(i8* %3)
  br i1 %4, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %cond.true
  %5 = bitcast i8* %3 to %Tstruct.Spl_json_value_t_t*
  %type = getelementptr inbounds %Tstruct.Spl_json_value_t_t, %Tstruct.Spl_json_value_t_t* %5, i32 0, i32 1
  %6 = load i32, i32* %type, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %_Dynamic_check.succeeded
  %cond = phi i32 [ %6, %_Dynamic_check.succeeded ], [ -1, %cond.false ]
  ret i32 %cond

_Dynamic_check.failed:                            ; preds = %cond.true
  call void @llvm.trap() #3
  unreachable
}

declare i8* @c_fetch_pointer_from_offset(i32)

declare i1 @c_isTaintedPointerToTaintedMem(i8*)

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %Tstruct.json_object_t_t* @json_value_get_object(%Tstruct.Spl_json_value_t_t* %value) #0 {
entry:
  %value.addr = alloca %Tstruct.Spl_json_value_t_t*, align 8
  store %Tstruct.Spl_json_value_t_t* %value, %Tstruct.Spl_json_value_t_t** %value.addr, align 8
  %0 = load %Tstruct.Spl_json_value_t_t*, %Tstruct.Spl_json_value_t_t** %value.addr, align 8
  %1 = ptrtoint %Tstruct.Spl_json_value_t_t* %0 to i32
  %2 = call i8* @c_fetch_pointer_from_offset(i32 %1)
  %3 = call i1 @c_isTaintedPointerToTaintedMem(i8* %2)
  br i1 %3, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %entry
  %4 = bitcast i8* %2 to %Tstruct.Spl_json_value_t_t*
  %call = call i32 @json_value_get_type(%Tstruct.Spl_json_value_t_t* %4)
  %cmp = icmp eq i32 %call, 4
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %_Dynamic_check.succeeded
  %5 = load %Tstruct.Spl_json_value_t_t*, %Tstruct.Spl_json_value_t_t** %value.addr, align 8
  %6 = ptrtoint %Tstruct.Spl_json_value_t_t* %5 to i32
  %7 = call i8* @c_fetch_pointer_from_offset(i32 %6)
  %8 = call i1 @c_isTaintedPointerToTaintedMem(i8* %7)
  br i1 %8, label %_Dynamic_check.succeeded2, label %_Dynamic_check.failed1

_Dynamic_check.succeeded2:                        ; preds = %cond.true
  %9 = bitcast i8* %7 to %Tstruct.Spl_json_value_t_t*
  %value3 = getelementptr inbounds %Tstruct.Spl_json_value_t_t, %Tstruct.Spl_json_value_t_t* %9, i32 0, i32 2
  %10 = ptrtoint %Tstruct.Spl_json_value_value_t_t* %value3 to i32
  %11 = call i8* @c_fetch_pointer_from_offset(i32 %10)
  %12 = call i1 @c_isTaintedPointerToTaintedMem(i8* %11)
  br i1 %12, label %_Dynamic_check.succeeded5, label %_Dynamic_check.failed4

_Dynamic_check.succeeded5:                        ; preds = %_Dynamic_check.succeeded2
  %13 = bitcast i8* %11 to %Tstruct.Spl_json_value_value_t_t*
  %14 = ptrtoint %Tstruct.Spl_json_value_value_t_t* %13 to i32
  %15 = call i8* @c_fetch_pointer_from_offset(i32 %14)
  %16 = call i1 @c_isTaintedPointerToTaintedMem(i8* %15)
  br i1 %16, label %_Dynamic_check.succeeded7, label %_Dynamic_check.failed6

_Dynamic_check.succeeded7:                        ; preds = %_Dynamic_check.succeeded5
  %17 = bitcast i8* %15 to %Tstruct.Spl_json_value_value_t_t*
  %object = getelementptr inbounds %Tstruct.Spl_json_value_value_t_t, %Tstruct.Spl_json_value_value_t_t* %17, i32 0, i32 2
  %object8 = bitcast i32* %object to %Tstruct.Spl_json_object_t_t**
  %18 = load %Tstruct.Spl_json_object_t_t*, %Tstruct.Spl_json_object_t_t** %object8, align 8
  br label %cond.end

cond.false:                                       ; preds = %_Dynamic_check.succeeded
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %_Dynamic_check.succeeded7
  %cond = phi %Tstruct.Spl_json_object_t_t* [ %18, %_Dynamic_check.succeeded7 ], [ null, %cond.false ]
  ret %Tstruct.Spl_json_object_t_t* %cond

_Dynamic_check.failed:                            ; preds = %entry
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed1:                           ; preds = %cond.true
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed4:                           ; preds = %_Dynamic_check.succeeded2
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed6:                           ; preds = %_Dynamic_check.succeeded5
  call void @llvm.trap() #3
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { cold noreturn nounwind }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git bc0b80e5b2aec680cf5d8c0cf8c91b8d03e5f5e1)"}
