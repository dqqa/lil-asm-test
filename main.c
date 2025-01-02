#include <stdio.h>

int fib(int n);
int do_stuff(void);

int main(void)
{
    int n = 11;
    printf("fib(%d) = %d\n", n, fib(n));

    printf("Do_stuff:\n");
    return do_stuff();
}
