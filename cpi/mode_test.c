#include<stdio.h>

int main(int argc, char const *argv[])
{
    char buf[10];
    printf("buf  : %p\n", buf);
    int input; scanf("%d", &input);
    int *q = buf + input;
    printf("q    : %p\n", q);
    return 0;
}
