#include <string.h>
#include <stdio.h>
#include <stdlib.h>

const int MAX_LEN = 10;

typedef struct _vs {
  char buff[MAX_LEN];
  int (*cmp)(const char*, const char*);
} vs;

typedef struct _vs_wrap {
  char buff[MAX_LEN];
  void* vul;
} vs_wrap;

int is_file_foobar_using_heap(vs_wrap* s, char* one, char* two) {
  strcpy(((vs*) s->vul)->buff, two);
  // strcat(((vs*) s->vul)->buff, one);
  return ((vs*) s->vul)->cmp(s->buff, "file://foobar");
}

void test(char* one, char* two) {
  vs_wrap* v   = (vs_wrap*) malloc(sizeof(vs_wrap));
  vs*      vul = (vs*) malloc(sizeof(vs));
  v->vul = (void* ) vul;
  vul->cmp = strcmp;

  int ret = is_file_foobar_using_heap(v, one, two);
}
