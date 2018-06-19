#include <string.h>

struct mydata
{
    int a;
    char b[255];
};

int main()
{
    char buf[255];
    struct mydata data;

    bzero(buf, 255); // __llvm__cpi_delete_range
    // bzero((void *)&data, sizeof(data));
}