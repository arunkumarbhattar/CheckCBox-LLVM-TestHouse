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
@.str = private unnamed_addr constant [31 x i8] c"Val from c_2->twin_turbo = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Val from c_2->name  = %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"Val from c_2->nested->name  = %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"Val from c_2->ulval  = %u\0A\00", align 1
@.str.4 = private unnamed_addr constant [51 x i8] c"Val from c_2->complexdoublepointer[0]->name  = %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [51 x i8] c"Val from c_2->complexdoublepointer[1]->name  = %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [56 x i8] c"Val from c_2->nested->super_nested->brother_name  = %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [26 x i8] c"Val from c_2->arun  = %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"Val from c_2->c_p  = %c\0A\00", align 1
@.str.9 = private unnamed_addr constant [26 x i8] c"Val from c_2->arun  = %f\0A\00", align 1
@.str.10 = private unnamed_addr constant [35 x i8] c"Val from c_2->ED,coke_float  = %f\0A\00", align 1
@.str.11 = private unnamed_addr constant [36 x i8] c"Val from c_2->ED.favoriteCar  = %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [44 x i8] c"Val from c_2->simpledoublepointer[0]  = %s\0A\00", align 1
@.str.13 = private unnamed_addr constant [44 x i8] c"Val from c_2->simpledoublepointer[1]  = %s\0A\00", align 1
@.str.14 = private unnamed_addr constant [44 x i8] c"Val from c_2->simpledoublepointer[2]  = %s\0A\00", align 1
@.str.15 = private unnamed_addr constant [34 x i8] c"Val from c_2->nested->arun  = %d\0A\00", align 1
@.str.16 = private unnamed_addr constant [33 x i8] c"Val from c_2->nested->c_p  = %c\0A\00", align 1
@.str.17 = private unnamed_addr constant [34 x i8] c"Val from c_2->nested->arun  = %f\0A\00", align 1
@.str.18 = private unnamed_addr constant [48 x i8] c"Val from c_2->nested->super_nested->arun  = %d\0A\00", align 1
@.str.19 = private unnamed_addr constant [47 x i8] c"Val from c_2->nested->super_nested->c_p  = %c\0A\00", align 1
@.str.20 = private unnamed_addr constant [48 x i8] c"Val from c_2->nested->super_nested->arun  = %f\0A\00", align 1

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
  %twin_turbo = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %13, i32 0, i32 1
  %twin_turbo4 = bitcast i32* %twin_turbo to i32**
  %14 = load i32*, i32** %twin_turbo4, align 4
  %15 = ptrtoint i32* %14 to i32
  %16 = call i8* @c_fetch_pointer_from_offset(i32 %15)
  %17 = call i1 @c_isTaintedPointerToTaintedMem(i8* %16)
  br i1 %17, label %_Dynamic_check.succeeded6, label %_Dynamic_check.failed5

_Dynamic_check.succeeded6:                        ; preds = %_Dynamic_check.succeeded3
  %18 = bitcast i8* %16 to i32*
  %19 = load i32, i32* %18, align 4
  %call7 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0), i32 %19)
  %20 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %21 = ptrtoint %Tstruct.Spl_Header* %20 to i32
  %22 = call i8* @c_fetch_pointer_from_offset(i32 %21)
  %23 = call i1 @c_isTaintedPointerToTaintedMem(i8* %22)
  br i1 %23, label %_Dynamic_check.succeeded9, label %_Dynamic_check.failed8

_Dynamic_check.succeeded9:                        ; preds = %_Dynamic_check.succeeded6
  %24 = bitcast i8* %22 to %Tstruct.Spl_Header*
  %name = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %24, i32 0, i32 2
  %name10 = bitcast i32* %name to i8**
  %25 = load i8*, i8** %name10, align 8
  %26 = ptrtoint i8* %25 to i32
  %27 = call i8* @c_fetch_pointer_from_offset(i32 %26)
  %28 = call i1 @c_isTaintedPointerToTaintedMem(i8* %27)
  br i1 %28, label %_Dynamic_check.succeeded12, label %_Dynamic_check.failed11

_Dynamic_check.succeeded12:                       ; preds = %_Dynamic_check.succeeded9
  %call13 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), i8* %27)
  %29 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %30 = ptrtoint %Tstruct.Spl_Header* %29 to i32
  %31 = call i8* @c_fetch_pointer_from_offset(i32 %30)
  %32 = call i1 @c_isTaintedPointerToTaintedMem(i8* %31)
  br i1 %32, label %_Dynamic_check.succeeded15, label %_Dynamic_check.failed14

_Dynamic_check.succeeded15:                       ; preds = %_Dynamic_check.succeeded12
  %33 = bitcast i8* %31 to %Tstruct.Spl_Header*
  %nested = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %33, i32 0, i32 3
  %nested16 = bitcast i32* %nested to %Tstruct.Spl_nestedHeader**
  %34 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %nested16, align 4
  %35 = ptrtoint %Tstruct.Spl_nestedHeader* %34 to i32
  %36 = call i8* @c_fetch_pointer_from_offset(i32 %35)
  %37 = call i1 @c_isTaintedPointerToTaintedMem(i8* %36)
  br i1 %37, label %_Dynamic_check.succeeded18, label %_Dynamic_check.failed17

