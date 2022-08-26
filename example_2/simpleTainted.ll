; ModuleID = 'simpleTainted.c'
source_filename = "simpleTainted.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%Tstruct.Spl_Header = type { i32, i32, i32, i32, i32, i8, float, %Tstruct.Spl_ExtremelyNestedHeader, i32, i32, i32 }
%Tstruct.Spl_ExtremelyNestedHeader = type { float, i32 }
%Tstruct.Spl_nestedHeader = type { i32, i32, i32, i8, float }
%Tstruct.Spl_SuperNestedHeader = type { i32, i32, i8, float }
%Tstruct.nestedHeader = type { i8*, %Tstruct.SuperNestedHeader*, i32, i8, float }
%Tstruct.SuperNestedHeader = type { i8*, i32, i8, float }

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
define dso_local %Tstruct.Spl_Header* @experiment_2(%Tstruct.Spl_Header* %hdd_val) #0 {
entry:
  %hdd_val.addr = alloca %Tstruct.Spl_Header*, align 8
  store %Tstruct.Spl_Header* %hdd_val, %Tstruct.Spl_Header** %hdd_val.addr, align 8
  %call = call i8* (...) @c_fetch_sandbox_address()
  %0 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %hdd_val.addr, align 8
  %1 = bitcast %Tstruct.Spl_Header* %0 to i8*
  %call1 = call i32 @c_fetch_pointer_offset(i8* %1)
  %call2 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @w2c_experiment_2 to i32 (i8*, i32, ...)*)(i8* %call, i32 %call1)
  %conv = sext i32 %call2 to i64
  %2 = inttoptr i64 %conv to %Tstruct.Spl_Header*
  ret %Tstruct.Spl_Header* %2
}

declare dso_local i32 @w2c_experiment_2(...) #2

declare dso_local i32 @c_fetch_pointer_offset(i8*) #2

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
  %3 = call i8* @c_fetch_pointer_from_offset(i32 %2)
  %4 = call i1 @c_isTaintedPointerToTaintedMem(i8* %3)
  br i1 %4, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %entry
  %5 = bitcast i8* %3 to %Tstruct.Spl_Header*
  %twin_turbo = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %5, i32 0, i32 1
  %twin_turbo1 = bitcast i32* %twin_turbo to i32**
  %6 = load i32*, i32** %twin_turbo1, align 4
  %7 = ptrtoint i32* %6 to i32
  %8 = call i8* @c_fetch_pointer_from_offset(i32 %7)
  %9 = call i1 @c_isTaintedPointerToTaintedMem(i8* %8)
  br i1 %9, label %_Dynamic_check.succeeded3, label %_Dynamic_check.failed2

_Dynamic_check.succeeded3:                        ; preds = %_Dynamic_check.succeeded
  %10 = bitcast i8* %8 to i32*
  %11 = load i32, i32* %10, align 4
  %call4 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0), i32 %11)
  %12 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %13 = ptrtoint %Tstruct.Spl_Header* %12 to i32
  %14 = call i8* @c_fetch_pointer_from_offset(i32 %13)
  %15 = call i1 @c_isTaintedPointerToTaintedMem(i8* %14)
  br i1 %15, label %_Dynamic_check.succeeded6, label %_Dynamic_check.failed5

_Dynamic_check.succeeded6:                        ; preds = %_Dynamic_check.succeeded3
  %16 = bitcast i8* %14 to %Tstruct.Spl_Header*
  %name = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %16, i32 0, i32 2
  %name7 = bitcast i32* %name to i8**
  %17 = load i8*, i8** %name7, align 8
  %18 = ptrtoint i8* %17 to i32
  %19 = call i8* @c_fetch_pointer_from_offset(i32 %18)
  %20 = call i1 @c_isTaintedPointerToTaintedMem(i8* %19)
  br i1 %20, label %_Dynamic_check.succeeded9, label %_Dynamic_check.failed8

_Dynamic_check.succeeded9:                        ; preds = %_Dynamic_check.succeeded6
  %call10 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), i8* %19)
  %21 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %22 = ptrtoint %Tstruct.Spl_Header* %21 to i32
  %23 = call i8* @c_fetch_pointer_from_offset(i32 %22)
  %24 = call i1 @c_isTaintedPointerToTaintedMem(i8* %23)
  br i1 %24, label %_Dynamic_check.succeeded12, label %_Dynamic_check.failed11

_Dynamic_check.succeeded12:                       ; preds = %_Dynamic_check.succeeded9
  %25 = bitcast i8* %23 to %Tstruct.Spl_Header*
  %nested = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %25, i32 0, i32 3
  %nested13 = bitcast i32* %nested to %Tstruct.nestedHeader**
  %26 = load %Tstruct.Spl_nestedHeader*, %Tstruct.nestedHeader** %nested13, align 4
  %27 = ptrtoint %Tstruct.Spl_nestedHeader* %26 to i32
  %28 = call i8* @c_fetch_pointer_from_offset(i32 %27)
  %29 = call i1 @c_isTaintedPointerToTaintedMem(i8* %28)
  br i1 %29, label %_Dynamic_check.succeeded15, label %_Dynamic_check.failed14

_Dynamic_check.succeeded15:                       ; preds = %_Dynamic_check.succeeded12
  %30 = bitcast i8* %28 to %Tstruct.Spl_nestedHeader*
  %name16 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %30, i32 0, i32 0
  %name17 = bitcast i32* %name16 to i8**
  %31 = load i8*, i8** %name17, align 8
  %32 = ptrtoint i8* %31 to i32
  %33 = call i8* @c_fetch_pointer_from_offset(i32 %32)
  %34 = call i1 @c_isTaintedPointerToTaintedMem(i8* %33)
  br i1 %34, label %_Dynamic_check.succeeded19, label %_Dynamic_check.failed18

