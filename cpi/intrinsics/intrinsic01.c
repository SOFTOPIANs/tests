/* 
   @__llvm__cpi_copy_range
   @__llvm__cpi_alloc
   @__llvm__cpi_malloc_size
   @__llvm__cpi_realloc
   @__llvm__cpi_free
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _mydata
{
    char *b;
} mydata;

void bar(void* src, void* dst, unsigned size) {
    memcpy(src, dst, size);
    // @__llvm__cpi_copy_range
}

int main(int argc, char const *argv[]) {
    mydata data1;
    mydata* data2 = (mydata*) malloc(sizeof(mydata));
    char datas[10];

    data1.b = calloc(10, sizeof(char));
    // @__llvm__cpi_alloc

    printf("[calloc][1] %s\n", data1.b);

    for (int i=0; i < 10; i++) {
      data1.b[i] = (char) (i + 65);
    }

    printf("[assign][1] %s\n", data1.b);

    // copy data -> data2
    // memcpy(data2, &data1, sizeof(mydata));
    bar(data2, &data1, sizeof(mydata));

    printf("[memcpy] done.\n");

    printf("[memcpy][1] %s\n", data1.b);
    printf("[memcpy][2] %s\n", data2->b);

    realloc(data1.b, 20);
    // @__llvm__cpi_malloc_size
    // @__llvm__cpi_realloc

    printf("[reallo][1] %s\n", data1.b);
    printf("[reallo][2] %s\n", data2->b);

    for (int i=0; i < 20; i++) {
      data1.b[i] = (char) (i + 65);
    }

    printf("[assign][1] %s\n", data1.b);
    printf("[assign][2] %s\n", data2->b);

    free(data1.b);
    // @__llvm__cpi_free

    free(data2);

    printf("[free1 ][1] %s\n", data1.b);
    printf("[free2 ][2] %s\n", data2->b);

    return 0;
}