_Dynamic_check.succeeded18:                       ; preds = %_Dynamic_check.succeeded15
  %38 = bitcast i8* %36 to %Tstruct.Spl_nestedHeader*
  %name19 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %38, i32 0, i32 0
  %name20 = bitcast i32* %name19 to i8**
  %39 = load i8*, i8** %name20, align 8
  %40 = ptrtoint i8* %39 to i32
  %41 = call i8* @c_fetch_pointer_from_offset(i32 %40)
  %42 = call i1 @c_isTaintedPointerToTaintedMem(i8* %41)
  br i1 %42, label %_Dynamic_check.succeeded22, label %_Dynamic_check.failed21

_Dynamic_check.succeeded22:                       ; preds = %_Dynamic_check.succeeded18
  %call23 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* %41)
  %43 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %44 = ptrtoint %Tstruct.Spl_Header* %43 to i32
  %45 = call i8* @c_fetch_pointer_from_offset(i32 %44)
  %46 = call i1 @c_isTaintedPointerToTaintedMem(i8* %45)
  br i1 %46, label %_Dynamic_check.succeeded25, label %_Dynamic_check.failed24

_Dynamic_check.succeeded25:                       ; preds = %_Dynamic_check.succeeded22
  %47 = bitcast i8* %45 to %Tstruct.Spl_Header*
  %ulval = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %47, i32 0, i32 9
  %48 = load i32, i32* %ulval, align 8
  %call26 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i32 %48)
  %49 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %50 = ptrtoint %Tstruct.Spl_Header* %49 to i32
  %51 = call i8* @c_fetch_pointer_from_offset(i32 %50)
  %52 = call i1 @c_isTaintedPointerToTaintedMem(i8* %51)
  br i1 %52, label %_Dynamic_check.succeeded28, label %_Dynamic_check.failed27

_Dynamic_check.succeeded28:                       ; preds = %_Dynamic_check.succeeded25
  %53 = bitcast i8* %51 to %Tstruct.Spl_Header*
  %complexdoublepointer = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %53, i32 0, i32 10
  %complexdoublepointer29 = bitcast i32* %complexdoublepointer to %Tstruct.Spl_nestedHeader***
  %54 = load %Tstruct.Spl_nestedHeader**, %Tstruct.Spl_nestedHeader*** %complexdoublepointer29, align 4
  %55 = ptrtoint %Tstruct.Spl_nestedHeader** %54 to i32
  %56 = call i8* @c_fetch_pointer_from_offset(i32 %55)
  %57 = call i1 @c_isTaintedPointerToTaintedMem(i8* %56)
  br i1 %57, label %_Dynamic_check.succeeded31, label %_Dynamic_check.failed30

_Dynamic_check.succeeded31:                       ; preds = %_Dynamic_check.succeeded28
  %58 = bitcast i8* %56 to %Tstruct.Spl_nestedHeader**
  %59 = bitcast %Tstruct.Spl_nestedHeader** %58 to i32*
  %arrayidx = getelementptr inbounds i32, i32* %59, i64 0
  %60 = bitcast i32* %arrayidx to %Tstruct.Spl_nestedHeader**
  %61 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %60, align 8
  %62 = ptrtoint %Tstruct.Spl_nestedHeader* %61 to i32
  %63 = call i8* @c_fetch_pointer_from_offset(i32 %62)
  %64 = call i1 @c_isTaintedPointerToTaintedMem(i8* %63)
  br i1 %64, label %_Dynamic_check.succeeded33, label %_Dynamic_check.failed32

_Dynamic_check.succeeded33:                       ; preds = %_Dynamic_check.succeeded31
  %65 = bitcast i8* %63 to %Tstruct.Spl_nestedHeader*
  %name34 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %65, i32 0, i32 0
  %name35 = bitcast i32* %name34 to i8**
  %66 = load i8*, i8** %name35, align 8
  %67 = ptrtoint i8* %66 to i32
  %68 = call i8* @c_fetch_pointer_from_offset(i32 %67)
  %69 = call i1 @c_isTaintedPointerToTaintedMem(i8* %68)
  br i1 %69, label %_Dynamic_check.succeeded37, label %_Dynamic_check.failed36

_Dynamic_check.succeeded37:                       ; preds = %_Dynamic_check.succeeded33
  %call38 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.4, i64 0, i64 0), i8* %68)
  %70 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %71 = ptrtoint %Tstruct.Spl_Header* %70 to i32
  %72 = call i8* @c_fetch_pointer_from_offset(i32 %71)
  %73 = call i1 @c_isTaintedPointerToTaintedMem(i8* %72)
  br i1 %73, label %_Dynamic_check.succeeded40, label %_Dynamic_check.failed39

_Dynamic_check.succeeded40:                       ; preds = %_Dynamic_check.succeeded37
  %74 = bitcast i8* %72 to %Tstruct.Spl_Header*
  %complexdoublepointer41 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %74, i32 0, i32 10
  %complexdoublepointer42 = bitcast i32* %complexdoublepointer41 to %Tstruct.Spl_nestedHeader***
  %75 = load %Tstruct.Spl_nestedHeader**, %Tstruct.Spl_nestedHeader*** %complexdoublepointer42, align 4
  %76 = ptrtoint %Tstruct.Spl_nestedHeader** %75 to i32
  %77 = call i8* @c_fetch_pointer_from_offset(i32 %76)
  %78 = call i1 @c_isTaintedPointerToTaintedMem(i8* %77)
  br i1 %78, label %_Dynamic_check.succeeded44, label %_Dynamic_check.failed43

