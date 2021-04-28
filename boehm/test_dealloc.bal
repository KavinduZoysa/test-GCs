public function balGCInit() = external;
public function balAlloc(int value) returns int = external;
public function balMultipleAlloc() returns int = external;
public function balInitialize(int pos, int val) = external;
public function balDeInitialize(int pos) returns int = external;

public function print_integer(int val) = external;

public function main() {
    balGCInit();
    int pos = balAlloc(64);
    int val = 201;
    balInitialize(pos, val);

    int i = balMultipleAlloc();
    int x = balDeInitialize(pos); // should equal val
    print_integer(x); 
}
