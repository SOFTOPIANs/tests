void bar(int* p) {
  char c;
  p = &c;
}

void foo()
{
  int a, b;
  int *p;
  p = &a;
  p = &b;
  bar(p);
}