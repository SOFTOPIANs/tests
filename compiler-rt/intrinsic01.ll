; ModuleID = 'intrinsic01.c'
source_filename = "intrinsic01.c"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-wrs-vxworks"

%struct._mydata = type { i8* }

@.str = private unnamed_addr constant [16 x i8] c"[calloc][1] %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"[assign][1] %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"[memcpy] done.\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"[memcpy][1] %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"[memcpy][2] %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"[reallo][1] %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"[reallo][2] %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [16 x i8] c"[assign][2] %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"[free1 ][1] %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"[free2 ][2] %s\0A\00", align 1
@__llvm__cpi_debug_str = internal unnamed_addr constant [4 x i8] c"bar\00"
@__llvm__cpi_debug_str.10 = internal unnamed_addr constant [4 x i8] c"bar\00"
@__llvm__cpi_debug_str.11 = internal unnamed_addr constant [5 x i8] c"main\00"
@__llvm__cpi_debug_str.12 = internal unnamed_addr constant [5 x i8] c"main\00"
@__llvm__cpi_debug_str.13 = internal unnamed_addr constant [5 x i8] c"main\00"
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @__llvm__cpi.module_init, i8* null }]

; Function Attrs: noinline nounwind optnone
define void @bar(i8* %src, i8* %dst, i32 %size) #0 {
entry:
  %0 = call i32 @__llvm__cpi_get_arg_bounds_base(i32 2)
  %1 = call i32 @__llvm__cpi_get_arg_bounds_last(i32 2)
  %2 = insertvalue { i32, i32 } undef, i32 %0, 0
  %3 = insertvalue { i32, i32 } %2, i32 %1, 1
  %4 = call i32 @__llvm__cpi_get_arg_bounds_base(i32 1)
  %5 = call i32 @__llvm__cpi_get_arg_bounds_last(i32 1)
  %6 = insertvalue { i32, i32 } undef, i32 %4, 0
  %7 = insertvalue { i32, i32 } %6, i32 %5, 1
  %src.addr = alloca i8*, align 4
  %8 = ptrtoint i8** %src.addr to i32
  %9 = add i32 %8, 4
  %10 = sub i32 %9, 1
  %11 = insertvalue { i32, i32 } undef, i32 %8, 0
  %12 = insertvalue { i32, i32 } %11, i32 %10, 1
  %dst.addr = alloca i8*, align 4
  %13 = ptrtoint i8** %dst.addr to i32
  %14 = add i32 %13, 4
  %15 = sub i32 %14, 1
  %16 = insertvalue { i32, i32 } undef, i32 %13, 0
  %17 = insertvalue { i32, i32 } %16, i32 %15, 1
  %size.addr = alloca i32, align 4
  call void @__llvm__cpi_set_bounds(i8** %src.addr, i8* %src, { i32, i32 } %7)
  %18 = bitcast i8** %src.addr to i8*
  call void @__llvm__cpi_assert_bounds(i8* %18, i32 4, { i32, i32 } %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__llvm__cpi_debug_str, i32 0, i32 0))
  store i8* %src, i8** %src.addr, align 4, !tbaa !11
  call void @__llvm__cpi_set_bounds(i8** %dst.addr, i8* %dst, { i32, i32 } %3)
  %19 = bitcast i8** %dst.addr to i8*
  call void @__llvm__cpi_assert_bounds(i8* %19, i32 4, { i32, i32 } %17, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__llvm__cpi_debug_str.10, i32 0, i32 0))
  store i8* %dst, i8** %dst.addr, align 4, !tbaa !11
  store i32 %size, i32* %size.addr, align 4, !tbaa !12
  %20 = load i8*, i8** %src.addr, align 4, !tbaa !11
  %21 = load i8*, i8** %dst.addr, align 4, !tbaa !11
  %22 = load i32, i32* %size.addr, align 4, !tbaa !12
  %23 = load i8*, i8** %src.addr, align 4, !tbaa !11
  %24 = call i32 @llvm.objectsize.i32.p0i8(i8* %23, i1 false, i1 true)
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 0, i32 -1 })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call = call i8* @__memcpy_chk(i8* %20, i8* %21, i32 %22, i32 %24) #7
  call void @__llvm__cpi_copy_range(i8* %20, i8* %21, i32 %22)
  ret void
}

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8*, i8*, i32, i32) #1

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.objectsize.i32.p0i8(i8*, i1, i1) #2

