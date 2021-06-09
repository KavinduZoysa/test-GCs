extern void foo(long, long);
extern void sig_init();

int main() {
    sig_init();

    foo(1, 0);
    return 0;
}
