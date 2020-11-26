#include <stdio.h>

int fib(int i)
{
  if (i <= 1)
  {
    return i;
  }
  return fib(i - 2) + fib(i - 1);
}

int main()
{
  printf("fib(10) = %d\n", fib(5));
}