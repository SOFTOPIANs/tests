#include<string.h>

void func(char *str) {
  char buffer[12];
  int variable_a;
  strcpy(buffer, str);
}

int main() {
  char *str = "I am greater than 12 bytes";
  func(str);
}