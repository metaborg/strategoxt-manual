#include <stdio.h>

struct Try
{
   int x;
   double y;
};

void set(struct Try *this, int x, double y1)
{
   this -> x = x;
   this -> y = y1;
}

void print(struct Try *this)
{
  printf("x = %d, %f = \n", this -> x, this -> y);
}

int main(int argc, char** args)
{
  struct Try t;
  set(&t, 7, 8.5);
  print(&t);
}
