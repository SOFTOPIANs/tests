#include<string.h>
#include<stdlib.h>
#include<stdio.h>

const int MAX_LEN = 10;

typedef struct _vulnerable_struct {
  char buff[MAX_LEN];
  int (*cmp)(const char*,const char*);
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
  return is_file_foobar_using_heap(v, one, two);
}

int good() {
  return test("1234", "56789");
}

int bad() {
  return test("aaaaaaaa", "bbbbbbbbbbb");
}

int main(int argc, char const *argv[])
{
  printf("result of good : %d\n", good());
  printf("result of bad  : %d\n", bad());
  return 0;
}
