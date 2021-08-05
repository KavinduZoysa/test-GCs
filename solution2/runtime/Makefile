LLVM_SUFFIX=-11
CLANG ?= clang$(LLVM_SUFFIX)
OPT ?= opt$(LLVM_SUFFIX)
RT_O = rt.o
RT_A = rt.a
RT_C = rt.c
RT_TEMP_S = rt_temp.s
RT_S = rt.s
RT_LL = rt.ll
RT_GC_LL = rt_gc.ll
RT_OPT_LL = rt_opt.ll

MAIN_C = main.c
MAIN_O = main.o
AR=ar

all: $(RT_A)

$(RT_A): $(RT_O) $(MAIN_O)
	$(AR) r $@ $^

$(RT_O): $(RT_S)
	$(CLANG) -c $< -o $@

$(RT_S): $(RT_TEMP_S)
	sed -e "s/__LLVM_StackMaps:/.globl __LLVM_StackMaps\n__LLVM_StackMaps:/" $< >$@

$(RT_TEMP_S): $(RT_OPT_LL)
	$(CLANG) -O2 -S -o $@ $<

$(MAIN_O):
	$(CLANG) -O2 -c -o $@ $(MAIN_C)

$(RT_OPT_LL): $(RT_GC_LL)
	$(OPT) --rewrite-statepoints-for-gc -S -o $@ $<

$(RT_GC_LL): $(RT_LL)
	sed -e '/target datalayout/ s/"$$/-ni:1"/' -e 's/define dso_local i8.*/define dso_local i8 addrspace(1)* @rt_func(i8 addrspace(1)* %0) gc "statepoint-example" {/g' -e 's/call void @dummy_func_to_gen_statepoints().*/ /g' -e '/^define dso_local i8.*/a call void @dummy_func_to_gen_statepoints()' $< >$@

$(RT_LL): $(RT_C)
	$(CLANG) -S -emit-llvm -o $@ $<

clean:
	-rm -f $(RT_O) $(RT_A) $(RT_LL) $(RT_GC_LL) $(RT_OPT_LL) $(RT_S) $(RT_TEMP_S) $(MAIN_O)