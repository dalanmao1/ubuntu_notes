#include <cstdlib>
#include <iostream>
#include "config.h"
using namespace std;


#ifdef USE_MYLIB
  #include "head.h"
#else
  #include <math.h>
#endif

int main(int argc, char const *argv[]) {
  int a = 20;
  int b = 12;
  printf("a = %d, b = %d\n", a, b);
  printf("a + b = %d\n", add(a, b));
  printf("a - b = %d\n", subtract(a, b));
  printf("a / b = %f\n", divide(a, b));
  printf("a * b = %d\n", multiply(a, b));
  printf("a / b = %f\n", divide(a, b));

  #ifdef USE_MYLIB
  cout<<"use my lib"<<endl;
  #else
  cout<<"don't use my lib"<<endl;
  #endif
  return 0;
}
