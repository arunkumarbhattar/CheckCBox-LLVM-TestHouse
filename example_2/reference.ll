; ModuleID = 'simpleTainted.c'
source_filename = "simpleTainted.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%Tstruct.Spl_Header = type { i32, i32, i32, i32, i32, i8, float, %Tstruct.Spl_ExtremelyNestedHeader, i32, i32, i32 }
%Tstruct.Spl_ExtremelyNestedHeader = type { float, i32 }
%Tstruct.Spl_nestedHeader = type { i32, i32, i32, i8, float }
%Tstruct.Spl_SuperNestedHeader = type { i32, i32, i8, float }

@Spl_Header_var = dso_local global %Tstruct.Spl_Header zeroinitializer, align 4
@Spl_nestedHeader_var = dso_local global %Tstruct.Spl_nestedHeader zeroinitializer, align 4
@Spl_SuperNestedHeader_var = dso_local global %Tstruct.Spl_SuperNestedHeader zeroinitializer, align 4
@Spl_ExtremelyNestedHeader_var = dso_local global %Tstruct.Spl_ExtremelyNestedHeader zeroinitializer, align 4
@.str = private unnamed_addr constant [44 x i8] c"Val from c_2->simpledoublepointer[0]  = %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [44 x i8] c"Val from c_2->simpledoublepointer[1]  = %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [44 x i8] c"Val from c_2->simpledoublepointer[2]  = %s\0A\00", align 1

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
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %c_2 = alloca %Tstruct.Spl_Header*, align 8
  store i32 0, i32* %retval, align 4
  %call = call %Tstruct.Spl_Header* @experiment_1()
  %0 = bitcast %Tstruct.Spl_Header* %call to %Tstruct.Spl_Header*
  store %Tstruct.Spl_Header* %0, %Tstruct.Spl_Header** %c_2, align 8
  %1 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %2 = ptrtoint %Tstruct.Spl_Header* %1 to i32
  %3 = call i4* @c_fetch_pointer_from_offset(i32 %2)
  %4 = call i1 @c_isTaintedPointerToTaintedMem(i4* %3)
  br i1 %4, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %entry
  %5 = bitcast i4* %3 to %Tstruct.Spl_Header*
  %simpledoublepointer = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %5, i32 0, i32 8
  %simpledoublepointer1 = bitcast i32* %simpledoublepointer to i8***
  %6 = load i8**, i8*** %simpledoublepointer1, align 4
  %7 = ptrtoint i8** %6 to i32
  %8 = call i4* @c_fetch_pointer_from_offset(i32 %7)
  %9 = call i1 @c_isTaintedPointerToTaintedMem(i4* %8)
  br i1 %9, label %_Dynamic_check.succeeded3, label %_Dynamic_check.failed2

_Dynamic_check.succeeded3:                        ; preds = %_Dynamic_check.succeeded
  %10 = bitcast i4* %8 to i4**
  %arrayidx = getelementptr inbounds i4*, i4** %10, i32 0
  %11 = load i4*, i4** %arrayidx, align 4
  %12 = ptrtoint i4* %11 to i32
  %13 = call i4* @c_fetch_pointer_from_offset(i32 %12)
  %14 = call i1 @c_isTaintedPointerToTaintedMem(i4* %13)
  br i1 %14, label %_Dynamic_check.succeeded5, label %_Dynamic_check.failed4

_Dynamic_check.succeeded5:                        ; preds = %_Dynamic_check.succeeded3
  %arun = bitcast i4* %13 to i8*
  %call6 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0), i8* %arun)
  %15 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %16 = ptrtoint %Tstruct.Spl_Header* %15 to i32
  %17 = call i4* @c_fetch_pointer_from_offset(i32 %16)
  %18 = call i1 @c_isTaintedPointerToTaintedMem(i4* %17)
  br i1 %18, label %_Dynamic_check.succeeded8, label %_Dynamic_check.failed7