_Dynamic_check.succeeded44:                       ; preds = %_Dynamic_check.succeeded40
  %79 = bitcast i8* %77 to %Tstruct.Spl_nestedHeader**
  %80 = bitcast %Tstruct.Spl_nestedHeader** %79 to i32*
  %arrayidx45 = getelementptr inbounds i32, i32* %80, i64 1
  %81 = bitcast i32* %arrayidx45 to %Tstruct.Spl_nestedHeader**
  %82 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %81, align 8
  %83 = ptrtoint %Tstruct.Spl_nestedHeader* %82 to i32
  %84 = call i8* @c_fetch_pointer_from_offset(i32 %83)
  %85 = call i1 @c_isTaintedPointerToTaintedMem(i8* %84)
  br i1 %85, label %_Dynamic_check.succeeded47, label %_Dynamic_check.failed46

_Dynamic_check.succeeded47:                       ; preds = %_Dynamic_check.succeeded44
  %86 = bitcast i8* %84 to %Tstruct.Spl_nestedHeader*
  %name48 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %86, i32 0, i32 0
  %name49 = bitcast i32* %name48 to i8**
  %87 = load i8*, i8** %name49, align 8
  %88 = ptrtoint i8* %87 to i32
  %89 = call i8* @c_fetch_pointer_from_offset(i32 %88)
  %90 = call i1 @c_isTaintedPointerToTaintedMem(i8* %89)
  br i1 %90, label %_Dynamic_check.succeeded51, label %_Dynamic_check.failed50

_Dynamic_check.succeeded51:                       ; preds = %_Dynamic_check.succeeded47
  %call52 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.5, i64 0, i64 0), i8* %89)
  %91 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %92 = ptrtoint %Tstruct.Spl_Header* %91 to i32
  %93 = call i8* @c_fetch_pointer_from_offset(i32 %92)
  %94 = call i1 @c_isTaintedPointerToTaintedMem(i8* %93)
  br i1 %94, label %_Dynamic_check.succeeded54, label %_Dynamic_check.failed53

_Dynamic_check.succeeded54:                       ; preds = %_Dynamic_check.succeeded51
  %95 = bitcast i8* %93 to %Tstruct.Spl_Header*
  %nested55 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %95, i32 0, i32 3
  %nested56 = bitcast i32* %nested55 to %Tstruct.Spl_nestedHeader**
  %96 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %nested56, align 4
  %97 = ptrtoint %Tstruct.Spl_nestedHeader* %96 to i32
  %98 = call i8* @c_fetch_pointer_from_offset(i32 %97)
  %99 = call i1 @c_isTaintedPointerToTaintedMem(i8* %98)
  br i1 %99, label %_Dynamic_check.succeeded58, label %_Dynamic_check.failed57

_Dynamic_check.succeeded58:                       ; preds = %_Dynamic_check.succeeded54
  %100 = bitcast i8* %98 to %Tstruct.Spl_nestedHeader*
  %super_nested = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %100, i32 0, i32 1
  %super_nested59 = bitcast i32* %super_nested to %Tstruct.Spl_SuperNestedHeader**
  %101 = load %Tstruct.Spl_SuperNestedHeader*, %Tstruct.Spl_SuperNestedHeader** %super_nested59, align 4
  %102 = ptrtoint %Tstruct.Spl_SuperNestedHeader* %101 to i32
  %103 = call i8* @c_fetch_pointer_from_offset(i32 %102)
  %104 = call i1 @c_isTaintedPointerToTaintedMem(i8* %103)
  br i1 %104, label %_Dynamic_check.succeeded61, label %_Dynamic_check.failed60

_Dynamic_check.succeeded61:                       ; preds = %_Dynamic_check.succeeded58
  %105 = bitcast i8* %103 to %Tstruct.Spl_SuperNestedHeader*
  %brother_name = getelementptr inbounds %Tstruct.Spl_SuperNestedHeader, %Tstruct.Spl_SuperNestedHeader* %105, i32 0, i32 0
  %brother_name62 = bitcast i32* %brother_name to i8**
  %106 = load i8*, i8** %brother_name62, align 8
  %107 = ptrtoint i8* %106 to i32
  %108 = call i8* @c_fetch_pointer_from_offset(i32 %107)
  %109 = call i1 @c_isTaintedPointerToTaintedMem(i8* %108)
  br i1 %109, label %_Dynamic_check.succeeded64, label %_Dynamic_check.failed63

_Dynamic_check.succeeded64:                       ; preds = %_Dynamic_check.succeeded61
  %call65 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.6, i64 0, i64 0), i8* %108)
  %110 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %111 = ptrtoint %Tstruct.Spl_Header* %110 to i32
  %112 = call i8* @c_fetch_pointer_from_offset(i32 %111)
  %113 = call i1 @c_isTaintedPointerToTaintedMem(i8* %112)
  br i1 %113, label %_Dynamic_check.succeeded67, label %_Dynamic_check.failed66

