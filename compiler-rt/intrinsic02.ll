; ModuleID = 'intrinsic02.c'
source_filename = "intrinsic02.c"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-wrs-vxworks"

@target = global [21 x i8] c"a shiny white sphere\00", align 1
@.str = private unnamed_addr constant [32 x i8] c"Before memmove, target is \22%s\22\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"After memmove, target becomes \22%s\22\0A\00", align 1
@__llvm__cpi_debug_str = internal unnamed_addr constant [5 x i8] c"main\00"
@__llvm__cpi_debug_str.2 = internal unnamed_addr constant [5 x i8] c"main\00"
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @__llvm__cpi.module_init, i8* null }]

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
entry:
  %p = alloca i8*, align 4
  %0 = ptrtoint i8** %p to i32
  %1 = add i32 %0, 4
  %2 = sub i32 %1, 1
  %3 = insertvalue { i32, i32 } undef, i32 %0, 0
  %4 = insertvalue { i32, i32 } %3, i32 %2, 1
  %source = alloca i8*, align 4
  %5 = ptrtoint i8** %source to i32
  %6 = add i32 %5, 4
  %7 = sub i32 %6, 1
  %8 = insertvalue { i32, i32 } undef, i32 %5, 0
  %9 = insertvalue { i32, i32 } %8, i32 %7, 1
  call void @__llvm__cpi_set_bounds(i8** %p, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @target, i32 0, i32 8), { i32, i32 } { i32 ptrtoint ([21 x i8]* @target to i32), i32 sub (i32 add (i32 ptrtoint ([21 x i8]* @target to i32), i32 21), i32 1) })
  %10 = bitcast i8** %p to i8*
  call void @__llvm__cpi_assert_bounds(i8* %10, i32 4, { i32, i32 } %4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__llvm__cpi_debug_str, i32 0, i32 0))
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @target, i32 0, i32 8), i8** %p, align 4, !tbaa !3
  call void @__llvm__cpi_set_bounds(i8** %source, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @target, i32 0, i32 2), { i32, i32 } { i32 ptrtoint ([21 x i8]* @target to i32), i32 sub (i32 add (i32 ptrtoint ([21 x i8]* @target to i32), i32 21), i32 1) })
  %11 = bitcast i8** %source to i8*
  call void @__llvm__cpi_assert_bounds(i8* %11, i32 4, { i32, i32 } %9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__llvm__cpi_debug_str.2, i32 0, i32 0))
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @target, i32 0, i32 2), i8** %source, align 4, !tbaa !3
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([32 x i8]* @.str to i32), i32 sub (i32 add (i32 ptrtoint ([32 x i8]* @.str to i32), i32 32), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 ptrtoint ([21 x i8]* @target to i32), i32 sub (i32 add (i32 ptrtoint ([21 x i8]* @target to i32), i32 21), i32 1) })
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @target, i32 0, i32 0))
  %12 = load i8*, i8** %p, align 4, !tbaa !3
  %13 = load i8*, i8** %source, align 4, !tbaa !3
  %14 = load i8*, i8** %p, align 4, !tbaa !3
  %15 = call i32 @llvm.objectsize.i32.p0i8(i8* %14, i1 false, i1 true)
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 0, i32 -1 })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 0, i32 -1 })
  %call1 = call i8* @__memmove_chk(i8* %12, i8* %13, i32 5, i32 %15) #4
  call void @__llvm__cpi_move_range(i8* %12, i8* %13, i32 5)
  call void @__llvm__cpi_set_arg_bounds(i32 1, { i32, i32 } { i32 ptrtoint ([36 x i8]* @.str.1 to i32), i32 sub (i32 add (i32 ptrtoint ([36 x i8]* @.str.1 to i32), i32 36), i32 1) })
  call void @__llvm__cpi_set_arg_bounds(i32 2, { i32, i32 } { i32 ptrtoint ([21 x i8]* @target to i32), i32 sub (i32 add (i32 ptrtoint ([21 x i8]* @target to i32), i32 21), i32 1) })
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @target, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8*, i8*, i32, i32) #2

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.objectsize.i32.p0i8(i8*, i1, i1) #3

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
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!clang.tbaa.structs = !{}
!clang.tbaa.unions = !{}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any non-void pointer", !5, i64 0}
!5 = !{!"function pointer", !6, i64 0}
!6 = !{!"void pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}