; Function Attrs: noinline nounwind optnone
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 @__llvm__cpi_get_arg_bounds_base(i32 2)
  %1 = call i32 @__llvm__cpi_get_arg_bounds_last(i32 2)
  %2 = insertvalue { i32, i32 } undef, i32 %0, 0
  %3 = insertvalue { i32, i32 } %2, i32 %1, 1
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %4 = ptrtoint i8*** %argv.addr to i32
  %5 = add i32 %4, 4
  %6 = sub i32 %5, 1
  %7 = insertvalue { i32, i32 } undef, i32 %4, 0
  %8 = insertvalue { i32, i32 } %7, i32 %6, 1
  %data1 = alloca %struct._mydata, align 4
  %9 = ptrtoint %struct._mydata* %data1 to i32
  %10 = add i32 %9, 4
  %11 = sub i32 %10, 1
  %12 = insertvalue { i32, i32 } undef, i32 %9, 0
  %13 = insertvalue { i32, i32 } %12, i32 %11, 1
  %data2 = alloca %struct._mydata*, align 4
  %14 = ptrtoint %struct._mydata** %data2 to i32
  %15 = add i32 %14, 4
  %16 = sub i32 %15, 1
  %17 = insertvalue { i32, i32 } undef, i32 %14, 0
  %18 = insertvalue { i32, i32 } %17, i32 %16, 1
  %datas = alloca [10 x i8], align 1
  %i = alloca i32, align 4
  %i19 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !12
  %19 = bitcast i8*** %argv.addr to i8**
  %20 = bitcast i8** %argv to i8*
  call void @__llvm__cpi_set_bounds(i8** %19, i8* %20, { i32, i32 } %3)
  %21 = bitcast i8*** %argv.addr to i8*
  call void @__llvm__cpi_assert_bounds(i8* %21, i32 4, { i32, i32 } %8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__llvm__cpi_debug_str.11, i32 0, i32 0))
  store i8** %argv, i8*** %argv.addr, align 4, !tbaa !4
  %call = call i8* @malloc(i32 4) #8
  %22 = bitcast i8* %call to %struct._mydata*
  %23 = bitcast %struct._mydata** %data2 to i8**
  %24 = bitcast %struct._mydata* %22 to i8*
  call void @__llvm__cpi_set_bounds(i8** %23, i8* %24, { i32, i32 } { i32 0, i32 -1 })
  %25 = bitcast %struct._mydata** %data2 to i8*
  call void @__llvm__cpi_assert_bounds(i8* %25, i32 4, { i32, i32 } %18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__llvm__cpi_debug_str.12, i32 0, i32 0))
  store %struct._mydata* %22, %struct._mydata** %data2, align 4, !tbaa !4
  %call1 = call i8* @calloc(i32 10, i32 1) #9
  call void @__llvm__cpi_alloc(i8* %call1)
  %b = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  call void @__llvm__cpi_set_bounds(i8** %b, i8* %call1, { i32, i32 } { i32 0, i32 -1 })
  %26 = bitcast i8** %b to i8*
  call void @__llvm__cpi_assert_bounds(i8* %26, i32 4, { i32, i32 } %13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__llvm__cpi_debug_str.13, i32 0, i32 0))
  store i8* %call1, i8** %b, align 4, !tbaa !14
  %b2 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %27 = load i8*, i8** %b2, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i8* %27)
  store i32 0, i32* %i, align 4, !tbaa !12
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %28 = load i32, i32* %i, align 4, !tbaa !12
  %cmp = icmp slt i32 %28, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %29 = load i32, i32* %i, align 4, !tbaa !12
  %add = add nsw i32 %29, 65
  %conv = trunc i32 %add to i8
  %b4 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %30 = load i8*, i8** %b4, align 4, !tbaa !14
  %31 = load i32, i32* %i, align 4, !tbaa !12
  %arrayidx = getelementptr inbounds i8, i8* %30, i32 %31
  store i8 %conv, i8* %arrayidx, align 1, !tbaa !16
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %32 = load i32, i32* %i, align 4, !tbaa !12
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %i, align 4, !tbaa !12
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %b5 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %33 = load i8*, i8** %b5, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.1 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.1 to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0), i8* %33)
  %34 = load %struct._mydata*, %struct._mydata** %data2, align 4, !tbaa !4
  %35 = bitcast %struct._mydata* %34 to i8*
  %36 = bitcast %struct._mydata* %data1 to i8*
  %37 = load %struct._mydata*, %struct._mydata** %data2, align 4, !tbaa !4
  %38 = bitcast %struct._mydata* %37 to i8*
  %39 = call i32 @llvm.objectsize.i32.p0i8(i8* %38, i1 false, i1 true)
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 0, i32 -1 })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } %13)
  %call7 = call i8* @__memcpy_chk(i8* %35, i8* %36, i32 4, i32 %39) #7
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.2 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.2 to i32), i32 16), i32 1) })
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  %b9 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %40 = load i8*, i8** %b9, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.3 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.3 to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0), i8* %40)
  %41 = load %struct._mydata*, %struct._mydata** %data2, align 4, !tbaa !4
  %b11 = getelementptr inbounds %struct._mydata, %struct._mydata* %41, i32 0, i32 0
  %42 = load i8*, i8** %b11, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.4 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.4 to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0), i8* %42)
  %b13 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %43 = load i8*, i8** %b13, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 0, i32 -1 })
  %44 = call i32 @__llvm__cpi_malloc_size(i8* %43)
  %call14 = call i8* @realloc(i8* %43, i32 20) #10
  call void @__llvm__cpi_realloc(i8* %call14, i32 20, i8* %43, i32 %44)
  %b15 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %45 = load i8*, i8** %b15, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.5 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.5 to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i32 0, i32 0), i8* %45)
  %46 = load %struct._mydata*, %struct._mydata** %data2, align 4, !tbaa !4
  %b17 = getelementptr inbounds %struct._mydata, %struct._mydata* %46, i32 0, i32 0
  %47 = load i8*, i8** %b17, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.6 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.6 to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i32 0, i32 0), i8* %47)
  store i32 0, i32* %i19, align 4, !tbaa !12
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc28, %for.end
  %48 = load i32, i32* %i19, align 4, !tbaa !12
  %cmp21 = icmp slt i32 %48, 20
  br i1 %cmp21, label %for.body23, label %for.end30