_Dynamic_check.succeeded19:                       ; preds = %_Dynamic_check.succeeded15
  %call20 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i8* %33)
  %35 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %36 = ptrtoint %Tstruct.Spl_Header* %35 to i32
  %37 = call i8* @c_fetch_pointer_from_offset(i32 %36)
  %38 = call i1 @c_isTaintedPointerToTaintedMem(i8* %37)
  br i1 %38, label %_Dynamic_check.succeeded22, label %_Dynamic_check.failed21

_Dynamic_check.succeeded22:                       ; preds = %_Dynamic_check.succeeded19
  %39 = bitcast i8* %37 to %Tstruct.Spl_Header*
  %ulval = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %39, i32 0, i32 9
  %40 = load i32, i32* %ulval, align 8
  %call23 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i32 %40)
  %41 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %42 = ptrtoint %Tstruct.Spl_Header* %41 to i32
  %43 = call i8* @c_fetch_pointer_from_offset(i32 %42)
  %44 = call i1 @c_isTaintedPointerToTaintedMem(i8* %43)
  br i1 %44, label %_Dynamic_check.succeeded25, label %_Dynamic_check.failed24

_Dynamic_check.succeeded25:                       ; preds = %_Dynamic_check.succeeded22
  %45 = bitcast i8* %43 to %Tstruct.Spl_Header*
  %complexdoublepointer = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %45, i32 0, i32 10
  %complexdoublepointer26 = bitcast i32* %complexdoublepointer to %Tstruct.nestedHeader***
  %46 = load %Tstruct.Spl_nestedHeader**, %Tstruct.nestedHeader*** %complexdoublepointer26, align 4
  %47 = ptrtoint %Tstruct.Spl_nestedHeader** %46 to i32
  %48 = call i8* @c_fetch_pointer_from_offset(i32 %47)
  %49 = call i1 @c_isTaintedPointerToTaintedMem(i8* %48)
  br i1 %49, label %_Dynamic_check.succeeded28, label %_Dynamic_check.failed27

_Dynamic_check.succeeded28:                       ; preds = %_Dynamic_check.succeeded25
  %50 = bitcast i8* %48 to %Tstruct.Spl_nestedHeader**
  %51 = bitcast %Tstruct.Spl_nestedHeader** %50 to i32*
  %arrayidx = getelementptr inbounds i32, i32* %51, i64 0
  %52 = bitcast i32* %arrayidx to %Tstruct.Spl_nestedHeader**
  %53 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %52, align 8
  %54 = ptrtoint %Tstruct.Spl_nestedHeader* %53 to i32
  %55 = call i8* @c_fetch_pointer_from_offset(i32 %54)
  %56 = call i1 @c_isTaintedPointerToTaintedMem(i8* %55)
  br i1 %56, label %_Dynamic_check.succeeded30, label %_Dynamic_check.failed29

_Dynamic_check.succeeded30:                       ; preds = %_Dynamic_check.succeeded28
  %57 = bitcast i8* %55 to %Tstruct.Spl_nestedHeader*
  %name31 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %57, i32 0, i32 0
  %name32 = bitcast i32* %name31 to i8**
  %58 = load i8*, i8** %name32, align 8
  %59 = ptrtoint i8* %58 to i32
  %60 = call i8* @c_fetch_pointer_from_offset(i32 %59)
  %61 = call i1 @c_isTaintedPointerToTaintedMem(i8* %60)
  br i1 %61, label %_Dynamic_check.succeeded34, label %_Dynamic_check.failed33

_Dynamic_check.succeeded34:                       ; preds = %_Dynamic_check.succeeded30
  %call35 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.4, i64 0, i64 0), i8* %60)
  %62 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %63 = ptrtoint %Tstruct.Spl_Header* %62 to i32
  %64 = call i8* @c_fetch_pointer_from_offset(i32 %63)
  %65 = call i1 @c_isTaintedPointerToTaintedMem(i8* %64)
  br i1 %65, label %_Dynamic_check.succeeded37, label %_Dynamic_check.failed36

_Dynamic_check.succeeded37:                       ; preds = %_Dynamic_check.succeeded34
  %66 = bitcast i8* %64 to %Tstruct.Spl_Header*
  %complexdoublepointer38 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %66, i32 0, i32 10
  %complexdoublepointer39 = bitcast i32* %complexdoublepointer38 to %Tstruct.nestedHeader***
  %67 = load %Tstruct.Spl_nestedHeader**, %Tstruct.nestedHeader*** %complexdoublepointer39, align 4
  %68 = ptrtoint %Tstruct.Spl_nestedHeader** %67 to i32
  %69 = call i8* @c_fetch_pointer_from_offset(i32 %68)
  %70 = call i1 @c_isTaintedPointerToTaintedMem(i8* %69)
  br i1 %70, label %_Dynamic_check.succeeded41, label %_Dynamic_check.failed40

