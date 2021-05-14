## Instructions

1. Generate LLVM IR
    
       clang-11 -S -emit-llvm main.c -o main.ll

2. Change the function signature of function `main` and `bar` to attach GC. Both methods should contain ` gc "statepoint-example"`

3. Generate safe points

       opt-11 --rewrite-statepoints-for-gc main.ll -S -o main-statepoints.ll

4. Generate the stack map

       llc-11 -O0 main-statepoints.ll -o main-statepoints.s

5. Generate the executable

       clang-11 -c main-statepoints.s -o main-statepoints.o && clang-11 -c stackmap-reader.c -o stackmap-reader.o && clang-11 stackmap-reader.o main-statepoints.o

6. Run

       ./a.out

Now you can see an output like this.

```
StackMap location : 0x400d70
StackMap version : 3


Number of function (which enable GCs) : 2
Number of constants : 0
Total number of function calls(safepoints) : 3

***************** Functions (which enable GCs) Info *****************
Function address : 0x4009d0
Stack size : 24
Function calls count(safepoints) : 1

Function address : 0x400a00
Stack size : 24
Function calls count(safepoints) : 2

***************** Records(Safe Points) Info *****************
0x400d80
Patch id : 2882400000
Code Offset : 33
Flags : 0
Number of locations (marked references) : 3

	***************** Locations(Marked References)Info *****************
	Kind : 4
	Flags : 0
	Location Size : 8
	Reg Num : 0
	Reserved : 0
	Offset : 0

	Kind : 4
	Flags : 0
	Location Size : 8
	Reg Num : 0
	Reserved : 0
	Offset : 0

	Kind : 4
	Flags : 0
	Location Size : 8
	Reg Num : 0
	Reserved : 0
	Offset : 0

Padding : 0
Padding : 0
Number of LiveOuts : 0
0x400dc0
Patch id : 2882400000
Code Offset : 60
Flags : 0
Number of locations (marked references) : 3

	***************** Locations(Marked References)Info *****************
	Kind : 4
	Flags : 0
	Location Size : 8
	Reg Num : 0
	Reserved : 0
	Offset : 0

	Kind : 4
	Flags : 0
	Location Size : 8
	Reg Num : 0
	Reserved : 0
	Offset : 0

	Kind : 4
	Flags : 0
	Location Size : 8
	Reg Num : 0
	Reserved : 0
	Offset : 0

Padding : 0
Padding : 0
Number of LiveOuts : 0
0x400e00
Patch id : 2882400000
Code Offset : 73
Flags : 0
Number of locations (marked references) : 3

	***************** Locations(Marked References)Info *****************
	Kind : 4
	Flags : 0
	Location Size : 8
	Reg Num : 0
	Reserved : 0
	Offset : 0

	Kind : 4
	Flags : 0
	Location Size : 8
	Reg Num : 0
	Reserved : 0
	Offset : 0

	Kind : 4
	Flags : 0
	Location Size : 8
	Reg Num : 0
	Reserved : 0
	Offset : 0

Padding : 0
Padding : 0
Number of LiveOuts : 0
```
