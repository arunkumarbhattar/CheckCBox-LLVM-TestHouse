; ModuleID = 'Tainted.c'
source_filename = "Tainted.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Time Taken is %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local double @MemoryAccessInLoop() #0 {
entry:
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  %cpu_time_used = alloca double, align 8
  %count = alloca double, align 8
  %pcount = alloca double*, align 4
  %i = alloca i32, align 4
  %call = call i32 @clock() #3
  store i32 %call, i32* %start, align 4
  store double 1.000000e+00, double* %count, align 8
  %call1 = call noalias i8* @malloc(i32 8) #3
  %0 = bitcast i8* %call1 to double*
  store double* %0, double** %pcount, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 100000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load double*, double** %pcount, align 4
  %3 = load double, double* %2, align 4
  %4 = load double, double* %count, align 8
  %add = fadd double %4, %3
  store double %add, double* %count, align 8
  %5 = load double, double* %count, align 8
  %6 = load double*, double** %pcount, align 4
  store double %5, double* %6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !3

for.end:                                          ; preds = %for.cond
  %call2 = call i32 @clock() #3
  store i32 %call2, i32* %end, align 4
  %8 = load i32, i32* %end, align 4
  %9 = load i32, i32* %start, align 4
  %sub = sub nsw i32 %8, %9
  %conv = sitofp i32 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  store double %div, double* %cpu_time_used, align 8
  %10 = load double, double* %cpu_time_used, align 8
  ret double %10
}

; Function Attrs: nounwind
declare dso_local i32 @clock() #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i32) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @simple() #0 {
entry:
  %ptr = alloca i32*, align 4
  %call = call noalias i8* @malloc(i32 1) #3
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %ptr, align 4
  %call1 = call noalias i8* @calloc(i32 2, i32 4) #3
  %1 = bitcast i8* %call1 to i32*
  store i32* %1, i32** %ptr, align 4
  %2 = load i32*, i32** %ptr, align 4
  %3 = bitcast i32* %2 to i8*
  %4 = ptrtoint i8* %3 to i32
  %5 = inttoptr i32 %4 to i8*
  %call2 = call i8* @realloc(i8* %5, i32 4) #3
  %6 = bitcast i8* %call2 to i32*
  store i32* %6, i32** %ptr, align 4
  %7 = load i32*, i32** %ptr, align 4
  %8 = bitcast i32* %7 to i8*
  %9 = ptrtoint i8* %8 to i32
  %10 = inttoptr i32 %9 to i8*
  call void @free(i8* %10) #3
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i32, i32) #1

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i32) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call double @MemoryAccessInLoop()
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), double %call)
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 5510ff2d42a45edd0a559c48d6f976c1244b86c3)"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
