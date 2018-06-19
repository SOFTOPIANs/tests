#include <string.h>
#include <stdio.h>
#include <stdlib.h>

const int MAX_LEN = 10;

typedef struct _vulnerable_struct {
  char buff[MAX_LEN];
  // int (*cmp)(const char*, const char*);
  void* cmp;
} vulnerable;

int is_file_foobar_using_heap(vulnerable* s, char* one, char* two) {
  strcpy(s->buff, one);
  strcat(s->buff, two);

  // return s->cmp(s->buff, "file://foobar");
  return ((int(*)(const char*, const char*))(s->cmp))(s->buff, "file://foobar");
}

void test(char* one, char* two) {
  vulnerable* v = (vulnerable*) malloc(sizeof(vulnerable));
  v->cmp = strcmp;
  is_file_foobar_using_heap(v, one, two);
}