for.body23:                                       ; preds = %for.cond20
  %49 = load i32, i32* %i19, align 4, !tbaa !12
  %add24 = add nsw i32 %49, 65
  %conv25 = trunc i32 %add24 to i8
  %b26 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %50 = load i8*, i8** %b26, align 4, !tbaa !14
  %51 = load i32, i32* %i19, align 4, !tbaa !12
  %arrayidx27 = getelementptr inbounds i8, i8* %50, i32 %51
  store i8 %conv25, i8* %arrayidx27, align 1, !tbaa !16
  br label %for.inc28

for.inc28:                                        ; preds = %for.body23
  %52 = load i32, i32* %i19, align 4, !tbaa !12
  %inc29 = add nsw i32 %52, 1
  store i32 %inc29, i32* %i19, align 4, !tbaa !12
  br label %for.cond20

for.end30:                                        ; preds = %for.cond20
  %b31 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %53 = load i8*, i8** %b31, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.1 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.1 to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0), i8* %53)
  %54 = load %struct._mydata*, %struct._mydata** %data2, align 4, !tbaa !4
  %b33 = getelementptr inbounds %struct._mydata, %struct._mydata* %54, i32 0, i32 0
  %55 = load i8*, i8** %b33, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.7 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.7 to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.7, i32 0, i32 0), i8* %55)
  %b35 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %56 = load i8*, i8** %b35, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 0, i32 -1 })
  call void @__llvm__cpi_free(i8* %56)
  call void @free(i8* %56)
  %57 = load %struct._mydata*, %struct._mydata** %data2, align 4, !tbaa !4
  %58 = bitcast %struct._mydata* %57 to i8*
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 0, i32 -1 })
  call void @free(i8* %58)
  %b36 = getelementptr inbounds %struct._mydata, %struct._mydata* %data1, i32 0, i32 0
  %59 = load i8*, i8** %b36, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.8 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.8 to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i32 0, i32 0), i8* %59)
  %60 = load %struct._mydata*, %struct._mydata** %data2, align 4, !tbaa !4
  %b38 = getelementptr inbounds %struct._mydata, %struct._mydata* %60, i32 0, i32 0
  %61 = load i8*, i8** %b38, align 4, !tbaa !14
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([16 x i8]* @.str.9 to i32), i32 sub (i32 add (i32 ptrtoint ([16 x i8]* @.str.9 to i32), i32 16), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i32 0, i32 0), i8* %61)
  ret i32 0
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i32) #3