_Dynamic_check.succeeded41:                       ; preds = %_Dynamic_check.succeeded37
  %71 = bitcast i8* %69 to %Tstruct.Spl_nestedHeader**
  %72 = bitcast %Tstruct.Spl_nestedHeader** %71 to i32*
  %arrayidx42 = getelementptr inbounds i32, i32* %72, i64 1
  %73 = bitcast i32* %arrayidx42 to %Tstruct.Spl_nestedHeader**
  %74 = load %Tstruct.Spl_nestedHeader*, %Tstruct.Spl_nestedHeader** %73, align 8
  %75 = ptrtoint %Tstruct.Spl_nestedHeader* %74 to i32
  %76 = call i8* @c_fetch_pointer_from_offset(i32 %75)
  %77 = call i1 @c_isTaintedPointerToTaintedMem(i8* %76)
  br i1 %77, label %_Dynamic_check.succeeded44, label %_Dynamic_check.failed43

_Dynamic_check.succeeded44:                       ; preds = %_Dynamic_check.succeeded41
  %78 = bitcast i8* %76 to %Tstruct.Spl_nestedHeader*
  %name45 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %78, i32 0, i32 0
  %name46 = bitcast i32* %name45 to i8**
  %79 = load i8*, i8** %name46, align 8
  %80 = ptrtoint i8* %79 to i32
  %81 = call i8* @c_fetch_pointer_from_offset(i32 %80)
  %82 = call i1 @c_isTaintedPointerToTaintedMem(i8* %81)
  br i1 %82, label %_Dynamic_check.succeeded48, label %_Dynamic_check.failed47

_Dynamic_check.succeeded48:                       ; preds = %_Dynamic_check.succeeded44
  %call49 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.5, i64 0, i64 0), i8* %81)
  %83 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %84 = ptrtoint %Tstruct.Spl_Header* %83 to i32
  %85 = call i8* @c_fetch_pointer_from_offset(i32 %84)
  %86 = call i1 @c_isTaintedPointerToTaintedMem(i8* %85)
  br i1 %86, label %_Dynamic_check.succeeded51, label %_Dynamic_check.failed50

_Dynamic_check.succeeded51:                       ; preds = %_Dynamic_check.succeeded48
  %87 = bitcast i8* %85 to %Tstruct.Spl_Header*
  %nested52 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %87, i32 0, i32 3
  %nested53 = bitcast i32* %nested52 to %Tstruct.nestedHeader**
  %88 = load %Tstruct.Spl_nestedHeader*, %Tstruct.nestedHeader** %nested53, align 4
  %89 = ptrtoint %Tstruct.Spl_nestedHeader* %88 to i32
  %90 = call i8* @c_fetch_pointer_from_offset(i32 %89)
  %91 = call i1 @c_isTaintedPointerToTaintedMem(i8* %90)
  br i1 %91, label %_Dynamic_check.succeeded55, label %_Dynamic_check.failed54

_Dynamic_check.succeeded55:                       ; preds = %_Dynamic_check.succeeded51
  %92 = bitcast i8* %90 to %Tstruct.Spl_nestedHeader*
  %super_nested = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %92, i32 0, i32 1
  %super_nested56 = bitcast i32* %super_nested to %Tstruct.SuperNestedHeader**
  %93 = load %Tstruct.Spl_SuperNestedHeader*, %Tstruct.SuperNestedHeader** %super_nested56, align 4
  %94 = ptrtoint %Tstruct.Spl_SuperNestedHeader* %93 to i32
  %95 = call i8* @c_fetch_pointer_from_offset(i32 %94)
  %96 = call i1 @c_isTaintedPointerToTaintedMem(i8* %95)
  br i1 %96, label %_Dynamic_check.succeeded58, label %_Dynamic_check.failed57

_Dynamic_check.succeeded58:                       ; preds = %_Dynamic_check.succeeded55
  %97 = bitcast i8* %95 to %Tstruct.Spl_SuperNestedHeader*
  %brother_name = getelementptr inbounds %Tstruct.Spl_SuperNestedHeader, %Tstruct.Spl_SuperNestedHeader* %97, i32 0, i32 0
  %brother_name59 = bitcast i32* %brother_name to i8**
  %98 = load i8*, i8** %brother_name59, align 8
  %99 = ptrtoint i8* %98 to i32
  %100 = call i8* @c_fetch_pointer_from_offset(i32 %99)
  %101 = call i1 @c_isTaintedPointerToTaintedMem(i8* %100)
  br i1 %101, label %_Dynamic_check.succeeded61, label %_Dynamic_check.failed60

_Dynamic_check.succeeded61:                       ; preds = %_Dynamic_check.succeeded58
  %call62 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.6, i64 0, i64 0), i8* %100)
  %102 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %103 = ptrtoint %Tstruct.Spl_Header* %102 to i32
  %104 = call i8* @c_fetch_pointer_from_offset(i32 %103)
  %105 = call i1 @c_isTaintedPointerToTaintedMem(i8* %104)
  br i1 %105, label %_Dynamic_check.succeeded64, label %_Dynamic_check.failed63

_Dynamic_check.succeeded64:                       ; preds = %_Dynamic_check.succeeded61
  %106 = bitcast i8* %104 to %Tstruct.Spl_Header*
  %arun = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %106, i32 0, i32 4
  %107 = load i32, i32* %arun, align 8
  %call65 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.7, i64 0, i64 0), i32 %107)
  %108 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %109 = ptrtoint %Tstruct.Spl_Header* %108 to i32
  %110 = call i8* @c_fetch_pointer_from_offset(i32 %109)
  %111 = call i1 @c_isTaintedPointerToTaintedMem(i8* %110)
  br i1 %111, label %_Dynamic_check.succeeded67, label %_Dynamic_check.failed66

