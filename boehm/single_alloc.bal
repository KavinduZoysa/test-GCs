public function balGCInit() = external;
public function balAlloc(int size) returns int = external;

public function main() {
    balGCInit();
    int pos = balAlloc(64);
}
