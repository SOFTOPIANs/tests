#include <string.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct _vs {
  char buff[2];
  int (*cmp)(const char*, const char*);
} vuln;

int foo(vuln v) {
    v.cmp = strcmp;
    return v.cmp("Z", "Z");
}

int bar() {
    vuln v;
    v.cmp = strcmp;
    return foo(v);
}

// int main(int argc, char const *argv[])
// {
//   printf("%d\n", bar());
//   return 0;
// }