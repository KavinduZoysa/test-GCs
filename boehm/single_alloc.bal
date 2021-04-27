public function balAlloc(int size) returns int = external;

public function main() {
    int pos = balAlloc(64);
}
