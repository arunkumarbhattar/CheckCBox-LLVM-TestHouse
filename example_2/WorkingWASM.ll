; ModuleID = 'simpleTainted.c'
source_filename = "simpleTainted.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%Tstruct.Spl_Header = type { i32, i32, i32, i32, i32, i8, float, %Tstruct.Spl_ExtremelyNestedHeader, i32, i32, i32 }
%Tstruct.Spl_ExtremelyNestedHeader = type { float, i32 }
%Tstruct.Spl_nestedHeader = type { i32, i32, i32, i8, float }
%Tstruct.Spl_SuperNestedHeader = type { i32, i32, i8, float }
%Tstruct.Header = type { i32, i32*, i8*, %Tstruct.nestedHeader*, i32, i8, float, %Tstruct.ExtremelyNestedHeader, i8**, i32, %Tstruct.nestedHeader** }
%Tstruct.nestedHeader = type { i8*, %Tstruct.SuperNestedHeader*, i32, i8, float }
%Tstruct.SuperNestedHeader = type { i8*, i32, i8, float }
%Tstruct.ExtremelyNestedHeader = type { float, i8* }

@Spl_Header_var = dso_local global %Tstruct.Spl_Header zeroinitializer, align 4
@Spl_nestedHeader_var = dso_local global %Tstruct.Spl_nestedHeader zeroinitializer, align 4
@Spl_SuperNestedHeader_var = dso_local global %Tstruct.Spl_SuperNestedHeader zeroinitializer, align 4
@Spl_ExtremelyNestedHeader_var = dso_local global %Tstruct.Spl_ExtremelyNestedHeader zeroinitializer, align 4
@.str = private unnamed_addr constant [34 x i8] c"Val from c_2->nested->name  = %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"Val from c_2->ED.favoriteCar  = %s\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dummy_1(%Tstruct.Spl_Header* noalias sret(%Tstruct.Spl_Header) align 4 %agg.result) #0 {
entry:
  %0 = bitcast %Tstruct.Spl_Header* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast (%Tstruct.Spl_Header* @Spl_Header_var to i8*), i64 48, i1 false)
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dummy_2(%Tstruct.Spl_nestedHeader* noalias sret(%Tstruct.Spl_nestedHeader) align 4 %agg.result) #0 {
entry:
  %0 = bitcast %Tstruct.Spl_nestedHeader* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast (%Tstruct.Spl_nestedHeader* @Spl_nestedHeader_var to i8*), i64 20, i1 false)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @dummy_3() #0 {
entry:
  %retval = alloca %Tstruct.Spl_SuperNestedHeader, align 4
  %0 = bitcast %Tstruct.Spl_SuperNestedHeader* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast (%Tstruct.Spl_SuperNestedHeader* @Spl_SuperNestedHeader_var to i8*), i64 16, i1 false)
  %1 = bitcast %Tstruct.Spl_SuperNestedHeader* %retval to { i64, i64 }*
  %2 = load { i64, i64 }, { i64, i64 }* %1, align 4
  ret { i64, i64 } %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @dummy_4() #0 {
entry:
  %retval = alloca %Tstruct.Spl_ExtremelyNestedHeader, align 4
  %0 = bitcast %Tstruct.Spl_ExtremelyNestedHeader* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast (%Tstruct.Spl_ExtremelyNestedHeader* @Spl_ExtremelyNestedHeader_var to i8*), i64 8, i1 false)
  %1 = bitcast %Tstruct.Spl_ExtremelyNestedHeader* %retval to i64*
  %2 = load i64, i64* %1, align 4
  ret i64 %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %Tstruct.Spl_Header* @experiment_1() #0 {
entry:
  %call = call i8* (...) @c_fetch_sandbox_address()
  %call1 = call i32 (i8*, ...) bitcast (i32 (...)* @w2c_experiment_1 to i32 (i8*, ...)*)(i8* %call)
  %conv = sext i32 %call1 to i64
  %0 = inttoptr i64 %conv to %Tstruct.Spl_Header*
  ret %Tstruct.Spl_Header* %0
}

