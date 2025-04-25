#include <stdint.h>

uint64_t collatz_orbit(uint64_t n, uint64_t k) {
    if (n==0) {
        return 0;
    }
    uint64_t i;
    for (i=0; i<k; i++) {
        if (n%2==0) {
            n = n/2;
        } 
        else {
            if (n > (UINT64_MAX - 1)/3) {
                return 0;
            }
            n = 3*n + 1;
        }
    }
    return n;
}
