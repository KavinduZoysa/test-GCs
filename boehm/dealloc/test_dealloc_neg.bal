public function balGCInit() = external;
public function balAllocWithoutReturn(int size, int val) = external;
public function balAllocWithReturn(int size, int val) returns int = external;
public function readPos() returns int = external;
public function assertVal(int val, int size, int pos) = external;

public function print_integer(int val) = external;

public function main() {
    int val = 2147483647;
    balGCInit();
    int pos = balAllocWithReturn(18000, val);
    int i = balAllocWithReturn(17000, 0);

    assertVal(val, 18000, pos);
}