_Dynamic_check.succeeded8:                        ; preds = %_Dynamic_check.succeeded5
  %19 = bitcast i4* %17 to %Tstruct.Spl_Header*
  %simpledoublepointer9 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %19, i32 0, i32 8
  %simpledoublepointer10 = bitcast i32* %simpledoublepointer9 to i4***
  %20 = load i4**, i4*** %simpledoublepointer10, align 4
  %21 = ptrtoint i4** %20 to i32
  %22 = call i4* @c_fetch_pointer_from_offset(i32 %21)
  %23 = call i1 @c_isTaintedPointerToTaintedMem(i4* %22)
  br i1 %23, label %_Dynamic_check.succeeded12, label %_Dynamic_check.failed11

_Dynamic_check.succeeded12:                       ; preds = %_Dynamic_check.succeeded8
  %24 = bitcast i4* %22 to i32*
  %arrayidx13 = getelementptr inbounds i32, i32* %24, i64 1
  %arrayidx_temp = bitcast i32* %arrayidx13 to i4**
  %25 = load i4*, i4** %arrayidx_temp, align 8
  %26 = ptrtoint i4* %25 to i32
  %27 = call i4* @c_fetch_pointer_from_offset(i32 %26)
  %28 = call i1 @c_isTaintedPointerToTaintedMem(i4* %27)
  br i1 %28, label %_Dynamic_check.succeeded15, label %_Dynamic_check.failed14

_Dynamic_check.succeeded15:                       ; preds = %_Dynamic_check.succeeded12
  %arun2 = bitcast i4* %27 to i8*
  %call16 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i64 0, i64 0), i8* %arun2)
  %29 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %30 = ptrtoint %Tstruct.Spl_Header* %29 to i32
  %31 = call i4* @c_fetch_pointer_from_offset(i32 %30)
  %32 = call i1 @c_isTaintedPointerToTaintedMem(i4* %31)
  br i1 %32, label %_Dynamic_check.succeeded18, label %_Dynamic_check.failed17

_Dynamic_check.succeeded18:                       ; preds = %_Dynamic_check.succeeded15
  %33 = bitcast i4* %31 to %Tstruct.Spl_Header*
  %simpledoublepointer19 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %33, i32 0, i32 8
  %simpledoublepointer20 = bitcast i32* %simpledoublepointer19 to i4***
  %34 = load i4**, i4*** %simpledoublepointer20, align 4
  %35 = ptrtoint i4** %34 to i32
  %36 = call i4* @c_fetch_pointer_from_offset(i32 %35)
  %37 = call i1 @c_isTaintedPointerToTaintedMem(i4* %36)
  br i1 %37, label %_Dynamic_check.succeeded22, label %_Dynamic_check.failed21

_Dynamic_check.succeeded22:                       ; preds = %_Dynamic_check.succeeded18
  %38 = bitcast i4* %36 to i32*
  %arrayidx23 = getelementptr inbounds i32, i32* %38, i64 2
  %39 = load i32, i32* %arrayidx23, align 4
  %40 = bitcast i32 %39 to i32
  %41 = call i4* @c_fetch_pointer_from_offset(i32 %39)
  %42 = call i1 @c_isTaintedPointerToTaintedMem(i4* %41)
  br i1 %42, label %_Dynamic_check.succeeded25, label %_Dynamic_check.failed24

_Dynamic_check.succeeded25:                       ; preds = %_Dynamic_check.succeeded22
  %arun3 = bitcast i4* %41 to i8*
  %call26 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.2, i64 0, i64 0), i8* %arun3)
  ret i32 0

_Dynamic_check.failed:                            ; preds = %entry
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed2:                           ; preds = %_Dynamic_check.succeeded
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed4:                           ; preds = %_Dynamic_check.succeeded3
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed7:                           ; preds = %_Dynamic_check.succeeded5
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed11:                          ; preds = %_Dynamic_check.succeeded8
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed14:                          ; preds = %_Dynamic_check.succeeded12
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed17:                          ; preds = %_Dynamic_check.succeeded15
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed21:                          ; preds = %_Dynamic_check.succeeded18
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed24:                          ; preds = %_Dynamic_check.succeeded22
  call void @llvm.trap() #4
  unreachable
}

declare dso_local i32 @t_printf(...) #2

declare i4* @c_fetch_pointer_from_offset(i32)

declare i1 @c_isTaintedPointerToTaintedMem(i4*)

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #3

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { cold noreturn nounwind }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 793bfbd486346acef4555d5163b5f85cc0bef5bd)"}
