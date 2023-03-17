; ModuleID = 'access.c'
source_filename = "access.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@lowerbound = common local_unnamed_addr global i64 0
@upperbound = common local_unnamed_addr global i64 0
@.str = private unnamed_addr constant [60 x i8] c"******************Iteration: %d **************************\0A\00", align 1

; Function Attrs: noreturn nounwind uwtable
define dso_local double @ReadingAndWritingToCheckedPtr100ktimes() local_unnamed_addr #0 {
entry:
  %call = call i64 @clock() #4
  unreachable
}

; Function Attrs: noreturn nounwind
declare dso_local i64 @clock() local_unnamed_addr #1

; Function Attrs: noreturn nounwind uwtable
define dso_local double @ReadingAndWritingToTaintedPtr100ktimes() local_unnamed_addr #0 {
entry:
  %call = call i64 @clock() #4
  unreachable
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([60 x i8], [60 x i8]* @.str, i64 0, i64 0), i32 1)
  unreachable
}

; Function Attrs: nofree noreturn nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #3

attributes #0 = { noreturn nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 4ea57c285347dae6b04613ab926b8cf0668c04e5)"}