_Dynamic_check.succeeded67:                       ; preds = %_Dynamic_check.succeeded64
  %114 = bitcast i8* %112 to %Tstruct.Spl_Header*
  %arun = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %114, i32 0, i32 4
  %115 = load i32, i32* %arun, align 8
  %call68 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.7, i64 0, i64 0), i32 %115)
  %116 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %117 = ptrtoint %Tstruct.Spl_Header* %116 to i32
  %118 = call i8* @c_fetch_pointer_from_offset(i32 %117)
  %119 = call i1 @c_isTaintedPointerToTaintedMem(i8* %118)
  br i1 %119, label %_Dynamic_check.succeeded70, label %_Dynamic_check.failed69

_Dynamic_check.succeeded70:                       ; preds = %_Dynamic_check.succeeded67
  %120 = bitcast i8* %118 to %Tstruct.Spl_Header*
  %c_p = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %120, i32 0, i32 5
  %121 = load i8, i8* %c_p, align 4
  %conv = sext i8 %121 to i32
  %call71 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8, i64 0, i64 0), i32 %conv)
  %122 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %123 = ptrtoint %Tstruct.Spl_Header* %122 to i32
  %124 = call i8* @c_fetch_pointer_from_offset(i32 %123)
  %125 = call i1 @c_isTaintedPointerToTaintedMem(i8* %124)
  br i1 %125, label %_Dynamic_check.succeeded73, label %_Dynamic_check.failed72

_Dynamic_check.succeeded73:                       ; preds = %_Dynamic_check.succeeded70
  %126 = bitcast i8* %124 to %Tstruct.Spl_Header*
  %twin = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %126, i32 0, i32 6
  %127 = load float, float* %twin, align 8
  %conv74 = fpext float %127 to double
  %call75 = call i32 (i8*, double, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, double, ...)*)(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.9, i64 0, i64 0), double %conv74)
  %128 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %129 = ptrtoint %Tstruct.Spl_Header* %128 to i32
  %130 = call i8* @c_fetch_pointer_from_offset(i32 %129)
  %131 = call i1 @c_isTaintedPointerToTaintedMem(i8* %130)
  br i1 %131, label %_Dynamic_check.succeeded77, label %_Dynamic_check.failed76

_Dynamic_check.succeeded77:                       ; preds = %_Dynamic_check.succeeded73
  %132 = bitcast i8* %130 to %Tstruct.Spl_Header*
  %ED = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %132, i32 0, i32 7
  %ED78 = bitcast %Tstruct.Spl_ExtremelyNestedHeader* %ED to %Tstruct.Spl_ExtremelyNestedHeader*
  %133 = ptrtoint %Tstruct.Spl_ExtremelyNestedHeader* %ED78 to i32
  %134 = call i8* @c_fetch_pointer_from_offset(i32 %133)
  %135 = call i1 @c_isTaintedPointerToTaintedMem(i8* %134)
  br i1 %135, label %_Dynamic_check.succeeded80, label %_Dynamic_check.failed79

_Dynamic_check.succeeded80:                       ; preds = %_Dynamic_check.succeeded77
  %136 = bitcast i8* %134 to %Tstruct.Spl_ExtremelyNestedHeader*
  %coke_float = getelementptr inbounds %Tstruct.Spl_ExtremelyNestedHeader, %Tstruct.Spl_ExtremelyNestedHeader* %136, i32 0, i32 0
  %137 = load float, float* %coke_float, align 4
  %conv81 = fpext float %137 to double
  %call82 = call i32 (i8*, double, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, double, ...)*)(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.10, i64 0, i64 0), double %conv81)
  %138 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %139 = ptrtoint %Tstruct.Spl_Header* %138 to i32
  %140 = call i8* @c_fetch_pointer_from_offset(i32 %139)
  %141 = call i1 @c_isTaintedPointerToTaintedMem(i8* %140)
  br i1 %141, label %_Dynamic_check.succeeded84, label %_Dynamic_check.failed83

_Dynamic_check.succeeded84:                       ; preds = %_Dynamic_check.succeeded80
  %142 = bitcast i8* %140 to %Tstruct.Spl_Header*
  %ED85 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %142, i32 0, i32 7
  %ED86 = bitcast %Tstruct.Spl_ExtremelyNestedHeader* %ED85 to %Tstruct.Spl_ExtremelyNestedHeader*
  %143 = ptrtoint %Tstruct.Spl_ExtremelyNestedHeader* %ED86 to i32
  %144 = call i8* @c_fetch_pointer_from_offset(i32 %143)
  %145 = call i1 @c_isTaintedPointerToTaintedMem(i8* %144)
  br i1 %145, label %_Dynamic_check.succeeded88, label %_Dynamic_check.failed87

_Dynamic_check.succeeded88:                       ; preds = %_Dynamic_check.succeeded84
  %146 = bitcast i8* %144 to %Tstruct.Spl_ExtremelyNestedHeader*
  %favoriteCar = getelementptr inbounds %Tstruct.Spl_ExtremelyNestedHeader, %Tstruct.Spl_ExtremelyNestedHeader* %146, i32 0, i32 1
  %favoriteCar89 = bitcast i32* %favoriteCar to i8**
  %147 = load i8*, i8** %favoriteCar89, align 4
  %148 = ptrtoint i8* %147 to i32
  %149 = call i8* @c_fetch_pointer_from_offset(i32 %148)
  %150 = call i1 @c_isTaintedPointerToTaintedMem(i8* %149)
  br i1 %150, label %_Dynamic_check.succeeded91, label %_Dynamic_check.failed90