_Dynamic_check.succeeded67:                       ; preds = %_Dynamic_check.succeeded64
  %112 = bitcast i8* %110 to %Tstruct.Spl_Header*
  %c_p = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %112, i32 0, i32 5
  %113 = load i8, i8* %c_p, align 4
  %conv = sext i8 %113 to i32
  %call68 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8, i64 0, i64 0), i32 %conv)
  %114 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %115 = ptrtoint %Tstruct.Spl_Header* %114 to i32
  %116 = call i8* @c_fetch_pointer_from_offset(i32 %115)
  %117 = call i1 @c_isTaintedPointerToTaintedMem(i8* %116)
  br i1 %117, label %_Dynamic_check.succeeded70, label %_Dynamic_check.failed69

_Dynamic_check.succeeded70:                       ; preds = %_Dynamic_check.succeeded67
  %118 = bitcast i8* %116 to %Tstruct.Spl_Header*
  %twin = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %118, i32 0, i32 6
  %119 = load float, float* %twin, align 8
  %conv71 = fpext float %119 to double
  %call72 = call i32 (i8*, double, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, double, ...)*)(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.9, i64 0, i64 0), double %conv71)
  %120 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %121 = ptrtoint %Tstruct.Spl_Header* %120 to i32
  %122 = call i8* @c_fetch_pointer_from_offset(i32 %121)
  %123 = call i1 @c_isTaintedPointerToTaintedMem(i8* %122)
  br i1 %123, label %_Dynamic_check.succeeded74, label %_Dynamic_check.failed73

_Dynamic_check.succeeded74:                       ; preds = %_Dynamic_check.succeeded70
  %124 = bitcast i8* %122 to %Tstruct.Spl_Header*
  %ED = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %124, i32 0, i32 7
  %ED75 = bitcast %Tstruct.Spl_ExtremelyNestedHeader* %ED to %Tstruct.Spl_ExtremelyNestedHeader*
  %125 = ptrtoint %Tstruct.Spl_ExtremelyNestedHeader* %ED75 to i32
  %126 = call i8* @c_fetch_pointer_from_offset(i32 %125)
  %127 = call i1 @c_isTaintedPointerToTaintedMem(i8* %126)
  br i1 %127, label %_Dynamic_check.succeeded77, label %_Dynamic_check.failed76

_Dynamic_check.succeeded77:                       ; preds = %_Dynamic_check.succeeded74
  %128 = bitcast i8* %126 to %Tstruct.Spl_ExtremelyNestedHeader*
  %coke_float = getelementptr inbounds %Tstruct.Spl_ExtremelyNestedHeader, %Tstruct.Spl_ExtremelyNestedHeader* %128, i32 0, i32 0
  %129 = load float, float* %coke_float, align 4
  %conv78 = fpext float %129 to double
  %call79 = call i32 (i8*, double, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, double, ...)*)(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.10, i64 0, i64 0), double %conv78)
  %130 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %131 = ptrtoint %Tstruct.Spl_Header* %130 to i32
  %132 = call i8* @c_fetch_pointer_from_offset(i32 %131)
  %133 = call i1 @c_isTaintedPointerToTaintedMem(i8* %132)
  br i1 %133, label %_Dynamic_check.succeeded81, label %_Dynamic_check.failed80

_Dynamic_check.succeeded81:                       ; preds = %_Dynamic_check.succeeded77
  %134 = bitcast i8* %132 to %Tstruct.Spl_Header*
  %ED82 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %134, i32 0, i32 7
  %ED83 = bitcast %Tstruct.Spl_ExtremelyNestedHeader* %ED82 to %Tstruct.Spl_ExtremelyNestedHeader*
  %135 = ptrtoint %Tstruct.Spl_ExtremelyNestedHeader* %ED83 to i32
  %136 = call i8* @c_fetch_pointer_from_offset(i32 %135)
  %137 = call i1 @c_isTaintedPointerToTaintedMem(i8* %136)
  br i1 %137, label %_Dynamic_check.succeeded85, label %_Dynamic_check.failed84

_Dynamic_check.succeeded85:                       ; preds = %_Dynamic_check.succeeded81
  %138 = bitcast i8* %136 to %Tstruct.Spl_ExtremelyNestedHeader*
  %favoriteCar = getelementptr inbounds %Tstruct.Spl_ExtremelyNestedHeader, %Tstruct.Spl_ExtremelyNestedHeader* %138, i32 0, i32 1
  %favoriteCar86 = bitcast i32* %favoriteCar to i8**
  %139 = load i8*, i8** %favoriteCar86, align 4
  %140 = ptrtoint i8* %139 to i32
  %141 = call i8* @c_fetch_pointer_from_offset(i32 %140)
  %142 = call i1 @c_isTaintedPointerToTaintedMem(i8* %141)
  br i1 %142, label %_Dynamic_check.succeeded88, label %_Dynamic_check.failed87

_Dynamic_check.succeeded88:                       ; preds = %_Dynamic_check.succeeded85
  %call89 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.11, i64 0, i64 0), i8* %141)
  %143 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %144 = ptrtoint %Tstruct.Spl_Header* %143 to i32
  %145 = call i8* @c_fetch_pointer_from_offset(i32 %144)
  %146 = call i1 @c_isTaintedPointerToTaintedMem(i8* %145)
  br i1 %146, label %_Dynamic_check.succeeded91, label %_Dynamic_check.failed90

