#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg)
{
    /* YOUR CODE HERE */
    int head = 0;
    head ^= (((*reg) >> 0) & 1);
    head ^= (((*reg) >> 2) & 1);
    head ^= (((*reg) >> 3) & 1);
    head ^= (((*reg) >> 5) & 1);

    *reg >>= 1;
    *reg = *reg | (head << 15);

}