_Dynamic_check.succeeded91:                       ; preds = %_Dynamic_check.succeeded88
  %call92 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.11, i64 0, i64 0), i8* %149)
  %151 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %152 = ptrtoint %Tstruct.Spl_Header* %151 to i32
  %153 = call i8* @c_fetch_pointer_from_offset(i32 %152)
  %154 = call i1 @c_isTaintedPointerToTaintedMem(i8* %153)
  br i1 %154, label %_Dynamic_check.succeeded94, label %_Dynamic_check.failed93

_Dynamic_check.succeeded94:                       ; preds = %_Dynamic_check.succeeded91
  %155 = bitcast i8* %153 to %Tstruct.Spl_Header*
  %simpledoublepointer = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %155, i32 0, i32 8
  %simpledoublepointer95 = bitcast i32* %simpledoublepointer to i8***
  %156 = load i8**, i8*** %simpledoublepointer95, align 4
  %157 = ptrtoint i8** %156 to i32
  %158 = call i8* @c_fetch_pointer_from_offset(i32 %157)
  %159 = call i1 @c_isTaintedPointerToTaintedMem(i8* %158)
  br i1 %159, label %_Dynamic_check.succeeded97, label %_Dynamic_check.failed96

_Dynamic_check.succeeded97:                       ; preds = %_Dynamic_check.succeeded94
  %160 = bitcast i8* %158 to i8**
  %161 = bitcast i8** %160 to i32*
  %arrayidx98 = getelementptr inbounds i32, i32* %161, i64 0
  %162 = bitcast i32* %arrayidx98 to i8**
  %163 = load i8*, i8** %162, align 8
  %164 = ptrtoint i8* %163 to i32
  %165 = call i8* @c_fetch_pointer_from_offset(i32 %164)
  %166 = call i1 @c_isTaintedPointerToTaintedMem(i8* %165)
  br i1 %166, label %_Dynamic_check.succeeded100, label %_Dynamic_check.failed99

_Dynamic_check.succeeded100:                      ; preds = %_Dynamic_check.succeeded97
  %call101 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.12, i64 0, i64 0), i8* %165)
  %167 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %168 = ptrtoint %Tstruct.Spl_Header* %167 to i32
  %169 = call i8* @c_fetch_pointer_from_offset(i32 %168)
  %170 = call i1 @c_isTaintedPointerToTaintedMem(i8* %169)
  br i1 %170, label %_Dynamic_check.succeeded103, label %_Dynamic_check.failed102

_Dynamic_check.succeeded103:                      ; preds = %_Dynamic_check.succeeded100
  %171 = bitcast i8* %169 to %Tstruct.Spl_Header*
  %simpledoublepointer104 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %171, i32 0, i32 8
  %simpledoublepointer105 = bitcast i32* %simpledoublepointer104 to i8***
  %172 = load i8**, i8*** %simpledoublepointer105, align 4
  %173 = ptrtoint i8** %172 to i32
  %174 = call i8* @c_fetch_pointer_from_offset(i32 %173)
  %175 = call i1 @c_isTaintedPointerToTaintedMem(i8* %174)
  br i1 %175, label %_Dynamic_check.succeeded107, label %_Dynamic_check.failed106

_Dynamic_check.succeeded107:                      ; preds = %_Dynamic_check.succeeded103
  %176 = bitcast i8* %174 to i8**
  %177 = bitcast i8** %176 to i32*
  %arrayidx108 = getelementptr inbounds i32, i32* %177, i64 1
  %178 = bitcast i32* %arrayidx108 to i8**
  %179 = load i8*, i8** %178, align 8
  %180 = ptrtoint i8* %179 to i32
  %181 = call i8* @c_fetch_pointer_from_offset(i32 %180)
  %182 = call i1 @c_isTaintedPointerToTaintedMem(i8* %181)
  br i1 %182, label %_Dynamic_check.succeeded110, label %_Dynamic_check.failed109

_Dynamic_check.succeeded110:                      ; preds = %_Dynamic_check.succeeded107
  %call111 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.13, i64 0, i64 0), i8* %181)
  %183 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %184 = ptrtoint %Tstruct.Spl_Header* %183 to i32
  %185 = call i8* @c_fetch_pointer_from_offset(i32 %184)
  %186 = call i1 @c_isTaintedPointerToTaintedMem(i8* %185)
  br i1 %186, label %_Dynamic_check.succeeded113, label %_Dynamic_check.failed112

_Dynamic_check.succeeded113:                      ; preds = %_Dynamic_check.succeeded110
  %187 = bitcast i8* %185 to %Tstruct.Spl_Header*
  %simpledoublepointer114 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %187, i32 0, i32 8
  %simpledoublepointer115 = bitcast i32* %simpledoublepointer114 to i8***
  %188 = load i8**, i8*** %simpledoublepointer115, align 4
  %189 = ptrtoint i8** %188 to i32
  %190 = call i8* @c_fetch_pointer_from_offset(i32 %189)
  %191 = call i1 @c_isTaintedPointerToTaintedMem(i8* %190)
  br i1 %191, label %_Dynamic_check.succeeded117, label %_Dynamic_check.failed116