_Dynamic_check.succeeded91:                       ; preds = %_Dynamic_check.succeeded88
  %147 = bitcast i8* %145 to %Tstruct.Spl_Header*
  %simpledoublepointer = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %147, i32 0, i32 8
  %simpledoublepointer92 = bitcast i32* %simpledoublepointer to i8***
  %148 = load i8**, i8*** %simpledoublepointer92, align 4
  %149 = ptrtoint i8** %148 to i32
  %150 = call i8* @c_fetch_pointer_from_offset(i32 %149)
  %151 = call i1 @c_isTaintedPointerToTaintedMem(i8* %150)
  br i1 %151, label %_Dynamic_check.succeeded94, label %_Dynamic_check.failed93

_Dynamic_check.succeeded94:                       ; preds = %_Dynamic_check.succeeded91
  %152 = bitcast i8* %150 to i8**
  %153 = bitcast i8** %152 to i32*
  %arrayidx95 = getelementptr inbounds i32, i32* %153, i64 0
  %154 = bitcast i32* %arrayidx95 to i8**
  %155 = load i8*, i8** %154, align 8
  %156 = ptrtoint i8* %155 to i32
  %157 = call i8* @c_fetch_pointer_from_offset(i32 %156)
  %158 = call i1 @c_isTaintedPointerToTaintedMem(i8* %157)
  br i1 %158, label %_Dynamic_check.succeeded97, label %_Dynamic_check.failed96

_Dynamic_check.succeeded97:                       ; preds = %_Dynamic_check.succeeded94
  %call98 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.12, i64 0, i64 0), i8* %157)
  %159 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %160 = ptrtoint %Tstruct.Spl_Header* %159 to i32
  %161 = call i8* @c_fetch_pointer_from_offset(i32 %160)
  %162 = call i1 @c_isTaintedPointerToTaintedMem(i8* %161)
  br i1 %162, label %_Dynamic_check.succeeded100, label %_Dynamic_check.failed99

_Dynamic_check.succeeded100:                      ; preds = %_Dynamic_check.succeeded97
  %163 = bitcast i8* %161 to %Tstruct.Spl_Header*
  %simpledoublepointer101 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %163, i32 0, i32 8
  %simpledoublepointer102 = bitcast i32* %simpledoublepointer101 to i8***
  %164 = load i8**, i8*** %simpledoublepointer102, align 4
  %165 = ptrtoint i8** %164 to i32
  %166 = call i8* @c_fetch_pointer_from_offset(i32 %165)
  %167 = call i1 @c_isTaintedPointerToTaintedMem(i8* %166)
  br i1 %167, label %_Dynamic_check.succeeded104, label %_Dynamic_check.failed103

_Dynamic_check.succeeded104:                      ; preds = %_Dynamic_check.succeeded100
  %168 = bitcast i8* %166 to i8**
  %169 = bitcast i8** %168 to i32*
  %arrayidx105 = getelementptr inbounds i32, i32* %169, i64 1
  %170 = bitcast i32* %arrayidx105 to i8**
  %171 = load i8*, i8** %170, align 8
  %172 = ptrtoint i8* %171 to i32
  %173 = call i8* @c_fetch_pointer_from_offset(i32 %172)
  %174 = call i1 @c_isTaintedPointerToTaintedMem(i8* %173)
  br i1 %174, label %_Dynamic_check.succeeded107, label %_Dynamic_check.failed106

_Dynamic_check.succeeded107:                      ; preds = %_Dynamic_check.succeeded104
  %call108 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.13, i64 0, i64 0), i8* %173)
  %175 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %176 = ptrtoint %Tstruct.Spl_Header* %175 to i32
  %177 = call i8* @c_fetch_pointer_from_offset(i32 %176)
  %178 = call i1 @c_isTaintedPointerToTaintedMem(i8* %177)
  br i1 %178, label %_Dynamic_check.succeeded110, label %_Dynamic_check.failed109

_Dynamic_check.succeeded110:                      ; preds = %_Dynamic_check.succeeded107
  %179 = bitcast i8* %177 to %Tstruct.Spl_Header*
  %simpledoublepointer111 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %179, i32 0, i32 8
  %simpledoublepointer112 = bitcast i32* %simpledoublepointer111 to i8***
  %180 = load i8**, i8*** %simpledoublepointer112, align 4
  %181 = ptrtoint i8** %180 to i32
  %182 = call i8* @c_fetch_pointer_from_offset(i32 %181)
  %183 = call i1 @c_isTaintedPointerToTaintedMem(i8* %182)
  br i1 %183, label %_Dynamic_check.succeeded114, label %_Dynamic_check.failed113

_Dynamic_check.succeeded114:                      ; preds = %_Dynamic_check.succeeded110
  %184 = bitcast i8* %182 to i8**
  %185 = bitcast i8** %184 to i32*
  %arrayidx115 = getelementptr inbounds i32, i32* %185, i64 2
  %186 = bitcast i32* %arrayidx115 to i8**
  %187 = load i8*, i8** %186, align 8
  %188 = ptrtoint i8* %187 to i32
  %189 = call i8* @c_fetch_pointer_from_offset(i32 %188)
  %190 = call i1 @c_isTaintedPointerToTaintedMem(i8* %189)
  br i1 %190, label %_Dynamic_check.succeeded117, label %_Dynamic_check.failed116

_Dynamic_check.succeeded117:                      ; preds = %_Dynamic_check.succeeded114
  %call118 = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i8*, ...)*)(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.14, i64 0, i64 0), i8* %189)
  %191 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %192 = ptrtoint %Tstruct.Spl_Header* %191 to i32
  %193 = call i8* @c_fetch_pointer_from_offset(i32 %192)
  %194 = call i1 @c_isTaintedPointerToTaintedMem(i8* %193)
  br i1 %194, label %_Dynamic_check.succeeded120, label %_Dynamic_check.failed119