declare dso_local i32 @w2c_experiment_1(...) #2

declare dso_local i8* @c_fetch_sandbox_address(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %Tstruct.Spl_Header* @experiment_2(%Tstruct.Header* %hdd_val) #0 {
entry:
  %hdd_val.addr = alloca %Tstruct.Spl_Header*, align 8
  %0 = bitcast %Tstruct.Header* %hdd_val to %Tstruct.Spl_Header*
  store %Tstruct.Spl_Header* %0, %Tstruct.Spl_Header** %hdd_val.addr, align 8
  %call = call i8* (...) @c_fetch_sandbox_address()
  %1 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %hdd_val.addr, align 8
  %2 = ptrtoint %Tstruct.Spl_Header* %1 to i32
  %3 = call i8* @c_fetch_pointer_from_offset(i32 %2)
  %4 = call i1 @c_isTaintedPointerToTaintedMem(i8* %3)
  br i1 %4, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %entry
  %5 = bitcast i8* %3 to %Tstruct.Spl_Header*
  %call1 = call i32 (i8*, %Tstruct.Spl_Header*, ...) bitcast (i32 (...)* @w2c_experiment_2 to i32 (i8*, %Tstruct.Spl_Header*, ...)*)(i8* %call, %Tstruct.Spl_Header* %5)
  %conv = sext i32 %call1 to i64
  %6 = inttoptr i64 %conv to %Tstruct.Spl_Header*
  ret %Tstruct.Spl_Header* %6

_Dynamic_check.failed:                            ; preds = %entry
  call void @llvm.trap() #4
  unreachable
}

declare dso_local i32 @w2c_experiment_2(...) #2

declare i8* @c_fetch_pointer_from_offset(i32)

declare i1 @c_isTaintedPointerToTaintedMem(i8*)

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %c_2 = alloca %Tstruct.Spl_Header*, align 8
  store i32 0, i32* %retval, align 4
  %call = call %Tstruct.Spl_Header* @experiment_1()
  %0 = bitcast %Tstruct.Spl_Header* %call to %Tstruct.Header*
  %1 = bitcast %Tstruct.Header* %0 to %Tstruct.Spl_Header*
  store %Tstruct.Spl_Header* %1, %Tstruct.Spl_Header** %c_2, align 8
  %2 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %3 = ptrtoint %Tstruct.Spl_Header* %2 to i32
  %4 = call i8* @c_fetch_pointer_from_offset(i32 %3)
  %5 = call i1 @c_isTaintedPointerToTaintedMem(i8* %4)
  br i1 %5, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %entry
  %6 = bitcast i8* %4 to %Tstruct.Spl_Header*
  %call1 = call %Tstruct.Spl_Header* @experiment_2(%Tstruct.Spl_Header* %6)
  %7 = bitcast %Tstruct.Spl_Header* %call1 to %Tstruct.Header*
  %8 = bitcast %Tstruct.Header* %7 to %Tstruct.Spl_Header*
  store %Tstruct.Spl_Header* %8, %Tstruct.Spl_Header** %c_2, align 8
  %9 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %10 = ptrtoint %Tstruct.Spl_Header* %9 to i32
  %11 = call i8* @c_fetch_pointer_from_offset(i32 %10)
  %12 = call i1 @c_isTaintedPointerToTaintedMem(i8* %11)
  br i1 %12, label %_Dynamic_check.succeeded3, label %_Dynamic_check.failed2

_Dynamic_check.succeeded3:                        ; preds = %_Dynamic_check.succeeded
  %13 = bitcast i8* %11 to %Tstruct.Spl_Header*
  %nested = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %13, i32 0, i32 3
  %nested4 = bitcast i32* %nested to %Tstruct.Spl_nestedHeader*
  %14 = ptrtoint %Tstruct.Spl_nestedHeader* %nested4 to i32
  %15 = call i8* @c_fetch_pointer_from_offset(i32 %14)
  %16 = call i1 @c_isTaintedPointerToTaintedMem(i8* %15)
  br i1 %16, label %_Dynamic_check.succeeded6, label %_Dynamic_check.failed5