_Dynamic_check.succeeded117:                      ; preds = %_Dynamic_check.succeeded113
  %192 = bitcast i8* %190 to i8**
  %193 = bitcast i8** %192 to i32*
  %arrayidx118 = getelementptr inbounds i32, i32* %193, i64 2
  %194 = bitcast i32* %arrayidx118 to i8**
  %195 = load i8*, i8** %194, align 8
  %196 = ptrtoint i8* %195 to i32
  %197 = call i8* @c_fetch_pointer_from_offset(i32 %196)
  %198 = call i1 @c_isTaintedPointerToTaintedMem(i8* %197)
  br i1 %198, label %_Dynamic_check.succeeded120, label %_Dynamic_check.failed119

_Dynamic_check.succeeded120:                      ; preds = %_Dynamic_check.succeeded117
  %call121 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.14, i64 0, i64 0), i8* %197)
  %199 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %200 = ptrtoint %Tstruct.Spl_Header* %199 to i32
  %201 = call i8* @c_fetch_pointer_from_offset(i32 %200)
  %202 = call i1 @c_isTaintedPointerToTaintedMem(i8* %201)
  br i1 %202, label %_Dynamic_check.succeeded123, label %_Dynamic_check.failed122

_Dynamic_check.succeeded123:                      ; preds = %_Dynamic_check.succeeded120
  %203 = bitcast i8* %201 to %Tstruct.Spl_Header*
  %nested124 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %203, i32 0, i32 3
  %nested125 = bitcast i32* %nested124 to %Tstruct.Spl_nestedHeader**
  %204 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %nested125, align 4
  %205 = ptrtoint %Tstruct.Spl_nestedHeader* %204 to i32
  %206 = call i8* @c_fetch_pointer_from_offset(i32 %205)
  %207 = call i1 @c_isTaintedPointerToTaintedMem(i8* %206)
  br i1 %207, label %_Dynamic_check.succeeded127, label %_Dynamic_check.failed126

_Dynamic_check.succeeded127:                      ; preds = %_Dynamic_check.succeeded123
  %208 = bitcast i8* %206 to %Tstruct.Spl_nestedHeader*
  %arun128 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %208, i32 0, i32 2
  %209 = load i32, i32* %arun128, align 8
  %call129 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.15, i64 0, i64 0), i32 %209)
  %210 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %211 = ptrtoint %Tstruct.Spl_Header* %210 to i32
  %212 = call i8* @c_fetch_pointer_from_offset(i32 %211)
  %213 = call i1 @c_isTaintedPointerToTaintedMem(i8* %212)
  br i1 %213, label %_Dynamic_check.succeeded131, label %_Dynamic_check.failed130

_Dynamic_check.succeeded131:                      ; preds = %_Dynamic_check.succeeded127
  %214 = bitcast i8* %212 to %Tstruct.Spl_Header*
  %nested132 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %214, i32 0, i32 3
  %nested133 = bitcast i32* %nested132 to %Tstruct.Spl_nestedHeader**
  %215 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %nested133, align 4
  %216 = ptrtoint %Tstruct.Spl_nestedHeader* %215 to i32
  %217 = call i8* @c_fetch_pointer_from_offset(i32 %216)
  %218 = call i1 @c_isTaintedPointerToTaintedMem(i8* %217)
  br i1 %218, label %_Dynamic_check.succeeded135, label %_Dynamic_check.failed134

_Dynamic_check.succeeded135:                      ; preds = %_Dynamic_check.succeeded131
  %219 = bitcast i8* %217 to %Tstruct.Spl_nestedHeader*
  %c_p136 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %219, i32 0, i32 3
  %220 = load i8, i8* %c_p136, align 4
  %conv137 = sext i8 %220 to i32
  %call138 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.16, i64 0, i64 0), i32 %conv137)
  %221 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %222 = ptrtoint %Tstruct.Spl_Header* %221 to i32
  %223 = call i8* @c_fetch_pointer_from_offset(i32 %222)
  %224 = call i1 @c_isTaintedPointerToTaintedMem(i8* %223)
  br i1 %224, label %_Dynamic_check.succeeded140, label %_Dynamic_check.failed139

_Dynamic_check.succeeded140:                      ; preds = %_Dynamic_check.succeeded135
  %225 = bitcast i8* %223 to %Tstruct.Spl_Header*
  %nested141 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %225, i32 0, i32 3
  %nested142 = bitcast i32* %nested141 to %Tstruct.Spl_nestedHeader**
  %226 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %nested142, align 4
  %227 = ptrtoint %Tstruct.Spl_nestedHeader* %226 to i32
  %228 = call i8* @c_fetch_pointer_from_offset(i32 %227)
  %229 = call i1 @c_isTaintedPointerToTaintedMem(i8* %228)
  br i1 %229, label %_Dynamic_check.succeeded144, label %_Dynamic_check.failed143

_Dynamic_check.succeeded144:                      ; preds = %_Dynamic_check.succeeded140
  %230 = bitcast i8* %228 to %Tstruct.Spl_nestedHeader*
  %twin145 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %230, i32 0, i32 4
  %231 = load float, float* %twin145, align 8
  %conv146 = fpext float %231 to double
  %call147 = call i32 (i8*, double, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, double, ...)*)(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.17, i64 0, i64 0), double %conv146)
  %232 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %233 = ptrtoint %Tstruct.Spl_Header* %232 to i32
  %234 = call i8* @c_fetch_pointer_from_offset(i32 %233)
  %235 = call i1 @c_isTaintedPointerToTaintedMem(i8* %234)
  br i1 %235, label %_Dynamic_check.succeeded149, label %_Dynamic_check.failed148

