#include<stdio.h>

const int ADMIN_ID = -1;

class User {
public:
  int id;
  int (*cmp)(char*, char*);
  int getid() {
    return id;
  };
  void print() {
    printf("GOOD [%d]\n", getid());
  };
};

class Admin {
public:
  int id = ADMIN_ID;
  int (*cmp)(char*, char*);
  int getid() {
    return id;
  };
  void print() {
    printf("BAD  [%d]\n", getid());
  };
};

void foo() {
  printf("sizeof User : %d, sizeof Admin : %d\n", sizeof(User), sizeof(Admin));
  User* ptr;
  char input[2];
  User user; user.id = 1;
  Admin admin;
  ptr = &user;
  printf("admin   : [%p]\n", &admin);
  printf("user    : [%p]\n", &user);
  printf("input   : [%p]\n", input);
  printf("ptr     : [%p][%p]\n", &ptr, ptr);

  printf("input   : [%p] %x\n", input, *(input));
  printf("input+1 : [%p] %x\n", input + 1, *(input + 1));
  printf("input+2 : [%p] %x\n", input + 2, *(input + 2));
  printf("input+3 : [%p] %x\n", input + 3, *(input + 3));

  scanf("%x", &input);
  printf("user    : [%p]\n", &user);
  printf("admin   : [%p]\n", &admin);
  printf("input   : [%p]\n", input);
  printf("ptr     : [%p][%p]\n", &ptr, ptr);

  printf("input   : [%p] %x\n", input, *(input));
  printf("input+1 : [%p] %x\n", input + 1, *(input + 1));
  printf("input+2 : [%p] %x\n", input + 2, *(input + 2));
  printf("input+3 : [%p] %x\n", input + 3, *(input + 3));

  if (ptr->getid() == ADMIN_ID) {
    printf("* [admin only...!]\n");
  }
    printf("* [normal process]\n");
}

int main(int argc, char const *argv[])
{
  foo();
  return 0;
}