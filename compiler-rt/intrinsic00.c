/* 
   @__llvm__cpi_delete_range
 */

#include <string.h>

struct mydata
{
    int a;
    char b[];
};

int main()
{
    char buf[255];
    struct mydata data;

    bzero(buf, 255); // __llvm__cpi_delete_range
    // bzero((void *)&data, sizeof(data));
}