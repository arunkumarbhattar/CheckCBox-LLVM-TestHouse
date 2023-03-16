; ModuleID = 'simpleTainted.c'
source_filename = "simpleTainted.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@sbxHeap = common global i64 0
@sbxHeapBound = common global i64 0
@.str = private unnamed_addr constant [12 x i8] c"Hello World\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Hello Supercharger\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Hello Turbocharger\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"First is %s \0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Second is %s \0A\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"Third is %s \0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @somefucntion(i8** %basic) #0 {
entry:
  %basic.addr = alloca i8**, align 4
  %0 = ptrtoint i8** %basic to i32
  %1 = zext i32 %0 to i64
  %2 = bitcast i8*** %basic.addr to i64*
  store i64 %1, i64* %2, align 4
  %call = call i8* (...) @c_fetch_sandbox_address()
  %3 = load i8**, i8*** %basic.addr, align 4
  %4 = ptrtoint i8** %3 to i32
  call void @w2c_dblptr(i8* %call, i32 %4)
  ret void
}

declare dso_local void @w2c_dblptr(i8*, i32) #1

declare dso_local i8* @c_fetch_sandbox_address(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %basic = alloca i8**, align 4
  %tmp = alloca i8*, align 4
  %mainBih = alloca i8*, align 8
  %tmp2 = alloca i8*, align 4
  %tmp9 = alloca i8*, align 4
  %tmp11 = alloca i8*, align 4
  %tmp21 = alloca i8*, align 4
  %tmp23 = alloca i8*, align 4
  %tmp33 = alloca i8*, align 4
  call void @sbx_init()
  %0 = call i64 @c_fetch_sandbox_heap_address()
  store i64 %0, i64* @sbxHeap, align 8
  %1 = call i64 @c_fetch_sandbox_heap_bound()
  store i64 %1, i64* @sbxHeapBound, align 8
  store i32 0, i32* %retval, align 4
  %call = call i8* @t_malloc(i64 24)
  %2 = ptrtoint i8* %call to i32
  %3 = inttoptr i32 %2 to i8*
  store i8* %3, i8** %tmp, align 4
  %4 = load i8*, i8** %tmp, align 4
  %5 = call i64 @c_fetch_sandbox_heap_bound()
  store i64 %5, i64* @sbxHeapBound, align 8
  %6 = bitcast i8* %4 to i8**
  %7 = ptrtoint i8** %6 to i32
  %8 = zext i32 %7 to i64
  %9 = bitcast i8*** %basic to i64*
  store i64 %8, i64* %9, align 4
  store i8* null, i8** %mainBih, align 8
  %call1 = call i8* @t_malloc(i64 100)
  %10 = ptrtoint i8* %call1 to i32
  %11 = inttoptr i32 %10 to i8*
  store i8* %11, i8** %tmp2, align 4
  %12 = load i8*, i8** %tmp2, align 4
  %13 = call i64 @c_fetch_sandbox_heap_bound()
  store i64 %13, i64* @sbxHeapBound, align 8
  %14 = load i8**, i8*** %basic, align 4
  %15 = ptrtoint i8** %14 to i32
  %16 = zext i32 %15 to i64
  %17 = load i64, i64* @sbxHeap, align 8
  %18 = add i64 %17, %16
  %19 = inttoptr i64 %18 to i8*
  %20 = load i64, i64* @sbxHeapBound, align 8
  %21 = load i64, i64* @sbxHeap, align 8
  %22 = sub i64 %20, %21
  %23 = icmp ult i64 %16, %22
  br i1 %23, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed

_Dynamic_check.succeeded:                         ; preds = %entry
  %24 = bitcast i8* %19 to i8**
  %arrayidx = getelementptr inbounds i8*, i8** %24, i64 0
  %25 = ptrtoint i8* %12 to i32
  %26 = zext i32 %25 to i64
  %27 = bitcast i8** %arrayidx to i64*
  store i64 %26, i64* %27, align 4
  %28 = load i8**, i8*** %basic, align 4
  %29 = ptrtoint i8** %28 to i32
  %30 = zext i32 %29 to i64
  %31 = load i64, i64* @sbxHeap, align 8
  %32 = add i64 %31, %30
  %33 = inttoptr i64 %32 to i8*
  %34 = load i64, i64* @sbxHeapBound, align 8
  %35 = load i64, i64* @sbxHeap, align 8
  %36 = sub i64 %34, %35
  %37 = icmp ult i64 %30, %36
  br i1 %37, label %_Dynamic_check.succeeded4, label %_Dynamic_check.failed3

_Dynamic_check.succeeded4:                        ; preds = %_Dynamic_check.succeeded
  %38 = bitcast i8* %33 to i8**
  %arrayidx5 = getelementptr inbounds i8*, i8** %38, i64 0
  %39 = load i8*, i8** %arrayidx5, align 4
  %40 = ptrtoint i8* %39 to i32
  %41 = inttoptr i32 %40 to i8*
  %42 = ptrtoint i8* %41 to i32
  %43 = zext i32 %42 to i64
  %44 = load i64, i64* @sbxHeap, align 8
  %45 = add i64 %44, %43
  %46 = inttoptr i64 %45 to i8*
  %47 = load i64, i64* @sbxHeapBound, align 8
  %48 = load i64, i64* @sbxHeap, align 8
  %49 = sub i64 %47, %48
  %50 = icmp ult i64 %43, %49
  br i1 %50, label %_Dynamic_check.succeeded7, label %_Dynamic_check.failed6

_Dynamic_check.succeeded7:                        ; preds = %_Dynamic_check.succeeded4
  %call8 = call i8* @t_strcpy(i8* %46, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0))
  %51 = ptrtoint i8* %call8 to i32
  %52 = inttoptr i32 %51 to i8*
  store i8* %52, i8** %tmp9, align 4
  %53 = load i8*, i8** %tmp9, align 4
  %call10 = call i8* @t_malloc(i64 100)
  %54 = ptrtoint i8* %call10 to i32
  %55 = inttoptr i32 %54 to i8*
  store i8* %55, i8** %tmp11, align 4
  %56 = load i8*, i8** %tmp11, align 4
  %57 = call i64 @c_fetch_sandbox_heap_bound()
  store i64 %57, i64* @sbxHeapBound, align 8
  %58 = load i8**, i8*** %basic, align 4
  %59 = ptrtoint i8** %58 to i32
  %60 = zext i32 %59 to i64
  %61 = load i64, i64* @sbxHeap, align 8
  %62 = add i64 %61, %60
  %63 = inttoptr i64 %62 to i8*
  %64 = load i64, i64* @sbxHeapBound, align 8
  %65 = load i64, i64* @sbxHeap, align 8
  %66 = sub i64 %64, %65
  %67 = icmp ult i64 %60, %66
  br i1 %67, label %_Dynamic_check.succeeded13, label %_Dynamic_check.failed12