_Dynamic_check.succeeded149:                      ; preds = %_Dynamic_check.succeeded144
  %236 = bitcast i8* %234 to %Tstruct.Spl_Header*
  %nested150 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %236, i32 0, i32 3
  %nested151 = bitcast i32* %nested150 to %Tstruct.Spl_nestedHeader**
  %237 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %nested151, align 4
  %238 = ptrtoint %Tstruct.Spl_nestedHeader* %237 to i32
  %239 = call i8* @c_fetch_pointer_from_offset(i32 %238)
  %240 = call i1 @c_isTaintedPointerToTaintedMem(i8* %239)
  br i1 %240, label %_Dynamic_check.succeeded153, label %_Dynamic_check.failed152

_Dynamic_check.succeeded153:                      ; preds = %_Dynamic_check.succeeded149
  %241 = bitcast i8* %239 to %Tstruct.Spl_nestedHeader*
  %super_nested154 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %241, i32 0, i32 1
  %super_nested155 = bitcast i32* %super_nested154 to %Tstruct.Spl_SuperNestedHeader**
  %242 = load %Tstruct.Spl_SuperNestedHeader*, %Tstruct.Spl_SuperNestedHeader** %super_nested155, align 4
  %243 = ptrtoint %Tstruct.Spl_SuperNestedHeader* %242 to i32
  %244 = call i8* @c_fetch_pointer_from_offset(i32 %243)
  %245 = call i1 @c_isTaintedPointerToTaintedMem(i8* %244)
  br i1 %245, label %_Dynamic_check.succeeded157, label %_Dynamic_check.failed156

_Dynamic_check.succeeded157:                      ; preds = %_Dynamic_check.succeeded153
  %246 = bitcast i8* %244 to %Tstruct.Spl_SuperNestedHeader*
  %arun158 = getelementptr inbounds %Tstruct.Spl_SuperNestedHeader, %Tstruct.Spl_SuperNestedHeader* %246, i32 0, i32 1
  %247 = load i32, i32* %arun158, align 4
  %call159 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.18, i64 0, i64 0), i32 %247)
  %248 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %249 = ptrtoint %Tstruct.Spl_Header* %248 to i32
  %250 = call i8* @c_fetch_pointer_from_offset(i32 %249)
  %251 = call i1 @c_isTaintedPointerToTaintedMem(i8* %250)
  br i1 %251, label %_Dynamic_check.succeeded161, label %_Dynamic_check.failed160

_Dynamic_check.succeeded161:                      ; preds = %_Dynamic_check.succeeded157
  %252 = bitcast i8* %250 to %Tstruct.Spl_Header*
  %nested162 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %252, i32 0, i32 3
  %nested163 = bitcast i32* %nested162 to %Tstruct.Spl_nestedHeader**
  %253 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %nested163, align 4
  %254 = ptrtoint %Tstruct.Spl_nestedHeader* %253 to i32
  %255 = call i8* @c_fetch_pointer_from_offset(i32 %254)
  %256 = call i1 @c_isTaintedPointerToTaintedMem(i8* %255)
  br i1 %256, label %_Dynamic_check.succeeded165, label %_Dynamic_check.failed164

_Dynamic_check.succeeded165:                      ; preds = %_Dynamic_check.succeeded161
  %257 = bitcast i8* %255 to %Tstruct.Spl_nestedHeader*
  %super_nested166 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %257, i32 0, i32 1
  %super_nested167 = bitcast i32* %super_nested166 to %Tstruct.Spl_SuperNestedHeader**
  %258 = load %Tstruct.Spl_SuperNestedHeader*, %Tstruct.Spl_SuperNestedHeader** %super_nested167, align 4
  %259 = ptrtoint %Tstruct.Spl_SuperNestedHeader* %258 to i32
  %260 = call i8* @c_fetch_pointer_from_offset(i32 %259)
  %261 = call i1 @c_isTaintedPointerToTaintedMem(i8* %260)
  br i1 %261, label %_Dynamic_check.succeeded169, label %_Dynamic_check.failed168

_Dynamic_check.succeeded169:                      ; preds = %_Dynamic_check.succeeded165
  %262 = bitcast i8* %260 to %Tstruct.Spl_SuperNestedHeader*
  %c_p170 = getelementptr inbounds %Tstruct.Spl_SuperNestedHeader, %Tstruct.Spl_SuperNestedHeader* %262, i32 0, i32 2
  %263 = load i8, i8* %c_p170, align 8
  %conv171 = sext i8 %263 to i32
  %call172 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.19, i64 0, i64 0), i32 %conv171)
  %264 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %265 = ptrtoint %Tstruct.Spl_Header* %264 to i32
  %266 = call i8* @c_fetch_pointer_from_offset(i32 %265)
  %267 = call i1 @c_isTaintedPointerToTaintedMem(i8* %266)
  br i1 %267, label %_Dynamic_check.succeeded174, label %_Dynamic_check.failed173

