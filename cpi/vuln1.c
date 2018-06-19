#include <string.h>
#include <stdio.h>
#include <stdlib.h>

const int MAX_LEN = 10;

typedef struct _vulnerable_struct {
  char buff[MAX_LEN];
  int (*cmp)(const char*, const char*);
} vulnerable;

typedef struct _vulnerable_struct_wrap {
  char buff[MAX_LEN];
  void* vul;
} vulnerable_wrap;

int is_file_foobar_using_heap(vulnerable_wrap* s, char* one, char* two) {
  strcpy(s->buff, one);
  strcat(s->buff, two);
  strcpy(((vulnerable*) s->vul)->buff, two);
  strcat(((vulnerable*) s->vul)->buff, one);

  printf("addr of s           : %p\n"
  "addr of &s.buff     : %p\n"
  "addr of &s.vul      : %p\n"
  "addr of &s.vul.buff : %p\n"
  "addr of &s.vul.cmp  : %p\n"
  "addr of s.buff      : %p\n"
  "addr of s.vul.buff  : %p\n"
  "addr of s.vul.cmp   : %p\n", s, 
    &s->buff, 
    &s->vul, 
    &((vulnerable*) s->vul)->buff, 
    &((vulnerable*) s->vul)->cmp, 
    s->buff, 
    ((vulnerable*) s->vul)->buff, 
    ((vulnerable*) s->vul)->cmp);

  return ((vulnerable*) s->vul)->cmp(s->buff, "file://foobar");
}

void test(char* one, char* two) {
  vulnerable_wrap* v   = (vulnerable_wrap*) malloc(sizeof(vulnerable_wrap));
  vulnerable*      vul = (vulnerable*) malloc(sizeof(vulnerable));
  v->vul = (void* ) vul;
  vul->cmp = strcmp;

  printf("addr of v           : %p\n"
  "addr of &v.buff     : %p\n"
  "addr of &v.vul      : %p\n"
  "addr of &v.vul.buff : %p\n"
  "addr of &v.vul.cmp  : %p\n"
  "addr of v.buff      : %p\n"
  "addr of v.vul.buff  : %p\n"
  "addr of v.vul.cmp   : %p\n", v, 
    &v->buff, 
    &v->vul, 
    &((vulnerable*) v->vul)->buff, 
    &((vulnerable*) v->vul)->cmp, 
    v->buff, 
    ((vulnerable*) v->vul)->buff, 
    ((vulnerable*) v->vul)->cmp);

  int ret = is_file_foobar_using_heap(v, one, two);

  printf("Buffer:  %s\n"
  "vul.Buffer:  %s\n"
  "Comparison = %d\n", v->buff, ((vulnerable*)v->vul)->buff, ret);
}

void good() {
  test("12345", "6789");
}

void bad() {
  test("aaaaaaaaaaaaaaaaaaaa", "bbbbbbbbbbbbbbbbbbbb");
}