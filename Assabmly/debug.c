#include <stdio.h>

void dump_stack(void* rsp) {
    unsigned long* ptr = (unsigned long*)rsp;
    printf("🧵 Dump del stack desde %p:\n", rsp);
    for (int i = 0; i < 10; i++) {
        printf("  [%p]  0x%016lx\n", (void*)&ptr[i], ptr[i]);
    }
}