_Dynamic_check.succeeded13:                       ; preds = %_Dynamic_check.succeeded7
  %68 = bitcast i8* %63 to i8**
  %arrayidx14 = getelementptr inbounds i8*, i8** %68, i64 1
  %69 = ptrtoint i8* %56 to i32
  %70 = zext i32 %69 to i64
  %71 = bitcast i8** %arrayidx14 to i64*
  store i64 %70, i64* %71, align 4
  %72 = load i8**, i8*** %basic, align 4
  %73 = ptrtoint i8** %72 to i32
  %74 = zext i32 %73 to i64
  %75 = load i64, i64* @sbxHeap, align 8
  %76 = add i64 %75, %74
  %77 = inttoptr i64 %76 to i8*
  %78 = load i64, i64* @sbxHeapBound, align 8
  %79 = load i64, i64* @sbxHeap, align 8
  %80 = sub i64 %78, %79
  %81 = icmp ult i64 %74, %80
  br i1 %81, label %_Dynamic_check.succeeded16, label %_Dynamic_check.failed15

_Dynamic_check.succeeded16:                       ; preds = %_Dynamic_check.succeeded13
  %82 = bitcast i8* %77 to i8**
  %arrayidx17 = getelementptr inbounds i8*, i8** %82, i64 1
  %83 = load i8*, i8** %arrayidx17, align 4
  %84 = ptrtoint i8* %83 to i32
  %85 = inttoptr i32 %84 to i8*
  %86 = ptrtoint i8* %85 to i32
  %87 = zext i32 %86 to i64
  %88 = load i64, i64* @sbxHeap, align 8
  %89 = add i64 %88, %87
  %90 = inttoptr i64 %89 to i8*
  %91 = load i64, i64* @sbxHeapBound, align 8
  %92 = load i64, i64* @sbxHeap, align 8
  %93 = sub i64 %91, %92
  %94 = icmp ult i64 %87, %93
  br i1 %94, label %_Dynamic_check.succeeded19, label %_Dynamic_check.failed18

