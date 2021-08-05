LLVM_SUFFIX=-11
CLANG ?= clang$(LLVM_SUFFIX)
# MAIN_LL = main1.ll
MAIN_LL = main2.ll
MAIN_S = main.s
MAIN_TEMP_S = main_temp.s
MAIN_EXE = main.exe
RUNTIME = runtime/rt.a

all: $(MAIN_EXE)

$(MAIN_EXE): $(RUNTIME) $(MAIN_S)
	$(CLANG) $(MAIN_S) $< -o $@ 

$(RUNTIME):
	$(MAKE) -C runtime all

$(MAIN_S): $(MAIN_TEMP_S)
	sed -e "s/__LLVM_StackMaps:/.globl __LLVM_StackMaps\n__LLVM_StackMaps:/" $< >$@

$(MAIN_TEMP_S):
	$(CLANG) $(MAIN_LL) -S -o $@

clean:
	-rm -f $(MAIN_EXE) $(MAIN_S) $(MAIN_TEMP_S)
	$(MAKE) -C runtime clean

