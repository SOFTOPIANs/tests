#include<string.h>

const int MAX_LEN = 10;

typedef struct _vulnerable_struct {
  char buff[MAX_LEN];
  int (*cmp)(char*,char*);
} vulnerable;

int is_file_foobar_using_heap(vulnerable* s, char* one, char* two) {
  // must have strlen(one) + strlen(two) < MAX_LEN
  strcpy(s->buff, one);
  strcat(s->buff, two);
  // s->cmp = strcmp;
  return s->cmp(s->buff, "file://foobar");
}

int test(char* one, char* two) {
  vulnerable* v = (vulnerable*) malloc(sizeof(vulnerable));
  v->cmp = strcmp;
  is_file_foobar_using_heap(v, one, two);
  return 0;
}

void good() {
  test("1234", "56789");
}

void bad() {
  test("aaaaaaaaaaaaaaa", "bbbbbbbbbbbbbbbbbbbbbbb");
}