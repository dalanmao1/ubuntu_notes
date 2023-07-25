#include <cstdlib>
#include <iostream>

#include "TutorialConfig.h"
#include "head.h"

int main(int argc, char const *argv[]) {
  const double inputValue = std::stod(argv[1]);
  int a = 20;
  int b = 12;
  printf("a = %d, b = %d\n", a, b);
  printf("a + b = %d\n", add(a, b));
  printf("a - b = %d\n", subtract(a, b));
  printf("a / b = %f\n", divide(a, b));
  printf("a * b = %d\n", multiply(a, b));
  printf("a / b = %f\n", divide(a, b));
  std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR << "."
            << Tutorial_VERSION_MINOR << std::endl;
  std::cout << "Usage: " << argv[0] << " number" << std::endl;
  return 0;
}