_Dynamic_check.succeeded19:                       ; preds = %_Dynamic_check.succeeded16
  %call20 = call i8* @t_strcpy(i8* %90, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0))
  %95 = ptrtoint i8* %call20 to i32
  %96 = inttoptr i32 %95 to i8*
  store i8* %96, i8** %tmp21, align 4
  %97 = load i8*, i8** %tmp21, align 4
  %call22 = call i8* @t_malloc(i64 100)
  %98 = ptrtoint i8* %call22 to i32
  %99 = inttoptr i32 %98 to i8*
  store i8* %99, i8** %tmp23, align 4
  %100 = load i8*, i8** %tmp23, align 4
  %101 = call i64 @c_fetch_sandbox_heap_bound()
  store i64 %101, i64* @sbxHeapBound, align 8
  %102 = load i8**, i8*** %basic, align 4
  %103 = ptrtoint i8** %102 to i32
  %104 = zext i32 %103 to i64
  %105 = load i64, i64* @sbxHeap, align 8
  %106 = add i64 %105, %104
  %107 = inttoptr i64 %106 to i8*
  %108 = load i64, i64* @sbxHeapBound, align 8
  %109 = load i64, i64* @sbxHeap, align 8
  %110 = sub i64 %108, %109
  %111 = icmp ult i64 %104, %110
  br i1 %111, label %_Dynamic_check.succeeded25, label %_Dynamic_check.failed24

_Dynamic_check.succeeded25:                       ; preds = %_Dynamic_check.succeeded19
  %112 = bitcast i8* %107 to i8**
  %arrayidx26 = getelementptr inbounds i8*, i8** %112, i64 2
  %113 = ptrtoint i8* %100 to i32
  %114 = zext i32 %113 to i64
  %115 = bitcast i8** %arrayidx26 to i64*
  store i64 %114, i64* %115, align 4
  %116 = load i8**, i8*** %basic, align 4
  %117 = ptrtoint i8** %116 to i32
  %118 = zext i32 %117 to i64
  %119 = load i64, i64* @sbxHeap, align 8
  %120 = add i64 %119, %118
  %121 = inttoptr i64 %120 to i8*
  %122 = load i64, i64* @sbxHeapBound, align 8
  %123 = load i64, i64* @sbxHeap, align 8
  %124 = sub i64 %122, %123
  %125 = icmp ult i64 %118, %124
  br i1 %125, label %_Dynamic_check.succeeded28, label %_Dynamic_check.failed27