; Function Attrs: allocsize(0,1)
declare i8* @calloc(i32, i32) #4

declare i32 @printf(i8*, ...) #5

; Function Attrs: allocsize(1)
declare i8* @realloc(i8*, i32) #6

declare void @free(i8*) #5

declare void @__llvm__cpi_init()

declare void @__llvm__cpi_set(i8**, i8*)

declare { i32, i32 } @__llvm__cpi_assert(i8**, i8*, i8*)

declare void @__llvm__cpi_set_bounds(i8**, i8*, { i32, i32 })

declare void @__llvm__cpi_assert_bounds(i8*, i32, { i32, i32 }, i8*)

declare i8* @__llvm__cpi_get_metadata(i8**)

declare i8* @__llvm__cpi_get_metadata_nocheck(i8**)

declare i8* @__llvm__cpi_get_val(i8*)

declare i32 @__llvm__cpi_get_bounds_base(i8*)

declare i32 @__llvm__cpi_get_bounds_last(i8*)

declare void @__llvm__cpi_set_arg_bounds(i32, { i32, i32 })

declare i32 @__llvm__cpi_get_arg_bounds_base(i32)

declare i32 @__llvm__cpi_get_arg_bounds_last(i32)

declare void @__llvm__cpi_delete_range(i8*, i32)

declare void @__llvm__cpi_copy_range(i8*, i8*, i32)

declare void @__llvm__cpi_move_range(i8*, i8*, i32)

declare i32 @__llvm__cpi_malloc_size(i8*)

declare void @__llvm__cpi_alloc(i8*)

declare void @__llvm__cpi_realloc(i8*, i32, i8*, i32)

declare void @__llvm__cpi_free(i8*)

declare void @__llvm__cpi_dump(i8**)

define internal void @__llvm__cpi.module_init() {
  call void @__llvm__cpi_init()
  call void @__llvm__cpi_dump(i8** null)
  ret void
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "cpi" "disable-tail-calls"="false" "has-cpi" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { allocsize(0,1) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { allocsize(1) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { allocsize(0) }
attributes #9 = { allocsize(0,1) }
attributes #10 = { allocsize(1) }

!llvm.module.flags = !{!0, !1}
!clang.tbaa.structs = !{!2}
!clang.tbaa.unions = !{}
!llvm.ident = !{!10}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{%struct._mydata undef, !3}
!3 = !{i64 0, i64 4, !4}
!4 = !{!5, !5, i64 0}
!5 = !{!"any non-void pointer", !6, i64 0}
!6 = !{!"function pointer", !7, i64 0}
!7 = !{!"void pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
!11 = !{!7, !7, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !8, i64 0}
!14 = !{!15, !5, i64 0}
!15 = !{!"_mydata", !5, i64 0}
!16 = !{!8, !8, i64 0}

