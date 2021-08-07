LLVM_SUFFIX=-11
CLANG ?= clang$(LLVM_SUFFIX)
BAL_LL = bal.ll
BAL_S = bal.s
MAIN_EXE = main.exe
RUNTIME = runtime/rt.a

all: $(MAIN_EXE)

$(MAIN_EXE): $(RUNTIME) $(BAL_S)
	$(CLANG) $(BAL_S) $< -lm -L ../third-party/libbacktrace/.libs -lbacktrace -o $@ 

$(RUNTIME):
	$(MAKE) -C runtime all

$(BAL_S):
	$(CLANG) $(BAL_LL) -S -o $@

clean:
	-rm -f $(MAIN_EXE) $(BAL_S)
	$(MAKE) -C runtime clean
