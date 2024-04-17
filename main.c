#include <stdio.h>
#include <stdint.h>

extern uint64_t collatz_orbit(uint64_t n, uint64_t k);

int main(void) {
    uint64_t n = 24;
    uint64_t k = 3;
    printf("Collatz orbit of n=%lu and k=%lu is %lu\n", n, k, collatz_orbit(n, k));
    return 0;
}