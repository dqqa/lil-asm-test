#include <stdio.h>
#include <inttypes.h>

int fib(int n);
int do_stuff(void);
uint64_t tick(void);

int main(void)
{
    int n = 11;
    uint64_t start, end;

    start = tick();
    printf("fib(%d) = %d\n", n, fib(n));
    end = tick();

    printf("It took %" PRIu64 " ticks.\n", end - start);

    printf("Do_stuff:\n");
    return do_stuff();
}