_Dynamic_check.succeeded174:                      ; preds = %_Dynamic_check.succeeded169
  %268 = bitcast i8* %266 to %Tstruct.Spl_Header*
  %nested175 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %268, i32 0, i32 3
  %nested176 = bitcast i32* %nested175 to %Tstruct.Spl_nestedHeader**
  %269 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %nested176, align 4
  %270 = ptrtoint %Tstruct.Spl_nestedHeader* %269 to i32
  %271 = call i8* @c_fetch_pointer_from_offset(i32 %270)
  %272 = call i1 @c_isTaintedPointerToTaintedMem(i8* %271)
  br i1 %272, label %_Dynamic_check.succeeded178, label %_Dynamic_check.failed177

_Dynamic_check.succeeded178:                      ; preds = %_Dynamic_check.succeeded174
  %273 = bitcast i8* %271 to %Tstruct.Spl_nestedHeader*
  %super_nested179 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %273, i32 0, i32 1
  %super_nested180 = bitcast i32* %super_nested179 to %Tstruct.Spl_SuperNestedHeader**
  %274 = load %Tstruct.Spl_SuperNestedHeader*, %Tstruct.Spl_SuperNestedHeader** %super_nested180, align 4
  %275 = ptrtoint %Tstruct.Spl_SuperNestedHeader* %274 to i32
  %276 = call i8* @c_fetch_pointer_from_offset(i32 %275)
  %277 = call i1 @c_isTaintedPointerToTaintedMem(i8* %276)
  br i1 %277, label %_Dynamic_check.succeeded182, label %_Dynamic_check.failed181

_Dynamic_check.succeeded182:                      ; preds = %_Dynamic_check.succeeded178
  %278 = bitcast i8* %276 to %Tstruct.Spl_SuperNestedHeader*
  %twin183 = getelementptr inbounds %Tstruct.Spl_SuperNestedHeader, %Tstruct.Spl_SuperNestedHeader* %278, i32 0, i32 3
  %279 = load float, float* %twin183, align 4
  %conv184 = fpext float %279 to double
  %call185 = call i32 (i8*, double, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, double, ...)*)(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.20, i64 0, i64 0), double %conv184)
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

_Dynamic_check.failed21:                          ; preds = %_Dynamic_check.succeeded18
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed24:                          ; preds = %_Dynamic_check.succeeded22
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed27:                          ; preds = %_Dynamic_check.succeeded25
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed30:                          ; preds = %_Dynamic_check.succeeded28
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed32:                          ; preds = %_Dynamic_check.succeeded31
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed36:                          ; preds = %_Dynamic_check.succeeded33
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed39:                          ; preds = %_Dynamic_check.succeeded37
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed43:                          ; preds = %_Dynamic_check.succeeded40
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed46:                          ; preds = %_Dynamic_check.succeeded44
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed50:                          ; preds = %_Dynamic_check.succeeded47
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed53:                          ; preds = %_Dynamic_check.succeeded51
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed57:                          ; preds = %_Dynamic_check.succeeded54
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed60:                          ; preds = %_Dynamic_check.succeeded58
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed63:                          ; preds = %_Dynamic_check.succeeded61
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed66:                          ; preds = %_Dynamic_check.succeeded64
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed69:                          ; preds = %_Dynamic_check.succeeded67
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed72:                          ; preds = %_Dynamic_check.succeeded70
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed76:                          ; preds = %_Dynamic_check.succeeded73
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed79:                          ; preds = %_Dynamic_check.succeeded77
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed83:                          ; preds = %_Dynamic_check.succeeded80
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed87:                          ; preds = %_Dynamic_check.succeeded84
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed90:                          ; preds = %_Dynamic_check.succeeded88
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed93:                          ; preds = %_Dynamic_check.succeeded91
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed96:                          ; preds = %_Dynamic_check.succeeded94
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed99:                          ; preds = %_Dynamic_check.succeeded97
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed102:                         ; preds = %_Dynamic_check.succeeded100
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed106:                         ; preds = %_Dynamic_check.succeeded103
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed109:                         ; preds = %_Dynamic_check.succeeded107
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed112:                         ; preds = %_Dynamic_check.succeeded110
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed116:                         ; preds = %_Dynamic_check.succeeded113
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed119:                         ; preds = %_Dynamic_check.succeeded117
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed122:                         ; preds = %_Dynamic_check.succeeded120
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed126:                         ; preds = %_Dynamic_check.succeeded123
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed130:                         ; preds = %_Dynamic_check.succeeded127
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed134:                         ; preds = %_Dynamic_check.succeeded131
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed139:                         ; preds = %_Dynamic_check.succeeded135
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed143:                         ; preds = %_Dynamic_check.succeeded140
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed148:                         ; preds = %_Dynamic_check.succeeded144
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed152:                         ; preds = %_Dynamic_check.succeeded149
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed156:                         ; preds = %_Dynamic_check.succeeded153
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed160:                         ; preds = %_Dynamic_check.succeeded157
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed164:                         ; preds = %_Dynamic_check.succeeded161
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed168:                         ; preds = %_Dynamic_check.succeeded165
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed173:                         ; preds = %_Dynamic_check.succeeded169
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed177:                         ; preds = %_Dynamic_check.succeeded174
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed181:                         ; preds = %_Dynamic_check.succeeded178
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
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 9563a4a4e5fd5f14cb3c3bb8528fbac508ef5664)"}
