#include <string.h>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

const int MAX_LEN = 10;

bool strcmp(char* s1, char* s2) {
  return (s1 > s2);
}

typedef struct _vulnerable_struct {
  char buff[MAX_LEN];
  bool (*cmp)(char*,char*);
} vuln;

class Cpi {
public:
  vuln v;

  int is_file_foobar_using_heap(vuln* s, char* one, char* two) {
    // must have strlen(one) + strlen(two) < MAX_LEN
    printf("strcpy %s to the s->buff\n", one);
    // cout << "strcpy " << one << " to the s->buff" << endl;
    strcpy(s->buff, one);
    printf("buff is : %s\n", s->buff);
    // cout << "buff is : " << s->buff << endl;
    printf("strcat %s to the s->buff\n", two);
    // cout << "strcat " << two << " to the s->buff" << endl;
    strcat(s->buff, two);
    // cout << "buff is : " << s->buff << endl;
    printf("buff is : %s\n", s->buff);
    // s->cmp = strcmp;
    // cout << " run the compare " << endl;
    printf("run the compare!\n");
    return s->cmp(s->buff, "file://foobar");
  }

  int test(char* one, char* two) {
    vuln* v = (vuln*) malloc(sizeof(vuln));
    v->cmp = strcmp;
    is_file_foobar_using_heap(v, one, two);
    return 0;
  }
};

int main(int argc, char const *argv[])
{
  /* code */
  Cpi cpi;
  char* s1 = (char*) malloc(sizeof(char) * 10);
  char* s2 = (char*) malloc(sizeof(char) * 10);
  // cout << "input for s1 : ";
  printf("input for s1 : ");
  scanf("%s", s1);
  // cin >> s1;
  // cout << "input for s2 : ";
  printf("input for s2 : ");
  scanf("%s", s2);
  // cin >> s2;
  // cout << "s1 is : " << s1 << endl;
  // cout << "s2 is : " << s2 << endl;
  // cout << "run the test of cpi" << endl;
  printf("s1 is : %s\ns2 is : %s\nrun the test of cpi!\n",
    s1, s2);;
  bool r = cpi.test(s1, s2);
  // cout << "result is " << r << endl;
  printf("result is %i", r);
  return 0;
}