_Dynamic_check.succeeded28:                       ; preds = %_Dynamic_check.succeeded25
  %126 = bitcast i8* %121 to i8**
  %arrayidx29 = getelementptr inbounds i8*, i8** %126, i64 2
  %127 = load i8*, i8** %arrayidx29, align 4
  %128 = ptrtoint i8* %127 to i32
  %129 = inttoptr i32 %128 to i8*
  %130 = ptrtoint i8* %129 to i32
  %131 = zext i32 %130 to i64
  %132 = load i64, i64* @sbxHeap, align 8
  %133 = add i64 %132, %131
  %134 = inttoptr i64 %133 to i8*
  %135 = load i64, i64* @sbxHeapBound, align 8
  %136 = load i64, i64* @sbxHeap, align 8
  %137 = sub i64 %135, %136
  %138 = icmp ult i64 %131, %137
  br i1 %138, label %_Dynamic_check.succeeded31, label %_Dynamic_check.failed30

_Dynamic_check.succeeded31:                       ; preds = %_Dynamic_check.succeeded28
  %call32 = call i8* @t_strcpy(i8* %134, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0))
  %139 = ptrtoint i8* %call32 to i32
  %140 = inttoptr i32 %139 to i8*
  store i8* %140, i8** %tmp33, align 4
  %141 = load i8*, i8** %tmp33, align 4
  %142 = load i8**, i8*** %basic, align 4
  %143 = ptrtoint i8** %142 to i32
  %144 = zext i32 %143 to i64
  %145 = load i64, i64* @sbxHeap, align 8
  %146 = add i64 %145, %144
  %147 = inttoptr i64 %146 to i8*
  %148 = load i64, i64* @sbxHeapBound, align 8
  %149 = load i64, i64* @sbxHeap, align 8
  %150 = sub i64 %148, %149
  %151 = icmp ult i64 %144, %150
  br i1 %151, label %_Dynamic_check.succeeded35, label %_Dynamic_check.failed34

_Dynamic_check.succeeded35:                       ; preds = %_Dynamic_check.succeeded31
  %152 = bitcast i8* %147 to i8**
  %arrayidx36 = getelementptr inbounds i8*, i8** %152, i64 0
  %153 = load i8*, i8** %arrayidx36, align 4
  %154 = ptrtoint i8* %153 to i32
  %155 = inttoptr i32 %154 to i8*
  %156 = ptrtoint i8* %155 to i32
  %157 = zext i32 %156 to i64
  %158 = load i64, i64* @sbxHeap, align 8
  %159 = add i64 %158, %157
  %160 = inttoptr i64 %159 to i8*
  %161 = load i64, i64* @sbxHeapBound, align 8
  %162 = load i64, i64* @sbxHeap, align 8
  %163 = sub i64 %161, %162
  %164 = icmp ult i64 %157, %163
  br i1 %164, label %_Dynamic_check.succeeded38, label %_Dynamic_check.failed37

_Dynamic_check.succeeded38:                       ; preds = %_Dynamic_check.succeeded35
  %call39 = call i32 (i8*, ...) @t_printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* %160)
  %165 = load i8**, i8*** %basic, align 4
  %166 = ptrtoint i8** %165 to i32
  %167 = zext i32 %166 to i64
  %168 = load i64, i64* @sbxHeap, align 8
  %169 = add i64 %168, %167
  %170 = inttoptr i64 %169 to i8*
  %171 = load i64, i64* @sbxHeapBound, align 8
  %172 = load i64, i64* @sbxHeap, align 8
  %173 = sub i64 %171, %172
  %174 = icmp ult i64 %167, %173
  br i1 %174, label %_Dynamic_check.succeeded41, label %_Dynamic_check.failed40

_Dynamic_check.succeeded41:                       ; preds = %_Dynamic_check.succeeded38
  %175 = bitcast i8* %170 to i8**
  %arrayidx42 = getelementptr inbounds i8*, i8** %175, i64 1
  %176 = load i8*, i8** %arrayidx42, align 4
  %177 = ptrtoint i8* %176 to i32
  %178 = inttoptr i32 %177 to i8*
  %179 = ptrtoint i8* %178 to i32
  %180 = zext i32 %179 to i64
  %181 = load i64, i64* @sbxHeap, align 8
  %182 = add i64 %181, %180
  %183 = inttoptr i64 %182 to i8*
  %184 = load i64, i64* @sbxHeapBound, align 8
  %185 = load i64, i64* @sbxHeap, align 8
  %186 = sub i64 %184, %185
  %187 = icmp ult i64 %180, %186
  br i1 %187, label %_Dynamic_check.succeeded44, label %_Dynamic_check.failed43