_Dynamic_check.succeeded120:                      ; preds = %_Dynamic_check.succeeded117
  %195 = bitcast i8* %193 to %Tstruct.Spl_Header*
  %nested121 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %195, i32 0, i32 3
  %nested122 = bitcast i32* %nested121 to %Tstruct.nestedHeader**
  %196 = load %Tstruct.Spl_nestedHeader*, %Tstruct.nestedHeader** %nested122, align 4
  %197 = ptrtoint %Tstruct.Spl_nestedHeader* %196 to i32
  %198 = call i8* @c_fetch_pointer_from_offset(i32 %197)
  %199 = call i1 @c_isTaintedPointerToTaintedMem(i8* %198)
  br i1 %199, label %_Dynamic_check.succeeded124, label %_Dynamic_check.failed123

_Dynamic_check.succeeded124:                      ; preds = %_Dynamic_check.succeeded120
  %200 = bitcast i8* %198 to %Tstruct.Spl_nestedHeader*
  %arun125 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %200, i32 0, i32 2
  %201 = load i32, i32* %arun125, align 8
  %call126 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.15, i64 0, i64 0), i32 %201)
  %202 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %203 = ptrtoint %Tstruct.Spl_Header* %202 to i32
  %204 = call i8* @c_fetch_pointer_from_offset(i32 %203)
  %205 = call i1 @c_isTaintedPointerToTaintedMem(i8* %204)
  br i1 %205, label %_Dynamic_check.succeeded128, label %_Dynamic_check.failed127

_Dynamic_check.succeeded128:                      ; preds = %_Dynamic_check.succeeded124
  %206 = bitcast i8* %204 to %Tstruct.Spl_Header*
  %nested129 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %206, i32 0, i32 3
  %nested130 = bitcast i32* %nested129 to %Tstruct.nestedHeader**
  %207 = load %Tstruct.Spl_nestedHeader*, %Tstruct.nestedHeader** %nested130, align 4
  %208 = ptrtoint %Tstruct.Spl_nestedHeader* %207 to i32
  %209 = call i8* @c_fetch_pointer_from_offset(i32 %208)
  %210 = call i1 @c_isTaintedPointerToTaintedMem(i8* %209)
  br i1 %210, label %_Dynamic_check.succeeded132, label %_Dynamic_check.failed131

_Dynamic_check.succeeded132:                      ; preds = %_Dynamic_check.succeeded128
  %211 = bitcast i8* %209 to %Tstruct.Spl_nestedHeader*
  %c_p133 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %211, i32 0, i32 3
  %212 = load i8, i8* %c_p133, align 4
  %conv134 = sext i8 %212 to i32
  %call135 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.16, i64 0, i64 0), i32 %conv134)
  %213 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %214 = ptrtoint %Tstruct.Spl_Header* %213 to i32
  %215 = call i8* @c_fetch_pointer_from_offset(i32 %214)
  %216 = call i1 @c_isTaintedPointerToTaintedMem(i8* %215)
  br i1 %216, label %_Dynamic_check.succeeded137, label %_Dynamic_check.failed136

_Dynamic_check.succeeded137:                      ; preds = %_Dynamic_check.succeeded132
  %217 = bitcast i8* %215 to %Tstruct.Spl_Header*
  %nested138 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %217, i32 0, i32 3
  %nested139 = bitcast i32* %nested138 to %Tstruct.nestedHeader**
  %218 = load %Tstruct.Spl_nestedHeader*, %Tstruct.nestedHeader** %nested139, align 4
  %219 = ptrtoint %Tstruct.Spl_nestedHeader* %218 to i32
  %220 = call i8* @c_fetch_pointer_from_offset(i32 %219)
  %221 = call i1 @c_isTaintedPointerToTaintedMem(i8* %220)
  br i1 %221, label %_Dynamic_check.succeeded141, label %_Dynamic_check.failed140

_Dynamic_check.succeeded141:                      ; preds = %_Dynamic_check.succeeded137
  %222 = bitcast i8* %220 to %Tstruct.Spl_nestedHeader*
  %twin142 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %222, i32 0, i32 4
  %223 = load float, float* %twin142, align 8
  %conv143 = fpext float %223 to double
  %call144 = call i32 (i8*, double, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, double, ...)*)(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.17, i64 0, i64 0), double %conv143)
  %224 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %225 = ptrtoint %Tstruct.Spl_Header* %224 to i32
  %226 = call i8* @c_fetch_pointer_from_offset(i32 %225)
  %227 = call i1 @c_isTaintedPointerToTaintedMem(i8* %226)
  br i1 %227, label %_Dynamic_check.succeeded146, label %_Dynamic_check.failed145

_Dynamic_check.succeeded146:                      ; preds = %_Dynamic_check.succeeded141
  %228 = bitcast i8* %226 to %Tstruct.Spl_Header*
  %nested147 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %228, i32 0, i32 3
  %nested148 = bitcast i32* %nested147 to %Tstruct.nestedHeader**
  %229 = load %Tstruct.Spl_nestedHeader*, %Tstruct.nestedHeader** %nested148, align 4
  %230 = ptrtoint %Tstruct.Spl_nestedHeader* %229 to i32
  %231 = call i8* @c_fetch_pointer_from_offset(i32 %230)
  %232 = call i1 @c_isTaintedPointerToTaintedMem(i8* %231)
  br i1 %232, label %_Dynamic_check.succeeded150, label %_Dynamic_check.failed149

