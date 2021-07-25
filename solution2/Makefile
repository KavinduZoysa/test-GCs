LLVM_SUFFIX=-11
CLANG ?= clang$(LLVM_SUFFIX)
OPT ?= opt$(LLVM_SUFFIX)
MAIN_LL = main1.ll
# MAIN_LL = main2.ll
MAIN_EXE = main.exe
RT_O = rt.o
RT_A = rt.a
RT_C = rt.c
RT_LL = rt.ll
RT_GC_LL = rt_gc.ll
RT_OPT_LL = rt_opt.ll
AR=ar

all: $(MAIN_EXE)

$(MAIN_EXE): $(RT_A)
	$(CLANG) $(MAIN_LL) $< -o $@ 

$(RT_A): $(RT_O)
	$(AR) r $@ $^

$(RT_O): $(RT_OPT_LL)
	$(CLANG) -O2 -c -o $@ $<

$(RT_OPT_LL): $(RT_GC_LL)
	$(OPT) --rewrite-statepoints-for-gc -S -o $@ $<

$(RT_GC_LL): $(RT_LL)
	sed -e '/target datalayout/ s/"$$/-ni:1"/' -e 's/define dso_local i8.*/define dso_local i8 addrspace(1)* @foo(i8 addrspace(1)* %0) gc "statepoint-example" {/g' -e 's/call void @dummy_func().*/ /g' -e '/^define dso_local i8.*/a call void @dummy_func()' $< >$@

$(RT_LL): $(RT_C)
	$(CLANG) -S -emit-llvm -o $@ $<

clean:
	-rm -f $(RT_O) $(RT_A) $(RT_LL) $(RT_GC_LL) $(RT_OPT_LL) $(MAIN_EXE)