_Dynamic_check.succeeded44:                       ; preds = %_Dynamic_check.succeeded41
  %call45 = call i32 (i8*, ...) @t_printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* %183)
  %188 = load i8**, i8*** %basic, align 4
  %189 = ptrtoint i8** %188 to i32
  %190 = zext i32 %189 to i64
  %191 = load i64, i64* @sbxHeap, align 8
  %192 = add i64 %191, %190
  %193 = inttoptr i64 %192 to i8*
  %194 = load i64, i64* @sbxHeapBound, align 8
  %195 = load i64, i64* @sbxHeap, align 8
  %196 = sub i64 %194, %195
  %197 = icmp ult i64 %190, %196
  br i1 %197, label %_Dynamic_check.succeeded47, label %_Dynamic_check.failed46

_Dynamic_check.succeeded47:                       ; preds = %_Dynamic_check.succeeded44
  %198 = bitcast i8* %193 to i8**
  %arrayidx48 = getelementptr inbounds i8*, i8** %198, i64 2
  %199 = load i8*, i8** %arrayidx48, align 4
  %200 = ptrtoint i8* %199 to i32
  %201 = inttoptr i32 %200 to i8*
  %202 = ptrtoint i8* %201 to i32
  %203 = zext i32 %202 to i64
  %204 = load i64, i64* @sbxHeap, align 8
  %205 = add i64 %204, %203
  %206 = inttoptr i64 %205 to i8*
  %207 = load i64, i64* @sbxHeapBound, align 8
  %208 = load i64, i64* @sbxHeap, align 8
  %209 = sub i64 %207, %208
  %210 = icmp ult i64 %203, %209
  br i1 %210, label %_Dynamic_check.succeeded50, label %_Dynamic_check.failed49

_Dynamic_check.succeeded50:                       ; preds = %_Dynamic_check.succeeded47
  %call51 = call i32 (i8*, ...) @t_printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i64 0, i64 0), i8* %206)
  %211 = load i8**, i8*** %basic, align 4
  %212 = ptrtoint i8** %211 to i32
  %213 = inttoptr i32 %212 to i8**
  call void @somefucntion(i8** %213)
  ret i32 0

_Dynamic_check.failed:                            ; preds = %entry
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed3:                           ; preds = %_Dynamic_check.succeeded
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed6:                           ; preds = %_Dynamic_check.succeeded4
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed12:                          ; preds = %_Dynamic_check.succeeded7
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed15:                          ; preds = %_Dynamic_check.succeeded13
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed18:                          ; preds = %_Dynamic_check.succeeded16
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed24:                          ; preds = %_Dynamic_check.succeeded19
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed27:                          ; preds = %_Dynamic_check.succeeded25
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed30:                          ; preds = %_Dynamic_check.succeeded28
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed34:                          ; preds = %_Dynamic_check.succeeded31
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed37:                          ; preds = %_Dynamic_check.succeeded35
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed40:                          ; preds = %_Dynamic_check.succeeded38
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed43:                          ; preds = %_Dynamic_check.succeeded41
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed46:                          ; preds = %_Dynamic_check.succeeded44
  call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed49:                          ; preds = %_Dynamic_check.succeeded47
  call void @llvm.trap() #3
  unreachable
}

declare void @sbx_init()

declare i64 @c_fetch_sandbox_heap_address()

declare i64 @c_fetch_sandbox_heap_bound()

declare dso_local i8* @t_malloc(i64) #1

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #2

declare dso_local i8* @t_strcpy(i8*, i8*) #1

declare dso_local i32 @t_printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { cold noreturn nounwind }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git a3f1552e0ad42796862f01dff9cc9afaa8e02d56)"}