_Dynamic_check.succeeded150:                      ; preds = %_Dynamic_check.succeeded146
  %233 = bitcast i8* %231 to %Tstruct.Spl_nestedHeader*
  %super_nested151 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %233, i32 0, i32 1
  %super_nested152 = bitcast i32* %super_nested151 to %Tstruct.SuperNestedHeader**
  %234 = load %Tstruct.Spl_SuperNestedHeader*, %Tstruct.SuperNestedHeader** %super_nested152, align 4
  %235 = ptrtoint %Tstruct.Spl_SuperNestedHeader* %234 to i32
  %236 = call i8* @c_fetch_pointer_from_offset(i32 %235)
  %237 = call i1 @c_isTaintedPointerToTaintedMem(i8* %236)
  br i1 %237, label %_Dynamic_check.succeeded154, label %_Dynamic_check.failed153

_Dynamic_check.succeeded154:                      ; preds = %_Dynamic_check.succeeded150
  %238 = bitcast i8* %236 to %Tstruct.Spl_SuperNestedHeader*
  %arun155 = getelementptr inbounds %Tstruct.Spl_SuperNestedHeader, %Tstruct.Spl_SuperNestedHeader* %238, i32 0, i32 1
  %239 = load i32, i32* %arun155, align 4
  %call156 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.18, i64 0, i64 0), i32 %239)
  %240 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %241 = ptrtoint %Tstruct.Spl_Header* %240 to i32
  %242 = call i8* @c_fetch_pointer_from_offset(i32 %241)
  %243 = call i1 @c_isTaintedPointerToTaintedMem(i8* %242)
  br i1 %243, label %_Dynamic_check.succeeded158, label %_Dynamic_check.failed157

_Dynamic_check.succeeded158:                      ; preds = %_Dynamic_check.succeeded154
  %244 = bitcast i8* %242 to %Tstruct.Spl_Header*
  %nested159 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %244, i32 0, i32 3
  %nested160 = bitcast i32* %nested159 to %Tstruct.nestedHeader**
  %245 = load %Tstruct.Spl_nestedHeader*, %Tstruct.nestedHeader** %nested160, align 4
  %246 = ptrtoint %Tstruct.Spl_nestedHeader* %245 to i32
  %247 = call i8* @c_fetch_pointer_from_offset(i32 %246)
  %248 = call i1 @c_isTaintedPointerToTaintedMem(i8* %247)
  br i1 %248, label %_Dynamic_check.succeeded162, label %_Dynamic_check.failed161

_Dynamic_check.succeeded162:                      ; preds = %_Dynamic_check.succeeded158
  %249 = bitcast i8* %247 to %Tstruct.Spl_nestedHeader*
  %super_nested163 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %249, i32 0, i32 1
  %super_nested164 = bitcast i32* %super_nested163 to %Tstruct.SuperNestedHeader**
  %250 = load %Tstruct.Spl_SuperNestedHeader*, %Tstruct.SuperNestedHeader** %super_nested164, align 4
  %251 = ptrtoint %Tstruct.Spl_SuperNestedHeader* %250 to i32
  %252 = call i8* @c_fetch_pointer_from_offset(i32 %251)
  %253 = call i1 @c_isTaintedPointerToTaintedMem(i8* %252)
  br i1 %253, label %_Dynamic_check.succeeded166, label %_Dynamic_check.failed165

_Dynamic_check.succeeded166:                      ; preds = %_Dynamic_check.succeeded162
  %254 = bitcast i8* %252 to %Tstruct.Spl_SuperNestedHeader*
  %c_p167 = getelementptr inbounds %Tstruct.Spl_SuperNestedHeader, %Tstruct.Spl_SuperNestedHeader* %254, i32 0, i32 2
  %255 = load i8, i8* %c_p167, align 8
  %conv168 = sext i8 %255 to i32
  %call169 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, i32, ...)*)(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.19, i64 0, i64 0), i32 %conv168)
  %256 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %257 = ptrtoint %Tstruct.Spl_Header* %256 to i32
  %258 = call i8* @c_fetch_pointer_from_offset(i32 %257)
  %259 = call i1 @c_isTaintedPointerToTaintedMem(i8* %258)
  br i1 %259, label %_Dynamic_check.succeeded171, label %_Dynamic_check.failed170

_Dynamic_check.succeeded171:                      ; preds = %_Dynamic_check.succeeded166
  %260 = bitcast i8* %258 to %Tstruct.Spl_Header*
  %nested172 = getelementptr inbounds %Tstruct.Spl_Header, %Tstruct.Spl_Header* %260, i32 0, i32 3
  %nested173 = bitcast i32* %nested172 to %Tstruct.nestedHeader**
  %261 = load %Tstruct.Spl_nestedHeader*, %Tstruct.nestedHeader** %nested173, align 4
  %262 = ptrtoint %Tstruct.Spl_nestedHeader* %261 to i32
  %263 = call i8* @c_fetch_pointer_from_offset(i32 %262)
  %264 = call i1 @c_isTaintedPointerToTaintedMem(i8* %263)
  br i1 %264, label %_Dynamic_check.succeeded175, label %_Dynamic_check.failed174

