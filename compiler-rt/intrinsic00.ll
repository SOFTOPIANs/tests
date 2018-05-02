; ModuleID = 'intrinsic00.c'
source_filename = "intrinsic00.c"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-wrs-vxworks"

%struct.mydata = type { i32, [0 x i8] }

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @__llvm__cpi.module_init, i8* null }]

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
entry:
  %buf = alloca [255 x i8], align 1
  %data = alloca %struct.mydata, align 4
  %arraydecay = getelementptr inbounds [255 x i8], [255 x i8]* %buf, i32 0, i32 0
  call void @llvm.memset.p0i8.i32(i8* %arraydecay, i8 0, i32 255, i32 1, i1 false)
  call void @__llvm__cpi_delete_range(i8* %arraydecay, i32 255)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

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
attributes #1 = { argmemonly nounwind }

!llvm.module.flags = !{!0, !1}
!clang.tbaa.structs = !{!2}
!clang.tbaa.unions = !{}
!llvm.ident = !{!3}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{%struct.mydata undef, null}
!3 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}