_Dynamic_check.succeeded6:                        ; preds = %_Dynamic_check.succeeded3
  %17 = bitcast i8* %15 to %Tstruct.Spl_nestedHeader*
  %name = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %17, i32 0, i32 0
  %name7 = bitcast i32* %name to i8**
  %18 = load i8*, i8** %name7, align 4
  %19 = ptrtoint i8* %18 to i32
  %20 = call i8* @c_fetch_pointer_from_offset(i32 %19)
  %21 = call i1 @c_isTaintedPointerToTaintedMem(i8* %20)
  br i1 %21, label %_Dynamic_check.succeeded9, label %_Dynamic_check.failed8

_Dynamic_check.succeeded9:                        ; preds = %_Dynamic_check.succeeded6
  %call10 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i8* %20)
  %22 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %23 = ptrtoint %Tstruct.Spl_Header* %22 to i32
  %24 = call i8* @c_fetch_pointer_from_offset(i32 %23)
  %25 = call i1 @c_isTaintedPointerToTaintedMem(i8* %24)
  br i1 %25, label %_Dynamic_check.succeeded12, label %_Dynamic_check.failed11

_Dynamic_check.succeeded12:                       ; preds = %_Dynamic_check.succeeded9
  %26 = bitcast i8* %24 to %Tstruct.Spl_Header*
  %ED = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %26, i32 0, i32 7
  %ED13 = bitcast %Tstruct.Spl_ExtremelyNestedHeader* %ED to %Tstruct.Spl_ExtremelyNestedHeader*
  %27 = ptrtoint %Tstruct.Spl_ExtremelyNestedHeader* %ED13 to i32
  %28 = call i8* @c_fetch_pointer_from_offset(i32 %27)
  %29 = call i1 @c_isTaintedPointerToTaintedMem(i8* %28)
  br i1 %29, label %_Dynamic_check.succeeded15, label %_Dynamic_check.failed14

_Dynamic_check.succeeded15:                       ; preds = %_Dynamic_check.succeeded12
  %30 = bitcast i8* %28 to %Tstruct.Spl_ExtremelyNestedHeader*
  %favoriteCar = getelementptr inbounds %Tstruct.Spl_ExtremelyNestedHeader, %Tstruct.Spl_ExtremelyNestedHeader* %30, i32 0, i32 1
  %favoriteCar16 = bitcast i32* %favoriteCar to i8**
  %31 = load i8*, i8** %favoriteCar16, align 4
  %32 = ptrtoint i8* %31 to i32
  %33 = call i8* @c_fetch_pointer_from_offset(i32 %32)
  %34 = call i1 @c_isTaintedPointerToTaintedMem(i8* %33)
  br i1 %34, label %_Dynamic_check.succeeded18, label %_Dynamic_check.failed17

_Dynamic_check.succeeded18:                       ; preds = %_Dynamic_check.succeeded15
  %call19 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0), i8* %33)
  ret i32 0

_Dynamic_check.failed:                            ; preds = %entry
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed2:                           ; preds = %_Dynamic_check.succeeded
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed5:                           ; preds = %_Dynamic_check.succeeded3
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed8:                           ; preds = %_Dynamic_check.succeeded6
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed11:                          ; preds = %_Dynamic_check.succeeded9
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed14:                          ; preds = %_Dynamic_check.succeeded12
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed17:                          ; preds = %_Dynamic_check.succeeded15
  call void @llvm.trap() #4
  unreachable
}

declare dso_local i32 @t_printf(...) #2

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { cold noreturn nounwind }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 56576ca67797361143c2e01b0acb26f541426255)"}