_Dynamic_check.succeeded175:                      ; preds = %_Dynamic_check.succeeded171
  %265 = bitcast i8* %263 to %Tstruct.Spl_nestedHeader*
  %super_nested176 = getelementptr inbounds %Tstruct.Spl_nestedHeader, %Tstruct.Spl_nestedHeader* %265, i32 0, i32 1
  %super_nested177 = bitcast i32* %super_nested176 to %Tstruct.SuperNestedHeader**
  %266 = load %Tstruct.Spl_SuperNestedHeader*, %Tstruct.SuperNestedHeader** %super_nested177, align 4
  %267 = ptrtoint %Tstruct.Spl_SuperNestedHeader* %266 to i32
  %268 = call i8* @c_fetch_pointer_from_offset(i32 %267)
  %269 = call i1 @c_isTaintedPointerToTaintedMem(i8* %268)
  br i1 %269, label %_Dynamic_check.succeeded179, label %_Dynamic_check.failed178

_Dynamic_check.succeeded179:                      ; preds = %_Dynamic_check.succeeded175
  %270 = bitcast i8* %268 to %Tstruct.Spl_SuperNestedHeader*
  %twin180 = getelementptr inbounds %Tstruct.Spl_SuperNestedHeader, %Tstruct.Spl_SuperNestedHeader* %270, i32 0, i32 3
  %271 = load float, float* %twin180, align 4
  %conv181 = fpext float %271 to double
  %call182 = call i32 (i8*, double, ...) bitcast (i32 (...)* @t_printf to i32 (i8*, double, ...)*)(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.20, i64 0, i64 0), double %conv181)
  %272 = load %Tstruct.Spl_Header*, %Tstruct.Spl_Header** %c_2, align 8
  %273 = ptrtoint %Tstruct.Spl_Header* %272 to i32
  %274 = call i8* @c_fetch_pointer_from_offset(i32 %273)
  %275 = call i1 @c_isTaintedPointerToTaintedMem(i8* %274)
  br i1 %275, label %_Dynamic_check.succeeded184, label %_Dynamic_check.failed183

_Dynamic_check.succeeded184:                      ; preds = %_Dynamic_check.succeeded179
  %276 = bitcast i8* %274 to %Tstruct.Spl_Header*
  %call185 = call %Tstruct.Spl_Header* @experiment_2(%Tstruct.Spl_Header* %276)
  %277 = bitcast %Tstruct.Spl_Header* %call185 to %Tstruct.Spl_Header*
  store %Tstruct.Spl_Header* %277, %Tstruct.Spl_Header** %c_2, align 8
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

_Dynamic_check.failed18:                          ; preds = %_Dynamic_check.succeeded15
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed21:                          ; preds = %_Dynamic_check.succeeded19
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed24:                          ; preds = %_Dynamic_check.succeeded22
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed27:                          ; preds = %_Dynamic_check.succeeded25
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed29:                          ; preds = %_Dynamic_check.succeeded28
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed33:                          ; preds = %_Dynamic_check.succeeded30
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed36:                          ; preds = %_Dynamic_check.succeeded34
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed40:                          ; preds = %_Dynamic_check.succeeded37
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed43:                          ; preds = %_Dynamic_check.succeeded41
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed47:                          ; preds = %_Dynamic_check.succeeded44
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed50:                          ; preds = %_Dynamic_check.succeeded48
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed54:                          ; preds = %_Dynamic_check.succeeded51
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed57:                          ; preds = %_Dynamic_check.succeeded55
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

_Dynamic_check.failed73:                          ; preds = %_Dynamic_check.succeeded70
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed76:                          ; preds = %_Dynamic_check.succeeded74
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed80:                          ; preds = %_Dynamic_check.succeeded77
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed84:                          ; preds = %_Dynamic_check.succeeded81
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed87:                          ; preds = %_Dynamic_check.succeeded85
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

_Dynamic_check.failed103:                         ; preds = %_Dynamic_check.succeeded100
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed106:                         ; preds = %_Dynamic_check.succeeded104
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed109:                         ; preds = %_Dynamic_check.succeeded107
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed113:                         ; preds = %_Dynamic_check.succeeded110
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed116:                         ; preds = %_Dynamic_check.succeeded114
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed119:                         ; preds = %_Dynamic_check.succeeded117
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed123:                         ; preds = %_Dynamic_check.succeeded120
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed127:                         ; preds = %_Dynamic_check.succeeded124
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed131:                         ; preds = %_Dynamic_check.succeeded128
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed136:                         ; preds = %_Dynamic_check.succeeded132
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed140:                         ; preds = %_Dynamic_check.succeeded137
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed145:                         ; preds = %_Dynamic_check.succeeded141
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed149:                         ; preds = %_Dynamic_check.succeeded146
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed153:                         ; preds = %_Dynamic_check.succeeded150
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed157:                         ; preds = %_Dynamic_check.succeeded154
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed161:                         ; preds = %_Dynamic_check.succeeded158
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed165:                         ; preds = %_Dynamic_check.succeeded162
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed170:                         ; preds = %_Dynamic_check.succeeded166
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed174:                         ; preds = %_Dynamic_check.succeeded171
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed178:                         ; preds = %_Dynamic_check.succeeded175
  call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed183:                         ; preds = %_Dynamic_check.succeeded179
  call void @llvm.trap() #4
  unreachable
}

declare dso_local i32 @t_printf(...) #2

declare i8* @c_fetch_pointer_from_offset(i32)

declare i1 @c_isTaintedPointerToTaintedMem(i8*)

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
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 2cbc39ca53ed7766dca9b73b295d330ce8ff9983)"}
