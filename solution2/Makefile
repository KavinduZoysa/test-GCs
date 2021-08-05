LLVM_SUFFIX=-11
CLANG ?= clang$(LLVM_SUFFIX)
# MAIN_LL = main1.ll
MAIN_LL = main2.ll
MAIN_EXE = main.exe
RUNTIME = runtime/rt.a

all: $(MAIN_EXE)

$(MAIN_EXE): $(RUNTIME)
	$(CLANG) $(MAIN_LL) $< -o $@ 

$(RUNTIME):
	$(MAKE) -C runtime all

clean:
	-rm -f $(MAIN_EXE)
	$(MAKE) -C runtime clean

