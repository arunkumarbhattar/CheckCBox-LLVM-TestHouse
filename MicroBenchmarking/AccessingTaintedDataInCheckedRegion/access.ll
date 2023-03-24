; ModuleID = '../FlexCExample/access.c'
source_filename = "../FlexCExample/access.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [16 x i8] c"Callback Called\00", align 1
@str.3 = private unnamed_addr constant [24 x i8] c"Checked Function called\00", align 1
@str.4 = private unnamed_addr constant [24 x i8] c"Tainted Function called\00", align 1

; Function Attrs: nounwind tainted uwtable
define dso_local i32* @SimpleTaintedFunction(i32* %a, i32* %b, i32* (i32*, i32*)* nocapture %func_1, i32* (i32*, i32*)* nocapture %func_2, i32* (i32*, i32*)* nocapture %func_3) local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* %a, align 4, !tbaa !2
  %1 = load i32, i32* %b, align 4, !tbaa !2
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32* %func_1(i32* nonnull %a, i32* nonnull %b) #6
  br label %return

if.else:                                          ; preds = %entry
  %cmp1 = icmp sgt i32 %0, %1
  br i1 %cmp1, label %if.then2, label %if.else4

if.then2:                                         ; preds = %if.else
  %call3 = call i32* %func_2(i32* nonnull %a, i32* nonnull %b) #6
  br label %return

if.else4:                                         ; preds = %if.else
  %call5 = call i32* %func_3(i32* nonnull %a, i32* nonnull %b) #6
  br label %return

return:                                           ; preds = %if.else4, %if.then2, %if.then
  %retval.0 = phi i32* [ %call, %if.then ], [ %call3, %if.then2 ], [ %call5, %if.else4 ]
  ret i32* %retval.0
}

; Function Attrs: nofree noreturn nounwind tainted uwtable
define dso_local noalias nonnull i32* @callbackFunction(i32* nocapture readnone %a, i32* nocapture readnone %b) local_unnamed_addr #1 {
entry:
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str, i64 0, i64 0))
  unreachable
}

; Function Attrs: nofree noreturn nounwind uwtable
define dso_local noalias nonnull i32* @checkedFunction(i32* nocapture readnone %a, i32* nocapture readnone %b) local_unnamed_addr #2 {
entry:
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @str.3, i64 0, i64 0))
  unreachable
}

; Function Attrs: nofree noreturn nounwind tainted uwtable
define dso_local noalias nonnull i32* @taintedFunction(i32* nocapture readnone %a, i32* nocapture readnone %b) local_unnamed_addr #1 {
entry:
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @str.4, i64 0, i64 0))
  unreachable
}

; Function Attrs: noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
entry:
  %call = call i8* @hoard_malloc(i64 4) #6
  unreachable
}

; Function Attrs: noreturn
declare dso_local i8* @hoard_malloc(i64) local_unnamed_addr #4

; Function Attrs: nofree noreturn nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { nounwind tainted uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree noreturn nounwind tainted uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree noreturn nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree noreturn nounwind }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git a628ec9e8a7b5f1f72e33c1037c30403f5b5e778)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
