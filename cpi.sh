#!/bin/bash
clang_cpi $1 -S -emit-llvm -fsanitize=cpi -o $1.il
opt_cpi -S -cpi-1 $1.il -o $1.opt.ll