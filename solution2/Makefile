LLVM_SUFFIX=-11
CLANG ?= clang$(LLVM_SUFFIX)
BAL_LL = bal.ll
MAIN_EXE = main.exe
RUNTIME = runtime/rt.a

all: $(MAIN_EXE)

$(MAIN_EXE): $(RUNTIME)
	$(CLANG) $(BAL_LL) $< -lm -L ../third-party/libbacktrace/.libs -lbacktrace -o $@ 

$(RUNTIME):
	$(MAKE) -C runtime all

clean:
	-rm -f $(MAIN_EXE)
	$(MAKE) -C runtime clean
