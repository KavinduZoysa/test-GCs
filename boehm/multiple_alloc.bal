public function balGCInit() = external;
public function balMultipleAlloc() returns int = external;

public function main() {
    balGCInit();
    int i = balMultipleAlloc();
}
